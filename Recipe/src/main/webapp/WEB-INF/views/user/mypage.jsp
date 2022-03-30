<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div><h3>마이페이지</h3></div>
		<div>
			<form id="mypage" name="mypage"  method="GET">
				<div><h3>${message }</h3></div>
				<div>
					<c:if test="${empty userId }">
						<a href="userLoginForm.do" class="button alt">로그인하기</a>
					</c:if>
					<c:if test="${not empty userId }">
						<button id="userUpdateBtn" type="button" onclick="userInfoUpdate()">회원정보수정</button>
						<button id="mySubsListBtn" type="button" onclick="mySubsList()">내가 구독한 셰프</button>
						<button id="myFollowerListBtn" type="button" onclick="myFollowerList()">나를 구독한 회원</button>
						내가 등록한 레시피
						내가 찜한 레시피
				
					</c:if>
				</div>
			</form>
		</div>
	</div>
	

<script type="text/javascript">
	
	function userInfoUpdate() {
		mypage.action = "userUpdateForm.do";
		mypage.submit();
	}
	
	function mySubsList() {
		mypage.action = "followingList.do";
		mypage.submit();
	}
	
	function myFollowerList() {
		mypage.action = "followerList.do";
		mypage.submit();
	}
	
</script>
</body>
</html>