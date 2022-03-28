<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<head>

<style>
th {
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	border-left: 0px;
	border-right: 0px;
}

td {
	text-align: center;
	border-bottom: 1px solid gray;
	border-left: 0px;
	border-right: 0px;
}
</style>
</head>

<body id="body">

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
						<th width="100px">조회수</th>
					</tr>
					<c:forEach items="${recipes }" var="list">


						<tr
							onmouseover='this.style.background="#BDBDBD", this.style.fontWeight = "bold", this.style.cursor="pointer";'
							onmouseleave='this.style.backgroundColor = "white", this.style.fontWeight = "normal";'
							
							onclick='DefAction("${list.recipeSeq}")'>
							<td>${list.recipeSeq }</td>
							<td><img src=${list.recipeImageSm } width="130px"
								height="100%"></td>
							<td width="350px">${list.recipeName }</td>
							<td>${list.userAlias }</td>
							<td>${list.recipeDate}</td>
							<td>${list.recipeHit}</td>

						</tr>

					</c:forEach>
				</tbody>
			</table>
			<div>
				<button type="button" onclick="checkLogin('${userId}')">레시피
					등록</button>
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

	<script>
		/* 2. 로그인 체크 여부 */
		function checkLogin(n) {
			if (n == "") {
				var check = confirm('로그인이 필요한 서비스입니다.\n' + '로그인 하시겠습니까?');
				if (check == true) {
					location.href = "userLoginForm.do";
				}
			} else if (n != "") {
				location.href = "recipeInsertForm.do";
			}
		};
	</script>

	
</body>



























