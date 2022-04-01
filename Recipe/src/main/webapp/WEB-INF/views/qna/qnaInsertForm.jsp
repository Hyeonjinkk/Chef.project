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
	<div><h1>게시글 작성</h1></div>
	<div>
		<form id="frm" action="qnaInsert.do" method="post">
			<div>
				<table border="1">
					
					<tr>
						<th>질문</th>
						<td colspan="3">
							<input type="text" size="80" id="qnaTitle" name="qnaTitle" required="required" style="border:none;">
						</td>
					</tr>
					<tr>
						<th>답변</th>
						<td colspan="3">
							<textarea rows="10" cols="80" name="qnaContents" required="required" style="border:none;"></textarea>
						</td>
					</tr>
				</table>
			</div><br>
			<div>
				<button type="submit" class="site-btn">글등록</button>&nbsp;&nbsp;&nbsp;
				<button type="reset" class="site-btn">취소</button>&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="location.href='qnaList.do'" class="site-btn">목 록</button>
				
			</div>
		</form>
	</div>
</div>
</body>
</html>