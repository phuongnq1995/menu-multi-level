<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<c:set var="parentId" value="${categories.get(0).getParent() == null ? 0 : categories.get(0).getParent().getId()}"></c:set>
	<c:forEach var="category" items="${categories}">
		<div id="${category.getId()}" class="category-${parentId}" >
			${category.getName()}<br>
			<div id="response-${category.getId()}" style="padding-left: 15px;"></div>
		</div>
	</c:forEach>
<script type="text/javascript">
var parentId = ${parentId};
$(".category-"+parentId).each(function(index) {
	var id = $(this).attr("id");
	$.ajax({
	    url: 'http://localhost:8080/org.phuongnq.demo/getChildren/'+id,
	    type : "GET",
		dataType : "html",
		cache : false,
		async: false,
		success : function(data) {
			$("#response-"+id).html(data);
		}
	});
});
</script>
