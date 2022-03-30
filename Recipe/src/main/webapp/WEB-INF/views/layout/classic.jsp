<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Unna:400,700&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>



<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- font-family: 'Do Hyeon', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<!-- font-family: 'Oswald', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@200;500&display=swap"
	rel="stylesheet">


 <link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/avqnr3.png">

<style>
h1, h2, h3, h4, h5, h6, p {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>


</head>
<body>
  <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>


	<div class="humberger__menu__overlay"></div>
	 <div class="humberger__menu__wrapper" style="background: slategray;">
        <div class="humberger__menu__logo">
            <a href="./index.html"><img
                    src="data:image/png;base64,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"
                    alt=""></a>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li><a href="home.do" style="font-family: 'Oswald', sans-serif; font-size: 20px;">Home</a></li>
                <li><a href="userLoginForm.do" style="font-family: 'Oswald', sans-serif; font-size: 20px;">Sign in</a></li>
                <li><a href="userLogout.do" style="font-family: 'Oswald', sans-serif;font-size: 20px;">sign out</a></li>
                <li><a href="userJoinForm.do" style="font-family: 'Oswald', sans-serif;font-size: 20px;">Sign up</a></li>

                <li class="dropdown"><a href="#"
                        style="font-family: 'Oswald', sans-serif;font-size: 20px;">community</a>
                    <ul class="dropdown__menu" style="padding-left: 30px;">
                        <li><a href="noticeList.do" style="font-family: 'Oswald', sans-serif;">Free</a></li>
                        <li><a href="qnaList.do" style="font-family: 'Oswald', sans-serif;">life</a></li>
                        <li><a href="inquiryList.do" style="font-family: 'Oswald', sans-serif;">Cooking Tip</a></li>
                    </ul>
                </li>
                <li><a href="userMyPage.do" style="font-family: 'Oswald', sans-serif;font-size: 20px;">My Page</a></li>

                <li><a href="#" style="font-family: 'Oswald', sans-serif;font-size: 15px;">"My Team"</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="humberger__menu__about">
            <div class="humberger__menu__title sidebar__item__title">
                <h6>About me</h6>
            </div>
            <img src="https://media.istockphoto.com/photos/group-of-successful-business-people-showing-thumbs-up-picture-id1346125238?b=1&k=20&m=1346125238&s=170667a&w=0&h=sFivF89EffwpuC_kPu9AxRTLxdJZ7OFswlQh39mB76c="
                alt="">
            <h6 style="font-family: 'Do Hyeon', sans-serif;">안녕하세요!</h6>
            <p>여러분들이 가꿔가고 만들어지는 레시피 제공 사이트 <br />「 냉장고를 부탁해 」입니다.<br />
                커뮤니티와 함께 소통하는 여러분들이 진정한 이 사이트의 주인입니다!</p>

        </div>

    </div>
	
	<tiles:insertAttribute name="header" />
	
        <tiles:insertAttribute name="body" />
	
	
	
	<tiles:insertAttribute name="footer" />
	
	 <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>