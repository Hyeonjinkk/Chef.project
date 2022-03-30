<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
</head>
<style>

span {
	padding: 10px;
}

#inside {
	margin: 20px;
}

</style>
<body>
	<div align="center">
		<h4>나의 냉장고</h4>
		
		<c:if test="${empty basket }">
			<br><br><br>
				텅...
			<br><br><br>
		</c:if>
		
		
		<c:if test="${not empty basket }">
		
			
			
			<form id="myBk" action="">
				<button onclick="searchRecipe()">레시피 검색</button><br>
				
				<div class="inside">
				<c:forEach items="${basket }" var="bk">
					<span>
						<input type="checkbox" id="haveIn" name="ingredient">${bk.ingredient}
					</span>
				</c:forEach>
				</div>
				
				<br>
				<button onclick="deleteIngr()">선택삭제</button>
				<button onclick="deleteAll()">냉장고 비우기</button>
				
			</form>
		</c:if>
			
			<form id="insertBk" action="insertBasket.do" method="POST">
				 가지고 있는 식재료를 냉장고에 담아주세요.<br>
				<input type="text" id="insertIn" name="ingredient" required="required">&nbsp;
				<button type="button" onclick="isInCheck()">담기</button>
			</form>

		
	</div>
	
	
<script type="text/javascript">

	 function isInCheck() {
		$.ajax({
			url : "ajaxBasketInCheck.do",
			type : "post",
			data : {"str2" : $("#insertIn").val()},
			dataType : "text",
			success : function(result) {
				
				if(result == '1') {
					alert("이미 냉장고에 있는 재료입니다.");
					$('#insertIn').focus();
				} else {
					alert("냉장고에 담기 성공");
					insertBk.submit();
					$('#insertIn').val('');
					$('#insertIn').focus();
				}
				
				
			}
		})
	}
	
	function deleteAll() {
		myBk.action = "deleteAll.do";
		myBk.submit();
	}
	
</script>

</body>
</html>
