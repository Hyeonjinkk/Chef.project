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
	<div><h4>회원 리스트</h4></div>
	<br/>
<form id="userFrm" action="">
	<table>
		<thead>
			<tr>
				<th width="300">아이디</th>
				<th width="100">이름</th>
				<th width="100">닉네임</th>
				<th width="200">권한</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users }" var="user">
				<tr onclick="userDetailView(${user.userId})">
					<td>${user.userId }</td>
					<td>${user.userName }</td>
					<td>${user.userAlias }</td>
					<td>${user.userAuthor }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
</div>



<script type="text/javascript">
	
	function userDetailView(n){
		
		console.log(n);
		userFrm.userId.value = n;
		userFrm.action = "userDetailView.do";
		userFrm.submit();
	}	
	
</script>

</body>
</html>