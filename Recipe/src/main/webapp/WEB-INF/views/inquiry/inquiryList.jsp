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
	<div class="container">
		<div class="single-post__quote"
			style="margin-top: 70px; margin-bottom: 55px;">
			<h3 style="padding-top: 3px;">Cooking Tip 갤러리</h3>
			<span>레시피 후기 및 재료 질문 관련 갤러리입니다!</span>
		</div>
		<div align="center">

			<div>
				<form id="inquiry" method="post">
					<div>
						<select id="searchKey" name="searchKey"
							style="width: 100px; border: none;">
							<option value="1">전체</option>
							<option value="2">작성자</option>
							<option value="3">제목</option>
							<option value="4">내용</option>
						</select> <span> <input type="text" id="searchVal"
							style="height: 47px;"> <input class="site-btn"
							type="button" onclick="searchList()" value="검색">
						</span><br>
					</div>

					<div>
						<table class="table table-hover" id="contents">
							<thead>
								<tr>

									<th width="100">
									<span style="color: red" onclick="sortNotice('A')">A</span> 글번호 
									<span style="color: red" onclick="sortNotice('B')">B</span></th>
									<th width="300">제목</th>
									<th width="70">분류</th>
									<th width="150">작성자</th>
									<th width="150">작성일자</th>
									<th width="70">조회수</th>
								</tr>
							</thead>
							<tbody id="inquiryBody">
								<c:if test="${empty inquiry}">
									<tr>
										<td colspan="5">등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty inquiry }">
									<c:forEach items="${inquiry }" var="i">
										<tr onmouseover="this.style.cursor='pointer';"
											onclick="inquiryContent('${i.inquiryNo }')">
											<td>${i.inquiryNo }</td>
											<td>${i.inquiryTitle }</td>
											<td>${i.inquiryCategory }</td>
											<td>${i.userAlias }</td>
											<td>${i.inquiryDate }</td>
											<td>${i.inquiryHit }</td>

										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<br>
					<div align="center" style="padding-bottom: 65px;">
						<button type="button"
							onclick="location.href='inquiryInsertForm.do'" class="site-btn">글쓰기</button>
					</div>
					<input type="hidden" id="inquiryNo" name="inquiryNo" value="">
				</form>
			</div>
		</div>
	</div>






	<script type="text/javascript">
		function inquiryContent(n){
			inquiry.inquiryNo.value = n;
			inquiry.action = "inquiryView.do";
			inquiry.submit();
		}
		
		function searchList(data){
			$.ajax({
				url : "ajaxInquirySearch.do",
				type : "post",
				data : {"key" : $("#searchKey").val(), "val" : $("#searchVal").val()},
				dataType : "json",
				success : function(result){
					if(result.length > 0){
						searchResult(result);
					}else{
						alert("검색한 결과가 존재하지 않습니다. ");
					}
				}
			});
		}
		
		function searchResult(data){
			var tb = $("#inquiryBody");
			
			$("#inquiryBody").empty();
			
			$.each(data, function(index, item){
				var html = $("<tr />").attr({
					'onmouseover':'this.style.background="#fcecae";',
					'onmouseleave':'this.style.background="#FFFFFF";',
					'onclick' : 'inquiryContent('+item.inquiryNo+')'
				}).append(
						$("<td />").text(item.inquiryNo),
						$("<td />").text(item.inquiryTitle),
						$("<td />").text(item.inquiryCategory),
						$("<td />").text(item.userAlias),
						$("<td />").text(item.inquiryDate),
						$("<td />").text(item.inquiryHit),
				);
				tb.append(html);
			});
			$("#contents").append(tb);
		}
		
		function sortNotice(key){
			$.ajax({
				url : "ajaxSortInquiry.do",
				type : "post",
				data : {"key" : key},
				dataType : "json",
				success : function(result){
					searchResult(result);
				}
			});
		}
	</script>

</body>
</html>