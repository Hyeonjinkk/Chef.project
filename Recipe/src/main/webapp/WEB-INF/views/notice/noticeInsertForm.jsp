<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<c:if test="${empty userId }">
		<h1>로그인이 필요합니다.</h1>
		<p>회원입니까?<a href="userLoginForm.do">    로그인</a></p> 
		<p>아직 회원이 아니라면<a href="userJoinForm.do">    회원가입</a></p>
	</c:if>
	<c:if test="${not empty userId }">
	<div><h1>게시글 작성</h1></div>
	<div>
		<form id="frm" action="noticeInsert.do" method="post">
			<div>
				<table border="1">
					<tr>
						<th width="100">작성자</th>
						<td width="150"><input type="text" id="userAlias" name="userAlias" value="${userAlias }" readonly style="border:none;"></td>
						
						<th width="100">작성일자</th>
						<td width="150"><input type="date" id="noticeDate" name="noticeDate"  style="border:none;"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" id="noticeTitle" name="noticeTitle" required="required" style="border:none;">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea rows="10" cols="80" name="noticeContent"  style="border:none;"></textarea>
						</td>
					</tr>
				</table>
			</div><br>
			<div>
				<button type="submit">글 등록</button>&nbsp;&nbsp;
				<button type="reset">취 소</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href='noticeList.do'">목 록</button>
			</div>
		</form>
	</div>
	
		</c:if>
</div>
</body>
</html>