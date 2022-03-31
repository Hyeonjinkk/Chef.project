<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>
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
		
			
			
			<form id="myBk" action="searchBkRecipe.do"  method="post">
				<button type="submit" onclick="bkArray()">레시피 검색</button><br>
				<br>
				<br>
				<br>
				<div class="inside">
				<c:forEach items="${basket }" var="bk">
					<span><label>
						<input type="checkbox" id="haveIn" name="ingredient" value="${bk.ingredient}">${bk.ingredient}
						<input type="hidden" name="ingredient" value="${bk.ingredient}">
					</label></span>
				</c:forEach>
				</div>
				
				<br>
				
				<a class="btn btn-default" onclick="deleteClick()">선택삭제</a>
				<a class="btn btn-default" onclick="deleteAll()">냉장고 비우기</a>
				
			</form>
			
		</c:if>
			
			<form id="insertBk" action="insertBasket.do" method="POST">
				 가지고 있는 식재료를 냉장고에 담아주세요.<br>
				<input type="text" id="insertIn" name="ingredient" required="required">&nbsp;
				<button type="button" onclick="isInCheck()">담기</button>
			</form>

		
	</div>
	
	
<script type="text/javascript">

	function bkArray() {
		var bkArr = [];
		
		$("input:hidden[name='ingredient']").each(function() {
			bkArr.push($(this).val());
			console.log(bkArr);
		})		
	}
	
	
	
	function isInCheck() {
		$.ajax({
			url : "ajaxBasketInCheck.do",
			type : "post",
			data : {
				"str2" : $("#insertIn").val()
			},
			dataType : "text",
			success : function(result) {

				if (result == '1') {
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
	
	function deleteClick() {
		
		var checkBoxArr = [];
		
		$("input:checkbox[name='ingredient']:checked").each(function() {
			checkBoxArr.push($(this).val());
			console.log(checkBoxArr);
		})
		
	    $.ajax({
			type : "POST",
			url : "deleteIngrdnt.do",
			data : {"chked" : checkBoxArr},
			traditional : true,
			
			success : function(result) {
				console.log(result);
				
				if(result == 0) {
					alert("선택한 항목이 삭제되었습니다.");
					myBk.action = "myBasketList.do";
					myBk.submit();					
				} else {
					alert("정상적으로 처리되지 않았습니다.");
				}
			},
			
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	}

	function deleteAll() {
		myBk.action = "deleteAll.do";
		myBk.submit();
	}
	
</script>

</body>
</html>
