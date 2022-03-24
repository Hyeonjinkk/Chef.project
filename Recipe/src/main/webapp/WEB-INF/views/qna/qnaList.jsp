<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
<style>
.menu a {
	cursor: pointer;
}

.menu .hide {
	display: none;
}
</style>

</head>
<body>
	<div align="center">

		<div>
			<h1>자주듣는 질문 목록</h1>
		</div>

		<form id="fmm" method="post">
			<div>
				<div>
					<ul>
						<li class="menu"><a> 
						<c:forEach items="${qnas }" var="q">
									<tr onmouseover='this.style.background="#fcecae";'
										onmouseleave='this.style.background="#FFFFFF";'
										onclick="qnaContents(${q.qnaNo})">
										<td>${q.qnaTitle}</td>
										<td>${q.qnaContents}</td>
									</tr>
								</c:forEach>
						</a>
							<ul class="hide">
								<li>메뉴1-1</li>
								<li>메뉴1-2</li>
								<li>메뉴1-3</li>
								<li>메뉴1-4</li>
								<li>메뉴1-5</li>
								<li>메뉴1-6</li>
							</ul></li>
					</ul>
				</div>
				<div>
						<table border="1">
							<thead />
							<tbody id="borderBody">
								<c:if test="${empty qnas }">
									<tr>
										<td colspan="5">게시글이 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty qnas }">
									<tr>
										<c:forEach items="${qnas }" var="q">
											<tr onmouseover='this.style.background="#fcecae";'
												onmouseleave='this.style.background="#FFFFFF";'
												onclick="qnaContents(${q.qnaNo})">

												<td>${q.qnaTitle}</td>
												<td>${q.qnaContents}</td>
											</tr>
										</c:forEach>
									</tr>
								</c:if>
							</tbody>

						</table>
					</div>
				
			</div>



			<div>
				<select id="searchKey" name="searchKey">
					<option value="전체">전체</option>
					<option value="작성자">작성자</option>
					<option value="제목">제목</option>
					<option value="내용">내용</option>
				</select> <select id="searchKey" name="searchKey">
					<option value="전체">전체</option>
					<option value="작성자">작성자</option>
					<option value="제목">제목</option>
					<option value="내용">내용</option>
				</select> <span> <input type="text" id="searchVal">&nbsp; <input
					type="button" onclick="searchList()" value="검색">
				</span>
			</div>
			<div>
				<table border="1">

				</table>
			</div>
			<br>
			<div>
				<button type="button" onclick="location.href='borderInsertForm.do'">글쓰기</button>
				<c:if test="${user_no == 1}">
					<button type="button" onclick="location.href='borderInsertForm.do'">글쓰기</button>
				</c:if>
			</div>
			<input type="hidden" id="borderId" name="borderId">
		</form>

	</div>
	<script type="text/javascript">
	
	 // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            // 현재 클릭한 태그가 a 이기 때문에
            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
            $(this).next("ul").toggleClass("hide");
        });
    });


	
	function borderContents(n){
		
		console.log(n);
		fmm.borderId.value = n;
		console.log(fmm.borderId.value);
		fmm.action = "borderView.do";
		fmm.submit();
	}
	
function qnaContents(g){
		
		console.log(g);
		fmm.qnaNo.value = g;
		console.log(fmm.qnaNo.value);
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