<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>

<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">
		<div class="single-post__quote"
			style="margin-top: 70px; margin-bottom: 55px;">
			<h3 style="padding-top: 3px;">공지사항</h3>
			<span>관리자 전용 공지사항입니다!</span>
		</div>




		<form id="fmm" method="post">
			<div align="center">

				<div>
					<select id="searchKey" name="searchKey" onmouseover="this.style.cursor='pointer';">
						<option value="1">선택</option>
						<option value="2">작성자</option>
						<option value="3">제목</option>
						<option value="4">내용</option>
					</select> <span> <input type="text" id="searchVal">&nbsp; <input
						type="button" onclick="searchList()" value="검색">
					</span>
				</div>
			</div>
			<div>
				<div style="float: right;">
					<select id="cntPerPage" name="sel" onchange="selChange()">
						<option value="5"
							<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
							보기</option>
						<option value="10"
							<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
							보기</option>
						<option value="15"
							<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
							보기</option>
						<option value="20"
							<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
							보기</option>
					</select>
				</div>
				<!-- 옵션선택 끝 -->
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="150">글번호</th>
							<th width="150">작성자</th>
							<th width="300">제목</th>
							<th width="150">작성일자</th>
							<th width="70">조회수</th>
						</tr>
					</thead>
					<tbody id="borderBody">
						<c:if test="${empty borders }">
							<tr>
								<td colspan="5">게시글이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty borders }">
							<tr>
								<c:forEach items="${borders }" var="b">
									<tr onmouseover="this.style.cursor='pointer';"
										onclick="borderContents(${b.borderId})">
										<td>${b.borderId}</td>
										<td>${b.borderWriter}</td>
										<td>${b.borderTitle}</td>
										<td>${b.borderDate}</td>
										<td>${b.borderHit}</td>
									</tr>
								</c:forEach>
							</tr>
						</c:if>
					</tbody>

				</table>
			</div>
			<br>
			<div align="center" style="padding-bottom: 65px;">
				<c:if test="${'관리자' eq userAlias }">
					<button type="button" class="site-btn" onclick="location.href='borderInsertForm.do'">공지사항 작성</button>
				</c:if>
			</div>
			<input type="hidden" id="borderId" name="borderId">
			<div style="display: block; text-align: center;">
				<c:if test="${paging.startPage != 1 }">
					<a
						href="/borderList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a
								href="/borderList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="/borderList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
		</form>



	</div>


	<script type="text/javascript">
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="borderList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	
	function goPage(page) {
		location.href = "noticeListPaging.do?page=" + page;
	}
	
	function borderContents(n){
		
		console.log(n);
		fmm.borderId.value = n;
		console.log(fmm.borderId.value);
		fmm.action = "borderView.do";
		fmm.submit();
	}
	
	function searchList() {
		$.ajax({
			url : "ajaxBorderSearch.do",
			type : "post",
			data : {"key" : $("#searchKey").val(), "val" : $("#searchVal").val()},
			dataType : "json",
			success : function(result) {
				if(result.length >0){
					//html변환코드
					searchResult(result); //json data를 html로 변환해서 화면에 뿌려주는 메소드
				}else {
					alert("검색한 결과가 존재하지 않습니다.");
				}
			}
		});
	}
	
	function searchResult(data){ //json 객체를  html로 변환 후 화면에 적용함.
		var tb = $("#borderBody");
		$("#borderBody").empty();
		
		$.each(data, function(index, item) {
			var html = $("<tr />").attr({
					'onmouseover' : 'this.style.background="#fcecae";' ,
					'onmouseleave' : 'this.style.background="#FFFFFF";',
					'onclick' : 'borderContents('+item.borderId+')'		
			}).append(
			$("<td align ='center'/>").text(item.borderId),
			$("<td align ='center'/>").text(item.borderWriter),
			$("<td />").text(item.borderTitle),
			$("<td align ='center'/>").text(item.borderDate),
			$("<td align ='center'/>").text(item.borderHit),
			);
			tb.append(html);
		});
		$("#contents").append(tb);
	}
	
	function sortBorder(key){
		$.ajax({
			url : "ajaxSortBorder.do",
			type : "post",
			data : {"key" : key},
			dataType : "json", 
			success : function(result){
				searchResult(result);  //json data를 html로 변환해서 화면에 뿌려주는 메소드
			}
		});
	}
	</script>
</body>
</html>