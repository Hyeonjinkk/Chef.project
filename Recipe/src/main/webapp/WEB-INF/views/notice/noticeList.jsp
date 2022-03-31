<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="js/jquery-3.3.1.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="single-post__quote"
			style="margin-top: 70px; margin-bottom: 55px;">
			<h3 style="padding-top: 3px;">자유갤러리</h3>
			<span>같이 소통하면서 즐겨봐요!</span>
		</div>
		<div>
			<form id="notice" method="post">
				<div align="center">

					<select id="searchKey" name="searchKey" style="width: 100px; border: none;">
						<option value="1">선택</option>
						<option value="2">작성자</option>
						<option value="3">제목</option>
						<option value="4">내용</option>
					</select>


					<span> <input type="text" id="searchVal" style="height: 47px;"><input class="site-btn" 
						type="button" onclick="searchList()" value="검색">
					</span> <br>
				</div>

				<div>
					<table  id="contents" class="table table-hover">
						<thead>
							<tr> 
							<th width="70">
							<span style="color: red"
									onclick="sortNotice('A')">A</span>
								글번호 <span style="color: red"
									onclick="sortNotice('B')">B</span>
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
									<tr onmouseover="this.style.cursor='pointer';"
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
				<div align="center" style="padding-bottom: 65px;">
					<button type="button" class="site-btn"  onclick="location.href='noticeInsertForm.do'">글쓰기</button>
				</div>
				<input type="hidden" id="noticeNo" name="noticeNo" value="">
			</form>
		</div>
	</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

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