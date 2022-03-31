<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
</head>
<body>
	<div align="center">
		<div>
			<h2>자유게시판</h2><br>
		</div>
		<div>
			<form id="notice" method="post" >
				<div>
					<select id="searchKey" name="searchKey">
						<option value="1">전체</option>
						<option value="2">작성자</option>
						<option value="3">제목</option>
						<option value="4">내용</option>
					</select> <span> <input type="text" id="searchVal"><input
						type="button" onclick="searchList()" value="검색">
					</span><br>
				</div>

				<div>
					<table border="1" id="contents">
						<thead>
							<tr>
								<th width="70">글번호 <br>
									<span style="color: red" onclick="sortNotice('A')">A</span> 
									<span style="color: red" onclick="sortNotice('B')">B</span>
								</th>
								<th width="300">제목</th>
								<th width="150">작성자</th>
								<th width="150">작성일자</th>
								<th width="70">조회수</th>
							</tr>
						</thead>
						<tbody id="noticeBody">
							<c:if test="${empty notices }">
								<tr>
									<td colspan="5">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty notices}">
									<c:forEach items="${notices}" var="n">
										<tr onmouseover='this.style.background="#fcecae";'
											onmouseleave='this.style.background="#FFFFFF";' 
											onclick="noticeContent('${n.noticeNo}')">
											<td>${n.noticeNo }</td>
											<td>${n.noticeTitle}</td>
											<td>${n.userAlias }</td>
											<td>${n.noticeDate }</td>
											<td>${n.noticeHit }</td>
										</tr>
									</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<button type="button" onclick="location.href='noticeInsertForm.do'">글쓰기</button>
				</div>
				<input type="hidden" id="noticeNo" name="noticeNo" value="">
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function noticeContent(n){
			
			notice.noticeNo.value= n;
			notice.action = "noticeView.do";
			notice.submit();
		}
			
			function searchList(data){
				$.ajax({
					url : "ajaxNoticeSearch.do",
					type : "post",
					data : {"key" : $("#searchKey").val(), "val" : $("#searchVal").val()},
					dataType : "json",
					success : function(result){
						if(result.length > 0){
							searchResult(result);
						}else{
							alert("검색한 결과가 존재하지 않습니다.");
						}
					}
				});
			}
			
			function searchResult(data){
				var tb = $("#noticeBody");
				
				$("#noticeBody").empty();
				
				$.each(data, function(index, item){
					var html = $("<tr />").attr({
						'onmouseover':'this.style.background="#fcecae";',
						'onmouseleave':'this.style.background="#FFFFFF";',
						'onclick' : 'noticeContent('+item.noticeNo+')'
					}).append(
							$("<td />").text(item.noticeNo),
							$("<td />").text(item.noticeTitle),
							$("<td />").text(item.userAlias),
							$("<td />").text(item.noticeDate),
							$("<td />").text(item.noticeHit),
					);
					tb.append(html);
				});
				$("#contents").append(tb);
			}
			
			function sortNotice(key){
				$.ajax({
					url : "ajaxSortNotice.do",
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