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

img {
 max-width: 100%;
 max-height: 100%;
 text-align: center;
}

.empty {
 height: 200px;
 width: 200px;
}

span {
	padding: 10px;
}

.content {
	margin: 40px;	
}

#inside {
	margin: 20px;
}


/* .img {
	position: relative;
    background-image: url(./img/basket.png);                                                               
    height: 100vh;
    background-size: cover;
}

.img-cover{
   position: absolute;
   height: 100%;
   width: 100%;                                                                 
   z-index:1;
}

.img .content {
     position: absolute;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   
     font-size:5rem;
     color: white;
     z-index: 2;
     text-align: center;
} */

.deleteBtn {
	margin: 20px;
}
</style>
<body>

<div class="container">
    <div class="row"  style="height: 10px;">
      <div class="col-xs-12"></div>
    </div>


    <div class="row">
      <div class="col-lg-3"></div>
      <div class="col-lg-6">
        <!-- Sign In Section Begin -->
        <div class="">
          <div class="signin__warp">
            <div class="signin__content">

              <div class="signin__form">
                <ul class="nav" role="">
		
		                  <li class="nav-item">
		                    <a class="nav-link active" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="true" style="font-family: 'Do Hyeon', sans-serif;width: 640px;font-size: 30px;">나의 냉장고</a>
		                  </li>
		
		          </ul>
          
		<c:if test="${empty basket }">
			<br><br><br>
			<div align="center">
			<div class="empty">
				<img src="img/empty.jpg">
			</div>
			</div>
			<br><br><br>
		</c:if>
		
		
		<c:if test="${not empty basket }">
		
			
			

			<form id="myBk" action="searchBkRecipe.do"  method="post">
				<br>
				<br>
				<br>
				<div>냉장고 속 재료들로 만들 수 있는</div>
				<button type="submit" class="site-btn" onclick="bkArray()">레시피 검색</button><br>
				<br>
				<br>
				<br>
				<div class="img">
				<div class="content">
				
				<c:forEach items="${basket }" var="bk">

					
					<span><label>
						<input type="checkbox" id="haveIn" name="ingredient" value="${bk.ingredient}">${bk.ingredient}
						<input type="hidden" name="ingredient" value="${bk.ingredient}">
					</label></span>
				</c:forEach>
				
				</div>
				<div class="img-cover"></div>
				</div>
				
				<br>
				<div class="deleteBtn">
				<button onclick="deleteClick()">선택삭제</button>
				<button onclick="deleteAll()">냉장고 비우기</button>
				</div>
			</form>
			
		</c:if>
			
			<form id="insertBk" action="insertBasket.do" method="POST">
				 가지고 있는 식재료를 냉장고에 담아주세요.<br>
				<input type="text" id="insertIn" name="ingredient" required="required">&nbsp;
				<button type="button" class="site-btn" onclick="isInCheck()">담기</button>
			</form>

		
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
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
