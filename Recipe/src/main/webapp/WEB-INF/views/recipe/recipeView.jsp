<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div align="center">
	<form id="recipeViewFrm" name="recipeViewFrm" method="post">
		<h1>${recipe.userAlias }</h1>
		<input type="hidden" name="recipeSeq" value="${recipe.recipeSeq}">
		<c:forEach var="i" begin="1" end="20">
			<!-- manual 1~20까지 출력 -->
			<c:set var="manual" value="manual${i }" />

			<!-- manualImage 1~20까지 출력 -->
			<c:set var="image" value="manualImage${i }" />

			<!-- EL문안에 EL문 입력 -->
			<c:if test="${not empty recipe[manual] }">
				<c:if test="${'' ne recipe[manual]}">
					<h4>${recipe[manual] }</h4>
				</c:if>

			</c:if>

			<c:if test="${not empty recipe[image] }">
				<c:if test="${'' ne recipe[image]}">
					<img src="${recipe[image]}" style="width: 350px;">
				</c:if>
			</c:if>

		</c:forEach>

		<h1>완성</h1>
		<img src="${recipe.recipeImageLg }" style="width: 450px;">
		<c:if test="${userAlias eq recipe.userAlias }">
			<div align="center">
				<button type="submit" onclick="update()">수정하기</button>
				<button type="submit" onclick="delete1()">삭제하기</button>
			</div>
		</c:if>
	</form>
</div>
<script>

function update(){
recipeViewFrm.action = "updateRecipeForm.do";
recipeViewFrm.submit();
	
}

function delete1(){
	recipeViewFrm.action = "deleteRecipe.do";
	recipeViewFrm.submit();
}
</script>
