<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
</head>
<body>




	<div align="center">
		<div>
			<h1>회원가입</h1>
		</div>
		<div>
			<form id="frm" action="userJoin.do" onsubmit="return formCheck()"
				method="POST">
				<div>
					<table border="">
						<tr>
							<th width="200">아이디</th>
							<td width="400"><input type="email" id="userId"
								name="userId" required="required" placeholder="이메일 주소를 입력해주세요">
								&nbsp;&nbsp;
								<button type="button" id="checkId" value="No"
									onclick="isIdCheck()">중복체크</button></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" id="userPassword"
								name="userPassword" required="required"></td>
						</tr>
						<tr>
							<th>패스워드 확인</th>
							<td><input type="password" id="userPassword1"
								name="userPassword1" required="required"></td>
						</tr>
						<tr>
							<th>이 름</th>
							<td><input type="text" id="userName" name="userName"
								required="required"></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input type="text" id="userAlias" name="userAlias"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" id="userTel" name="userTel"></td>
						</tr>
						<tr>
							<th>주 소</th>
							<td><input type="text" id="userAddress" name="userAddress"></td>
						</tr>
					</table>
				</div>
				<br>
				<div>
					<input type="submit" value="회원가입">&nbsp;&nbsp; <input
						type="reset" value="취소">&nbsp;&nbsp; <input type="button"
						value="홈 가기" onclick="location.href=home.do">
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		function isIdCheck() {
			$.ajax({
				url : "ajaxUserIdCheck.do",
				type : "post",
				data : {"str" : $("#userId").val()},
				dataType : "text",
			
				
				success : function(result) {
					if(result == '1') {
						alert("사용 가능한 아이디입니다.");
						$("#checkId").val('Yes');
						$("#checkId").attr("disabled", "disabled");
						$("#userPassword").focus();
					} else {
						alert("이미 사용 중인 아이디입니다.");
						$("#userId").val('');
						$("#userId").focus();
					};
				}
				
			});
		}
	
		function formCheck() {
			
			if($("#checkId").val() != 'Yes') {
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if($("#userPassword").val() != $("#userPassword1").val()) {
				alert("패스워드가 일치하지 않습니다.");
				$("#userPassword").val('');
				$("#userPassword1").val('');
				$("#userPassword").focus();
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>