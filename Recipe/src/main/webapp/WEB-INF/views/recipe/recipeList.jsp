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
	<form id="recipeForm" name="recipeForm" method="post">
		<div class="container">
			<div class="single-post__quote"
				style="margin-top: 70px; margin-bottom: 55px;">
				<h3 style="padding-top: 3px;">레시피</h3>
				<span>모두 함께 가꿔나가요!</span>
			</div>
			<div class="row">
				<c:forEach items="${recipes }" var="list">
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${list.recipeImageSm }"
							style="background-image: url();"
							onmouseover="this.style.cursor='pointer';"
							onclick='DefAction("${list.recipeSeq}")'>
							<div class="categories__hover__text"
								style="text-align: center; opacity: 0.8;"
								onmouseover="this.style.cursor='pointer';"
								onclick='DefAction("${list.recipeSeq}")'>
								<h5>${list.recipeName }</h5>
								<h6>"${list.userAlias }"</h6>
								<p>조회수 ${list.recipeHit}회</p>
								<p>${list.recipeDate}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div align="center">
			<button type="button" onclick="checkLogin('${userId}')"
				class="site-btn">레시피 등록</button>
		</div>
	</form>




	<script>
		/* 1. 클릭하면 상세 레시피 페이지 이동 */
		function DefAction(n) {
			if ('${userId}' != null) {
				const recipeS = recipeForm.recipeSeq;
				recipeS.value = n;
				recipeForm.action = "recipeView.do";
				recipeForm.submit();
			} else {
				var check = confirm('로그인이 필요한 서비스입니다.\n' + '로그인 하시겠습니까?');
				if (check == true) {
					location.href = "userLoginForm.do";
				}
			}

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
		
		
		if('${message}' != ''){
			alert('${message}');
			window.location = "recipeList.do";
		}
		
	</script>


</body>



























