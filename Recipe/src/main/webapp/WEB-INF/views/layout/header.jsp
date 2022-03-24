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
		<div>
			<h1>메뉴부분</h1>
			<form id="frm" action="userJoinForm.do">
				<button>회원가입</button>
			</form>



			<header class="header">
				<div class="header_top">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 col-md-7">
								<div class="header_top_left">
									<p>냉장고를 부탁해</p>
								</div>
							</div>
							<div class="col-lg-6 col-md-5">
								<div class="header_top_right">
									<div class="header_top_links">


										<c:if test="${empty id }">
											<li><a href="" class="button alt">SIGN IN</a></li>
										</c:if>
										<c:if test="${not empty id }">
											<li><a href="<%=request.getContextPath()%>/#"
												class="button alt">LOG OUT</a></li>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="Container">
					<div class="row">
						<div class="col-lg-3 col-md-3">
							<div class="head_logo">
								<a href="./home.do"></a>
							</div>
						</div>

						<div class="col-lg-3 col-md-3">
							<nav class="head_menu">
								<ul>
									<li><a href="./#">레시피</a>
									<li><a href="./#">커뮤니티</a>
										<ul class="dropdown">
											<li><a href="noticeList.do">자유게시판</a>
											<li><a href="./#">레시피/재료 문의</a>
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
				<hr>
			</header>
		</div>
	</div>