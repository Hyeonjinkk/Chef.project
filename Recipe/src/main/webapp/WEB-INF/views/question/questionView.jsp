<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type=date]:focus {
	outline: none;
}
</style>
</head>
<body>
	<section class="single-post spad" style="padding-top: 180px;">
		<form id="frr" method="post">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12">
						<div>
							<div>
								<table class="table table-hover">
									<tr>
										<th width="100">작성자</th>
										<td width="150">${question.questionWriter}</td>
										<th width="100">작성일자</th>
										<th width="150">${question.questionDate}</th>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">${question.questionTitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3"><pre style="height: 150px;">${question.questionContents }</pre></td>
									</tr>
								</table>
							</div>
							<br>
							<div align="center">
								<button type="button" onclick="location.href='questionList.do'">목록가기</button>
								<c:if test="${user_no == 1}">
									<button type="submit"
										onclick="questionUpdate(${question.questionId})">수정완료</button>
					&nbsp;&nbsp;
					<button type="button"
										onclick="questionDelete(${question.questionId})">삭제</button>
								</c:if>
								<input type="hidden" id="questionId" name="questionId">

							</div>
						</div>
					</div>
				</div>
			</div> 
		</form>
	</section>
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