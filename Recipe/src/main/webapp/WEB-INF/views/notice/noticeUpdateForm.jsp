<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 작성</h1>
		</div>
		<div>
			<form id="ntupdate" action="noticeUpdate.do" method="post">
				<div>
					<table border="1">
						<tr>
							<th width="100">작성자</th>
							<td width="150">
								<input type="text" id="userAlias" name="userAlias" value="${nt.userAlias }">
							</td>

							<th width="100">작성일자</th>
							<td width="150">
								<input type="date" id="noticeDate" name="noticeDate" value="${nt.noticeDate }">
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">
								<input type="text" id="noticeTitle" name="noticeTitle" value="${nt.noticeTitle }">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<textarea rows="10" cols="80" id="noticeContent" name="noticeContent" value="${nt.noticeContent }">${nt.noticeContent }</textarea>
							</td>
						</tr>
					</table>
				</div>
				<br>
				<div>
					<button type="submit">저장하기</button>
					&nbsp;&nbsp;
					<button type="reset">취 소</button>
					&nbsp;&nbsp;
					<button type="button" onclick="location.href='noticeList.do'">목록</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>