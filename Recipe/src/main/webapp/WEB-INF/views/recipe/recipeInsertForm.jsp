<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">
<style>
table, th, tr, td {
	border-collapse: collapse;
	border: 1px solid;
}

td {
	text-align: center;
	width: 100%;
}

#recipeName {
	font-size: 2em;
	width:100%;
}

#recipeKinds {
	font-size: 2em;
	width:100%;
}

#recipeParts {
	font-size: 2em;
	width:100%;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>

<body>
	<div align="center">
		<c:if test="${empty userId }">
			<h1>로그인이 필요합니다.</h1>
			<p>
				회원입니까?<a href="userLoginForm.do"> 로그인</a>
			</p>
			<p>
				아직 회원이 아니라면<a href="userJoinForm.do"> 회원가입</a>
			</p>
		</c:if>
		<c:if test="${not empty userId }">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<form action="recipeInsert.do" method="POST" id="insertFrm"
							name="insertFrm">
							<table>
								<thead>
									<h1>레시피 등록부분!</h1>
								</thead>
								<tbody>
									<tr>
										<th><h2>작성자</h2></th>
										<td width="250px"><h2>${userAlias}</h2><input type="hidden"
											id="userNo" name="userNo" value="${userNo}"></td>

										<th width="350px"><h2>등록일자</h2></th>
										<td width="150px"><h2><input type='date' id='currentDate'
											name="rDate" readOnly style="border: none;" /></h2></td>
									</tr>

									<tr>
										<th colspan="2" width="10%">
											<h2>제목</h2>
										</th>
										<td colspan="2" width="90%"><input type="text"
											id="recipeName" name="recipeName"></td>
									</tr>
									<tr>
										<th colspan="2" width="30%">
											<h3>재료</h3>
										</th>
										<td colspan="2" width="70%"><input type="text"
											id="recipeParts" name="recipeParts"></td>
									</tr>
									<tr>
										<th colspan="2" width="30%">
											<h3>종류</h3>
										</th>
										<td colspan="2" width="70%"><input type="text"
											id="recipeKinds" name="recipeKinds"></td>
									</tr>
									<tr>
										<th colspan="2" width="30%">
											<h3>조리방식</h3>
										</th>
										<td colspan="2" width="70%"><input type="text"
											id="recipeWay" name="recipeWay"></td>
									</tr>




								</tbody>

								<!-- 메인 메뉴 이미지 -->
								<tr>
									<th colspan="2" width="30%">
										<h3>
											메인 메뉴 이미지 <input type="file"
												onchange='ReaderMainImg(event, 1)'>
										</h3>
									</th>

									<td colspan="2">
										<div align="left">
											<img id='mainImg1' style="width: 180px;"> <input
												type="hidden" id="mainImgV1" name="recipeImgSm" value="">
										</div>
									</td>

								</tr>


								<!-- 완성 레시피 이미지 -->
								<tr>
									<th colspan="2" width="30%">
										<h3>
											완성 메인 이미지 <input type="file"
												onchange='ReaderMainImg(event, 2)'>
										</h3>
									</th>

									<td colspan="2">
										<div align="left">
											<img id='mainImg2' style="width: 350px;"> <input
												type="hidden" id="mainImgV2" name="recipeImgLg" value="">
										</div>
									</td>

								</tr>
								<!---내용 등록 -->


									<!-- 추가하면 input 생겨나게 하기 -->

									<c:forEach var="i" begin="1" end="20">
										<c:set var="insert" value="insert${i}" />




										<tr style="display: none;" id="${insert}" name="${insert}">
											<th colspan="2" width="30%">
												<h3>
													<input type="file" onchange='Reader(event, ${i})'><input
														type="hidden" id="manualImage${i}" name="manualImage${i}"
														value="">
												</h3>
											</th>
											<td><img id='output${i}' style="width: 100px;"></td>

											<td colspan="2">
												<div align="left">
													<input type="text" id="manual${i}" name="manual${i}"
														placeholder="사진에 대해 설명해주세요" style="font-size: 2em">
												</div>
											</td>

										</tr>
									</c:forEach>
							</table>
							<div>
								<input type="hidden" value="1" id="insertNo" name="insertNo">
								<br>
							</div>
								<button type="button" value="+" onclick="plusInsert()"
									id="btnClick">사진추가</button>
							<button type="button" onclick="insetCheck()">등록하기</button>
							<button type="button" onclick="home()">취소하기</button>
						</form>
					</div>
				</div>
			</div>
		</c:if>
	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>

<script>
	function insetCheck(){
		let check = confirm('등록하시겠습니까?');
		if(check == true) {
			insertFrm.submit();
		}
		
		
	}
	function plusInsert() {
		let i = document.querySelector('#insertNo').value;
		let hiddenTr = document.getElementById('insert' + i);
		hiddenTr.style.display = "";

		document.querySelector('#insertNo').value = ++i;
		if (i == 21) {
			let btn = document.querySelector('#btnClick');
			btn.style.display = "none";
		}

	};

	function home() {
		let val = confirm("취소하시겠습니까?\n" + "입력한 내용을 모두 잃을 수 있습니다.");
		if (val == true) {
			location.href = "recipeList.do";
		}

	};
</script>


<script>

	function Reader(event, n) {

	
		var data = event.target;

		var reader = new FileReader();
		reader.onload = function() {
			var dataURL = reader.result;
			var imageUrl = document.getElementById('manualImage' + n);
			
			var output = document.getElementById("output" + n);
			output.src = dataURL;
			imageUrl.value = output.src;
		};
		reader.readAsDataURL(data.files[0]);
		
	};
</script>



<script>

	function ReaderMainImg(event, n) {

	
		var data = event.target;

		var reader = new FileReader();
		reader.onload = function() {
			var dataURL = reader.result;
			var imageUrl = document.getElementById('mainImgV' + n);
			
			var output = document.getElementById("mainImg" + n);
			output.src = dataURL;
			imageUrl.value = output.src;
		};
		reader.readAsDataURL(data.files[0]);
		
	};
</script>

<script>
  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
</script>
