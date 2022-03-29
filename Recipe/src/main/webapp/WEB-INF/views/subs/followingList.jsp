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
	<div><h4>내가 구독한 셰프</h4></div>
	<br/>
		<form id="subsFrm" method="POST">
		<table>
			<c:forEach items="${subs }" var="s">
				<tr>
					<td>${s.following }
					<input type="hidden" value="${s.following }" name="following">
					<button id="unfollowBtn" onclick="unfollow()">구독취소</button>
					</td>
					
				</tr>
			</c:forEach>
		</table>
		</form>
</div>


<script type="text/javascript">
	
	function unfollow() {
		subsFrm.action = "unfollowing.do";
		subsFrm.submit();
	}
	
</script>
</body>
</html>