<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 상세보기</h1>
		</div>
		<div>
			<form id="frr"  method="post">
				<div>
					<table border="1">
						<tr>
							<th width="100">작성자</th>
							<td width="150"><input type="text" name="questionWriter" value="${question.questionWriter}" ></td>
							<th width="100">작성일자</th>
							<th width="150"><input type="date" name="questionDate" required="required" value="${question.questionDate}"></th>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="questionTitle" required="required" value="${question.questionTitle}"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="15" cols="50" name="questionContents" required="required">${question.questionContents }</textarea></td>
						</tr>
					</table>
				</div>
				<br>
				<div>
					<button type="button" onclick="location.href='questionList.do'">목록가기</button>
					<c:if test="${user_no == 1}">
					<button type="submit"  onclick="questionUpdate(${question.questionId})">수정완료</button>
					&nbsp;&nbsp;
					<button type="button" onclick="questionDelete(${question.questionId})">삭제</button>
					</c:if>
					<input type="hidden" id="questionId" name="questionId">

				</div>
			</form>
		</div>
</div>
		<script type="text/javascript">
			function questionDelete(a) {
				frr.questionId.value = a;
				frr.action = "questionDelete.do";
				frr.submit();
			}
			function questionUpdate(a) {
				frr.questionId.value = a;
				frr.action = "questionUpdate.do";
				
			}
			
			
		</script>
</body>
</html>