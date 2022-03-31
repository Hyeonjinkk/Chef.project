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
			<h3 style="padding-top: 3px;">자주묻는 질문</h3>
			<span>3일내에 답변해드리겠습니다.</span>
		</div>

		<div>
			<form id="fmr" method="post">
				<div align="center">
					<select id="findKey" name="findKey"
						style="width: 100px; border: none;">
						<option value="전체">전체</option>
						<option value="질문">질문</option>
						<option value="답변">답변</option>
					</select> <span> <input type="text" id="findVal"
						style="height: 47px;"><input class="site-btn"
						type="button" onclick="searchList()" value="검색">
					</span>
				</div>

				<div>
					<table id="contents" class="table table-hover">
						<tbody id="qnaBody">
							<c:if test="${empty qnaQ }">
								<tr>
									<td colspan="5">게시글이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty qnaQ }">
								<c:forEach items="${qnaQ }" var="q">
									<tr>
										<td onclick="qus()">질문${q.qnaNo} : ${q.qnaTitle}</td>
									</tr>
									<tr>
										<td id="qus" style="none;">답변:${q.qnaContents }</td>
									</tr>
									<c:if test="${user_no == 1}">
										<button type="submit" onclick="qnaUpdate()">수정</button>
										<button type="submit">삭제</button>
									</c:if>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<button type="button" onclick="location.href='qnaInsertForm.do'">QnA
						등록</button>
					<c:if test="${user_no == 1}">
						<button type="button" onclick="location.href='qnaInsertForm.do'">QnA
							등록</button>
					</c:if>
				</div>
				<input type="hidden" id="borderId" name="borderId">
			</form>
		</div>
	</div>
	<script type="text/javascript">
	
	 // html dom 이 다 로딩된 후 실행된다.
   function qus(){
	   if($('#qus').css('display') == 'none'){
			$('#qus').show();
		}else{
			$('#qus').hide();
		}
	 }
function qnaUpdate(){
	
}
	 
function qnaContents(g){
		
		console.log(g);
		fmr.qnaNo.value = g;
		console.log(fmr.qnaNo.value);
		fmr.action = "borderView.do";
		fmr.submit();
	}
	
	function searchList() {
		$.ajax({
			url : "ajaxQnaSearch.do",
			type : "post",
			data : {"key" : $("#findKey").val(), "val" : $("#findVal").val()},
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
		var tb = $("#qnaBody");
		$("#qnaBody").empty();
		$.each(data, function(index, item) {
			console.log(item.qnaContents);
			
			var html = $("<li class='menu'>");
			html.append(
					$("<a/>").text(item.qnaTitle),
					$("<ul class='hide'/>").text(item.qnaContents),
					);
			tb.append(html);
		
	$(document).ready(function(){
  	  $(".menu>a").click(function(){
  	      $(this).next("ul").toggleClass("hide");
 	   								});
								});
});
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