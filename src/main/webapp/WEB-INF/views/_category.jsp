<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
	<c:forEach var="category" items="${categories}">
		<li class="item-${category.getId()} deeper parent">
            <a class="" href="#">
                 <span data-toggle="collapse" data-parent="#menu-group-${parentId}" 
                 	href="#sub-item-${category.getId()}" class="sign" >
                 	<i class="fa fa-angle-double-right" id="span-${category.getId()}" style="font-size:18px;"> </i></span>
                 <span class="lbl">${category.getName()}</span>
            </a>
            <ul class="children nav-child unstyled small collapse parent-${parentId}" id="sub-item-${category.getId()}">
            </ul>
       	</li>
		<%-- <div id="${category.getId()}" class="category-${parentId}" >
			${category.getName()}<br>
			<div id="response-${category.getId()}" style="padding-left: 15px;"></div>
		</div> --%>
		
	</c:forEach>
<script type="text/javascript">
var parentId = ${parentId};
$(".parent-"+parentId).each(function(index) {
	var id = $(this).attr("id").replace ( /[^\d.]/g, '' );
	$.ajax({
	    url: 'http://localhost:8080/org.phuongnq.demo/getChildren/'+id,
	    type : "GET",
		dataType : "html",
		cache : false,
		async: false,
		success : function(data) {
			if(data != ''){
				$("#sub-item-"+id).html(data);
			}else{
				$("#span-"+id).removeClass("fa-angle-double-right");
				$("#span-"+id).addClass("fa-ban");
			}
		}
	});
});
</script>
