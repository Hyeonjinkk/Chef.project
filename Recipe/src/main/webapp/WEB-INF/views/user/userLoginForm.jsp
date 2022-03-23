<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h4>로그인</h4>
		</div>
		<hr>
		<form id="frm" action="userLogin.do" method="POST">

			아이디 <input type="email" id="userId" name="userId" required="required" placeholder="abc@abc.com">
			비밀번호 <input type="password" id="userPassword" name="userPassword" required="required">

			<input type="submit" value="로그인하기">
			<p>
			<input type="button" value="홈 가기" onclick="">&nbsp;&nbsp;
			<input type="button" value="회원가입하기" onclick="">

		</form>
		<hr>
	</div>
</body>
</html>