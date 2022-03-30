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

<div class="header__top">
            <div class="container" style="height: 70px;">
                <div class="row">
                    <div class="col-lg-2 col-md-1 col-6 order-md-1 order-1">
                        <div class="header__humberger" style="text-align: center;">
                            <i class="fa fa-bars humberger__open" style="font-size: 25px; text-align: center; padding-top: 10px; "></i>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-10 order-md-2 order-3" style="padding-top: 10px;">
                        <nav class="header__menu">
                            <ul>
                                <li id="home"><a href="home.do" style="font-family: 'Noto Sans KR', sans-serif;">Home</a></li>
                                <li id="recipe"><a href="recipeList.do" style="font-family: 'Noto Sans KR', sans-serif;">레시피</a></li>
                                <li id="board"><a href="borderList.do" style="font-family: 'Noto Sans KR', sans-serif;">공지사항</a>
                                </li>
                                <li class="dropdown"><a href="#" style="font-family: 'Noto Sans KR', sans-serif;">커뮤니티</a>
                                <li class="dropdown"><a href="myBasketList.do" style="font-family: 'Noto Sans KR', sans-serif;">커뮤니티</a>
                                    <ul class="dropdown__menu" style="width: 200px;">
                                        <!-- 자유게시판 -->
                                        <li><a href="noticeList.do" style="font-family: 'Noto Sans KR', sans-serif;">자유 갤러리</a></li>

                                        <!-- 레시피/재료 문의 게시판 -->
                                        <li><a href="inquiryList.do" style="font-family: 'Noto Sans KR', sans-serif;">Cooking Tip
                                                갤러리</a></li>

                                        <!-- 질문 & 답변 게시판 -->
                                        <li><a href="questionList.do" style="font-family: 'Noto Sans KR', sans-serif;">생활팁 갤러리</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="qnaList.do" style="font-family: 'Noto Sans KR', sans-serif;">고객센터</a></li>
                                <c:if test="${not empty userId and userAuthor eq 'ADMIN'}">
                                <li><a href="userList.do" style="font-family: 'Noto Sans KR', sans-serif;">회원리스트</a></li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-2 col-md-1 col-6 order-md-3 order-2">
                        <div class="header__search">
                            <span class="material-icons">
					<c:if test="${empty userId }">
                                <button type="button" style="border: none; background: none;" onclick="location.href='userLoginForm.do'">login <p>로그인</p></button>

                                <button type="button" style="border: none; background: none;" onclick="location.href='userJoinForm.do'">account_circle <p>회원가입</p>
                                </button>
					</c:if>
					<c:if test="${not empty userId }">
                                <button type="button" style="border: none; background: none;" onclick="location.href='userLogout.do'">logout <p>로그아웃</p>
                                </button>
					
                                <button type="button" style="border: none; background: none;" onclick="location.href='userMypage.do'">account_box <p>마이 페이지</p>
                                </button>
					</c:if>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
       
</body>