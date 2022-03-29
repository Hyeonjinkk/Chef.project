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
			<h1>게시물 상세보기</h1>
		</div>
		<div>
			<form id="iqView" method="post">
			<div>
				<table border="1">
					<tr>
						<th width="100">작성자</th>
						<td width="150">${iq.userAlias }</td>

						<th width="100">작성일자</th>
						<td width="150">${iq.inquiryDate }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">${iq.inquiryTitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea rows="10" cols="80">
							${iq.inquiryContent }
							${iq.inquiryImage1 }
							${iq.inquiryImage2 }
							${iq.inquiryImage3 }
						</textarea></td>
					</tr>
				</table>
		</div>
		<br>
		<div>
			<button type="button" onclick="location.href='inquiryList.do'">목록가기</button>
			&nbsp;&nbsp;
			<button type="button" onclick="inquiryUpdate(${iq.inquiryNo})">수정</button>
			&nbsp;&nbsp;
			<button type="button" onclick="inquiryDelete(${iq.inquiryNo})">삭제</button>
			&nbsp;&nbsp;
			<input type="hidden" id="inquiryNo" name="inquiryNo">
		</div>
		</form>
	</div>
	</div>
	<script type="text/javascript">
	function inquiryUpdate(n){
		iqView.inquiryNo.value = n;
		iqView.action = "inquiryUpdateForm.do";
		iqView.submit();
	}
	
	function inquiryDelete(n){
		iqView.inquiryNo.value = n;
		iqView.action = "inquiryDelete.do";
		iqView.submit();
	}
</script>
</body>
</html>