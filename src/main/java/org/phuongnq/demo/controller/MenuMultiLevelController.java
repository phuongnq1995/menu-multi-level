package org.phuongnq.demo.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.phuongnq.demo.model.CategoryEntity;
import org.phuongnq.demo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuMultiLevelController {

	@Autowired
	private CategoryService service;
	
	@RequestMapping("/")
	public String home(Model model){
		List<CategoryEntity> categories = service.findListOriginals();
		model.addAttribute("categories", categories);
		model.addAttribute("parentId", 0);
		return "home";
	}
	
    @RequestMapping( method=RequestMethod.GET, value="/getChildren/{id}" )
    public ModelAndView getChildren(@PathVariable long id , Model model ) {
    	List<CategoryEntity> categories = service.getChildren(id);
    	if(categories.size() > 0 ){
    		model.addAttribute("categories", categories);
    		model.addAttribute("parentId", categories.get(0).getParent().getId());
    		return new ModelAndView( "_category" );
    	}
    	return null;
    }
    
    @RequestMapping( method=RequestMethod.GET, value="/getalljson")
    public ModelAndView jsonViewResult() throws JSONException {
    	ModelAndView mav = new ModelAndView("jsonView");
    	List<CategoryEntity> categories = service.findListOriginals();

    	mav.addObject("children", jsonResult(categories, new JSONObject()).toString());
    	return mav;
    }
    

	private JSONArray jsonResult(List<CategoryEntity> categories, JSONObject jsonObject) throws JSONException{
		JSONArray jsonArray = new JSONArray();
		for(CategoryEntity category: categories){
	    	JSONObject jsonchil = new JSONObject();
			jsonchil.put("id", category.getId());
			jsonchil.put("name", category.getName());
			if(!category.getChildren().isEmpty()){
	    		jsonchil.put("children", jsonResult(category.getChildren(), jsonObject));
			}
			jsonArray.put(jsonchil);
	    }
    	return jsonArray;
    }
    
    @RequestMapping("/export")
    public String getPage(Model model){
    	model.addAttribute("categories", service.findAll());
    	return "export";
    }
    
    @RequestMapping("/export_excel")
    public void exportExcel(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	
        File temp = File.createTempFile("template", ".xls");
        temp.deleteOnExit();
        
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheetActive = (HSSFSheet) workbook.createSheet("SheetName");
        
        Cell cell = null;
        
        int row = 3;
        
        Row rows = sheetActive.createRow(1);
        
        cell = sheetActive.getRow(1).createCell(2);
        cell.setCellValue("List");
        
        List<CategoryEntity> lists = service.findAll();
        for(CategoryEntity entity : lists){
        	rows = sheetActive.createRow(row);
    		
            cell = rows.createCell((short) 1);
            cell.setCellValue(lists.indexOf(entity));

            cell = rows.createCell((short) 2);
            cell.setCellValue(entity.getId());
            
            cell = rows.createCell((short) 3);
            cell.setCellValue(entity.getName());
            
            row++;
        }
        FileOutputStream outFile = new FileOutputStream(temp);
        workbook.write(outFile);
        outFile.close();

        File fileOut = temp;
        
        FileInputStream fileInuptStream1 = new FileInputStream(fileOut);
        BufferedInputStream bufferedInputStream1 = new BufferedInputStream(fileInuptStream1);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int start = 0;
        int length = 1024;
        int offset = -1;
        byte[] buffer = new byte[length];

        // Write BufferedInputStream
        while ((offset = bufferedInputStream1.read(buffer, start, length)) != -1) {
            byteArrayOutputStream.write(buffer, start, offset);
        }

        // Close inputStream & outputstream
        bufferedInputStream1.close();
        byteArrayOutputStream.flush();
        byteArrayOutputStream.close();
        
        response.addHeader("Content-Disposition", "attachment;filename=\"danhsach.xls\" ");
        response.setContentType("application/octet-stream ; charset=utf-8");
        
    	OutputStream out = response.getOutputStream();
    	out.write(byteArrayOutputStream.toByteArray());
        out.flush();
        out.close();
        fileOut.delete();
    }
}
