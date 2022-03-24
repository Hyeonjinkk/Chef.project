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
							<td width="150"><input type="text" name="borderWriter" value="${border.borderWriter}" ></td>
							<th width="100">작성일자</th>
							<th width="150"><input type="date" name="borderDate" required="required" value="${border.borderDate}"></th>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="borderTitle" required="required" value="${border.borderTitle}"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="15" cols="50" name="borderContents" required="required">${border.borderContents }</textarea></td>
						</tr>
					</table>
				</div>
				<br>
				<div>
					<button type="button" onclick="location.href='borderList.do'">목록가기</button>
					&nbsp;&nbsp;
					<button type="submit"  onclick="borderUpdate(${border.borderId})">수정완료</button>
					&nbsp;&nbsp;
					<button type="button" onclick="borderDelete(${border.borderId})">삭제</button>
					
					<c:if test="${user_no == 1}">
					<button type="submit"  onclick="borderUpdate(${border.borderId})">수정완료</button>
					&nbsp;&nbsp;
					<button type="button" onclick="borderDelete(${border.borderId})">삭제</button>
					</c:if>
					<input type="hidden" id="borderId" name="borderId">

				</div>
			</form>
		</div>
</div>
		<script type="text/javascript">
			function borderDelete(a) {
				frr.borderId.value = a;
				frr.action = "borderDelete.do";
				frr.submit();
			}
			function borderUpdate(a) {
				frr.borderId.value = a;
				frr.action = "borderUpdate.do";
				
			}
		</script>
</body>
</html>