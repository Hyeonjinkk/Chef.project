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
			<h3 style="padding-top: 3px;">생활팁 갤러리</h3>
			<span>생활팁이나 자유소통 갤러리입니다.</span>
		</div>

		<form id="fmm" method="post">
			<div align="center">

				<div>
					<select id="searchKey" name="searchKey" style="width: 100px; border: none;">
						<option value="작성자">작성자</option>
						<option value="제목">제목</option>
						<option value="내용">내용</option>
					</select> <span> <input type="text" id="searchVal"  style="height: 47px;">&nbsp; <input
						type="button" class="site-btn" onclick="searchList()" value="검색">
					</span>
				</div>
				<div>
					<table id="contents" class="table table-hover">
						<thead>
							<tr>
								<th width="150"><span style="color: red"
									onclick="sortBorder('A')">A </span>글번호 <span style="color: red"
									onclick="sortBorder('D')"> D </span></th>
								<th width="150">작성자</th>
								<th width="300">제목</th>
								<th width="150">작성일자</th>
								<th width="70">조회수</th>
							</tr>
						</thead>
						<tbody id="questionBody">
							<c:if test="${empty questions }">
								<tr>
									<td colspan="5">게시글이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty questions }">
								<tr>
									<c:forEach items="${questions }" var="b">
										<tr onmouseover='this.style.cursor="pointer";'
											onclick="questionContents(${b.questionId})">
											<td>${b.questionId}</td>
											<td>${b.questionWriter}</td>
											<td>${b.questionTitle}</td>
											<td>${b.questionDate}</td>
											<td>${b.questionHit}</td>
										</tr>
									</c:forEach>
								</tr>
							</c:if>
						</tbody>

					</table>
				</div>
				<br>
				<div align="center" style="padding-bottom: 65px;">

					<c:if test="${not empty userId}">
						<button type="button" class="site-btn"
							onclick="location.href='questionInsertForm.do'">글쓰기</button>
					</c:if>
				</div>
				<input type="hidden" id="questionId" name="questionId">
			</div>
		</form>





	</div>






	<script type="text/javascript">
	function questionContents(n){
		
		console.log(n);
		fmm.questionId.value = n;
		console.log(fmm.questionId.value);
		fmm.action = "questionView.do";
		fmm.submit();
	}
	
	function searchList() {
		$.ajax({
			url : "ajaxQuestionSearch.do",
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
		var tb = $("#questionBody");
		$("#questionBody").empty();
		
		$.each(data, function(index, item) {
			var html = $("<tr />").attr({
					'onmouseover' : 'this.style.background="#fcecae";' ,
					'onmouseleave' : 'this.style.background="#FFFFFF";',
					'onclick' : 'questionContents('+item.questionId+')'		
			}).append(
			$("<td align ='center'/>").text(item.questionId),
			$("<td align ='center'/>").text(item.questionWriter),
			$("<td />").text(item.questionTitle),
			$("<td align ='center'/>").text(item.questionDate),
			$("<td align ='center'/>").text(item.questionHit),
			);
			tb.append(html);
		});
		
	}
		
	
	function sortBorder(key){
		$.ajax({
			url : "ajaxSortQuestion.do",
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