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
									
										<td onclick="qus(${q.qnaNo})">질문${q.qnaNo} : ${q.qnaTitle} <c:if test="${'관리자' eq userAlias}">
										<button type="submit" onclick="qnaUpdate()">수정</button>
										<button type="submit">삭제</button>
									</c:if></td>
									</tr>
									<tr>
									
										<td id="qus${q.qnaNo }" style="display:none" >답변:${q.qnaContents } <c:if test="${'관리자' eq userAlias}">
										<button type="submit" onclick="qnaUpdate()">수정</button>
										
									</c:if></td>
									</tr>
									
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<c:if test="${'관리자' eq userAlias}">
						<div align="center" ><button type="button" onclick="location.href='qnaInsertForm.do'" class="site-btn">FAQ등록</button></div>
					</c:if>
				</div>
				<input type="hidden" id="borderId" name="borderId">
			</form>
		</div>
	</div>
	<script type="text/javascript">
	
	 // html dom 이 다 로딩된 후 실행된다.
   function qus(n){
	   if($('#qus' + n).css('display') == 'none'){
			$('#qus' + n).show();
		}else{
			$('#qus' + n).hide();
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