<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<div align="center">
		<div class="col-lg-6 col-md-5">
			<div class="header_top_right">
				<div class="header_top_links">
					<div class="header_top">
						<div class="container">
							<div class="row">
								<div class="col-lg-3 col-md-3">
									<div class="head_logo">
										<a href="./home.do">냉장고를 부탁해</a>
									</div>
								</div>
								<div class="col-lg-6 col-md-5">
									<div class="header_top_right">
										<div class="header_top_links">
											<c:if test="${empty userId }">
												<li><a href="userLoginForm.do" class="button alt">로그인</a></li>
												<li><a href="userJoinForm.do" class="button alt">회원가입</a></li>
											</c:if>
											<c:if test="${not empty userId and userAuthor eq 'ADMIN'}">
												<li><a href="userList.do" class="button alt">회원리스트</a></li>
											</c:if>
											<c:if test="${not empty userId }">
												<li><a href="userLogout.do" class="button alt">LOG
														OUT</a></li>
											</c:if>
											<a href="userMypage.do" class="button alt">마이페이지</a>
										</div>
									</div>
									<div class="col-lg-3 col-md-3">
										<nav class="head_menu">
											<ul>
												
												<li><a href="recipeList.do">레시피</a>
												<li><a href="./#">커뮤니티</a>
													<ul class="dropdown">
														<li><a href="noticeList.do">자유게시판</a>
														<li><a href="inquiryList.do">레시피/재료 문의</a>
														<li><a href="./#">후기게시판</a>
													</ul>
												<li><a href="./#">나의 냉장고</a>
													<ul class="dropdonw">
														<li><a href="./#">재료</a>
													</ul>
												<li><a href="borderList.do">공지사항</a>
												
											</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
</body>