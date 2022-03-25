<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<head>

<style>
th {
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
}

td {
	text-align: center;
	border-bottom: 1px solid gray;
}
</style>
</head>

<body>
	<div align="center">
		<form id="recipeForm" name="recipeForm" method="post">
			<table>
				<thead>
					<label><h1>레시피</h1></label>
				</thead>
				<tbody>
					<tr>
						<th width="150px">일련번호</th>
						<th width="200px" colspan="2">제목</th>
						<th width="100px">작성자</th>
						<th width="100px">등록일자</th>
					</tr>
					<c:forEach items="${recipes }" var="list">
						<tr
							onmouseover='this.style.background="#BDBDBD", this.style.fontWeight = "bold";'
							onmouseleave='this.style.backgroundColor = "white", this.style.fontWeight = "normal";'
							onclick='DefAction("${list.recipeSeq}")'>
							<td>${list.recipeSeq }</td>
							<td><img src=${list.recipeImageSm } width="130px" height="100%"></td>
							<td width="350px">${list.recipeName }</td>
							<c:if test="${list.userNo eq 1 }">
								<td>ADMIN</td>
							</c:if>
							<td>${list.recipeDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<input type="hidden" id="recipeSeq" name="recipeSeq">
			</div>
		</form>
	</div>

<script>
/* 1. 클릭하면 상세 레시피 페이지 이동 */
function DefAction(n) {
	const recipeS = recipeForm.recipeSeq; 
	recipeS.value = n;
	recipeForm.action = "recipeView.do";
	recipeForm.submit();
	
}

</script>

</body>



























