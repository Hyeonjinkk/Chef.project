<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<title>Insert title here</title>

<style>


table td .inpAlias {
	padding: 3px;
	font-size: 12px;
	color: #999;
}

.container input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inling-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}


.modal {
	
	
}

</style>

</head>


<body>
	<div align="center">

		<div>
			<h4>${message }</h4>
		</div>
		<hr>
		<form id="frm" method="get">
			<table>
				<tr>
					<th width="100">아이디</th>
					<td width="500">${userId }
					<td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${userName }</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" id="userAlias" name="userAlias"
						value="${userAlias }"> <span class="inpAlias">20자
							이내로 입력해주세요.</span></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<button type="button" id="openModalChangePwd">
						비밀번호 변경</button>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${userTel }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${userAddress }</td>
				</tr>
			</table>



			<button type="button">변경하기</button>
		</form>
	</div>



	<!-- 패스워드 변경 모달창 -->
	<div id="changePwdBox" class="modal">
		<form action="" method="post">
			<div class="container">
				<label for="oldPwd"><b>기존 패스워드 확인</b></label> 
				<input type="password" placeholder="기존 패스워드를 입력하세요." name="userPassword" required="required"> 
				
				<label for="newPwd1"><b>새 패스워드 입력</b></label> 
				<input type="password" placeholder="새 패스워드를 입력해주세요." name="userPassword" required="required"> 
				
				<label for="newPwd2"><b>새 패스워드 확인</b></label> 
				<input type="password" placeholder="새 패스워드를 확인해주세요." name="userPassword"
					required="required">

				<button type="submit">비밀번호 변경하기</button>
				<button type="button" onclick="document.getElementById('changePwd').style.display='none'">취소하기</button>
			</div>
		</form>
	</div>


	<script type="text/javascript">
		//패스워드 변경 버튼 
		$('#openModalChangePwd').on('click', function() {
			$('#changePwdBox').modal('show');
		});
	</script>
</body>
</html>