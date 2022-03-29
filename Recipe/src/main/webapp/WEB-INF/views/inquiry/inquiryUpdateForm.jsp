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
			<h1>게시글 작성</h1>
		</div>
		<div>
			<form id="frm" action="inquiryUpdate.do" method="post">
				<div>
					<table border="1">
						<tr>
							<th width="100">작성자</th>
							<td width="150"><input type="text" id="userAlias"
								name="userAlias" value="${iq.userAlias }"></td>

							<th width="100">작성일자</th>
							<td width="150"><input type="date" id="inquiryDate"
								name="inquiryDate" value="${iq.inquiryDate }"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" id="inquiryTitle"
								name="inquiryTitle" value="${iq.inquiryTitle }"></td>
							<th>카테고리</th>
							<td colspan="5"><select id="inquiryCategory"
								name="inquiryCategory">
									<option value="레시피">레시피</option>
									<option value="재료">재 료</option>
							</select></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea rows="10" cols="80"
									id="inquiryContent" name="inquiryContent"
									value="${iq.inquiryContent }"></textarea></td>
						</tr>
						<tr>
							<td>이미지1:</td>
							<td><input type="file" name="inquiryImage1" id="inquiryImage1"></td>
						</tr>
						<tr>
							<td>이미지2:</td>
							<td><input type="file" name="inquiryImage2" id="inquiryImage2"></td>
						</tr>
						<tr>
							<td>이미지3:</td>
							<td><input type="file" name="inquiryImage3" id="inquiryImage3"></td>
						</tr>
					</table>
				</div>
				<br>
				<div>
					<button type="submit">글 등록</button>
					&nbsp;&nbsp;
					<button type="reset">취 소</button>
					&nbsp;&nbsp;
					<button type="button" onclick="location.href='noticeList.do'">목
						록</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>