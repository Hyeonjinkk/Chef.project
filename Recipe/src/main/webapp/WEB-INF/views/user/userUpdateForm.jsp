<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
<style>


table td .inpAlias {
	padding: 3px;
	font-size: 12px;
	color: #999;
}

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
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}


</style>

</head>


<body>


	<div align="center">

		<div>
			<h4>${message }</h4>
		</div>
		<hr>
		<form id="userInfoFrm" action="updateUserInfo.do" method="get">
			<input type="hidden" name="userId" value="${userId }">
			
			<table>
				<tr>
					<th width="100">아이디</th>
					<td width="500">${userId }
					<td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${userName }</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" id="userAlias" name="userAlias" value="${userAlias }"> 
					<span class="inpAlias">10자 이내로 입력해주세요.</span></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<button type="button" id="modalBtn">비밀번호 변경</button>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" value="${userTel }" id="userTel" name="userTel"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" value="${userAddress }" id="userAddress" name="userAddress"></td>
				</tr>
			</table>

			<button type="submit">변경하기</button>
		</form>
	</div>



	<!-- 패스워드 변경 모달창 -->
	<div id="changePwdModal" class="modal">
		<form id="pwdFrm" action="updatePwd.do" onsubmit="return pwdCheck()" method="post">
			<input type="hidden" name="userId" value="${userId }">
			<div class="modal-content">
				<span class="close">&times;</span>
				
				<label for="oldPwd"><b>기존 패스워드 입력</b></label> 
				<input id="oldPwd" type="password" placeholder="기존 패스워드를 입력하세요." required="required"> 
				
				<label for="newPwd1"><b>새 패스워드 입력</b></label> 
				<input id="newpwd1" type="password" placeholder="새 패스워드를 입력해주세요." name="userPassword" required="required"> 
				
				<label for="newPwd2"><b>새 패스워드 확인</b></label> 
				<input id="newpwd2" type="password" placeholder="새 패스워드를 확인해주세요." required="required">

				<div align="center">
					<button type="submit">비밀번호 변경하기</button>
					<button type="button" onclick="document.getElementById('changePwdModal').style.display='none'">취소하기</button>
				</div>
			</div>
		</form>
	</div>


	<script type="text/javascript">
	
		var modal = document.getElementById("changePwdModal");
		var btn = document.getElementById("modalBtn");
		var span = document.getElementsByClassName("close")[0];
		
		btn.onclick = function() {
			modal.style.display = "block";
		}
		
		span.onclick = function() {
			  modal.style.display = "none";
			}
		
		
		function pwdCheck() {
			
			$.ajax({
				url : "ajaxUserOldPwdCheck.do",
				type : "POST",
				data : {"str" : $("#oldPwd").val()},
				dataType : "text",
				success : function(result) {
					console.log(result);
					if (result == 'true') {
						alert("패스워드를 변경하시겠습니까.")
					} else {
						alert("기존 패스워드를 잘못 입력하셨습니다.");
						$("#oldPwd").val('');
						$("#oldPwd").focus();
					};
				}
			});		
						
			if($("#newpwd1").val() != $("#newpwd2").val()) {
				alert("새로 입력하신 패스워드가 일치하지 않습니다.");
				$("#newpwd1").focus();
				return false;
			} else {
				return true;
			}
		}
		
	</script>
</body>
</html>