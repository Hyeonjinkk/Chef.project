<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h4>나를 구독한 회원</h4>
		</div>
		<br />
		
		<form id="followerFrm" action="">
			<table>
				<c:forEach items="${subs2 }" var="s2">
					<tr>
						<td>${s2.userId }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>