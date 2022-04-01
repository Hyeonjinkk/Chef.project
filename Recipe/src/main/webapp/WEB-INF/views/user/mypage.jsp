<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

.container input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inling-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 80%; /* Full width */
	height: 50%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

button: hover {
	opacity: 0.8;
}

.close {
	color: black;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

<div class="container">
    <div class="row"  style="height: 10px;">
      <div class="col-xs-12"></div>
    </div>


    <div class="row">
      <div class="col-lg-3"></div>
      <div class="col-lg-6">
        <!-- Sign In Section Begin -->
        <div class="">
          <div class="signin__warp">
            <div class="signin__content">

              <div class="signin__form">
                <ul class="nav" role="">

                  <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="true" style="font-family: 'Do Hyeon', sans-serif;width: 640px;font-size: 30px;">마이페이지</a>
                  </li>

                </ul>
                <div class="tab-content">
             
        
                  



                       
    <div class="signin__form__text">
	<div align="center">
		<div>
			<form id="mypage" name="mypage"  method="GET">
				<!--  <div><h3>${message }</h3></div>-->
				<br>
				<div>
					<c:if test="${empty userId }">
						<a href="userLoginForm.do" class="button alt">로그인하기</a>
					</c:if>
					<c:if test="${not empty userId }">
						<button id="userUpdateBtn" class="site-btn" onclick="userInfoUpdate()">회원정보수정</button>
						<button id="mySubsListBtn" class="site-btn" onclick="mySubsList()">내가 구독한 셰프</button>
						<button id="myFollowerListBtn" class="site-btn" onclick="myFollowerList()">나를 구독한 회원</button>
						<!-- <button id="deleteUserBtn" class="site-btn" onclick="deleteUser()">회원탈퇴</button> -->
						<!-- 내가 등록한 레시피
						내가 찜한 레시피 -->
					</c:if>
				</div>
			</form>
		</div>
	</div>
	</div>
	      </div>
                </div>
              </div>
            </div>
          </div>
        </div>

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
	
	/* function deleteUser() {
		//탈퇴의사 묻기
		var q = confirm("정말로 탈퇴하시겠습니까?");
		
		if(q == true) {
			
			function pwdCheck() {
				//YES -> 비밀번호 재확인
			$.ajax({
				url : "ajaxUserOldPwdCheck.do",
				type : "POST",
				data : {
					"str" : $("#oldPwd").val()
				},
				dataType : "text",
				success : function(result) {
					console.log(result);
					if (result == 'true') {
						alert("");
						mypage.action = "deleteUser.do";
						mypage.submit();
					} else {
						alert("정상적으로 탈퇴 처리가 되지 않았습니다.");
						$("#oldPwd").val('');
						$("#oldPwd").focus();
					}	
				}
			});		
		} else {
			//NO -> 되돌아오기
		}		
	} */
	
</script>
</body>
</html>