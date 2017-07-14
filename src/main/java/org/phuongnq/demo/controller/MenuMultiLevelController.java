package org.phuongnq.demo.controller;

import java.util.List;

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
		model.addAttribute("categories", service.findListOriginals());
		return "home";
	}
	
    @RequestMapping( method=RequestMethod.GET, value="/getChildren/{id}" )
    public ModelAndView getChildren(@PathVariable long id , Model model ) {
    	List<CategoryEntity> categories = service.getChildren(id);
    	if(categories.size() > 0 ){
    		model.addAttribute("categories", service.getChildren(id));
    		return new ModelAndView( "_category" );
    	}
    	return null;
    }
}
