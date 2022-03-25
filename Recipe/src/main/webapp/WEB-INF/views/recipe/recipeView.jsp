<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div align="center">
	<c:forEach var="i" begin="1" end="20">
	
		<c:set var="manual" value="manual${i }" />
		
		<c:set var="image" value="manualImage${i }" />
		
		<c:if test="${not empty recipe[manual] }">
		
 		<h4>${recipe[manual] }</h4>
 		
 		</c:if>
 		
 		<c:if test="${not empty recipe[image] }">
 		
		<img src="${recipe[image]}" width = "150px" height="150px">
		
		</c:if>
		
	</c:forEach>
	
	<h1>완성</h1>
	<img src="${recipe.recipeImageLg }">
</div>
