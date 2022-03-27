<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div align="center">
	<c:forEach var="i" begin="1" end="20">
		<!-- manual 1~20까지 출력 -->
		<c:set var="manual" value="manual${i }" />
		
		<!-- manualImage 1~20까지 출력 -->
		<c:set var="image" value="manualImage${i }" />
		
		<!-- EL문안에 EL문 입력 -->
		<c:if test="${not empty recipe[manual] }">

			<h4>${recipe[manual] }</h4>

		</c:if>

		<c:if test="${not empty recipe[image] }">

			<img src="${recipe[image]}" style="width: 350px;">

		</c:if>

	</c:forEach>

	<h1>완성</h1>
	<img src="${recipe.recipeImageLg }" style="width: 450px;">
</div>
