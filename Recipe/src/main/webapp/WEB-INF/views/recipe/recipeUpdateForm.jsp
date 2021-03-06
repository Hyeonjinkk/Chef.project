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
}

#recipeName {
	font-size: 2em;
}

#recipeKinds {
	font-size: 2em;
}

#recipeParts {
	font-size: 2em;
}
</style>
</head>

<body>
	<div align="center">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form action="recipeUpdate.do" method="POST">
						<table>
							<thead>
								<h1>레시피 등록부분!</h1>
							</thead>
							<tbody>
								<tr>
									<th><h3>작성자</h3></th>
									<td width="250px"><h3>${recipe.userAlias}</h3> <input
										type="hidden" id="userNo" name="userNo"
										value="${recipe.userNo}"> <input type="hidden"
										id="recipeSeq" name="recipeSeq" value="${recipe.recipeSeq}">
									</td>

									<th width="350px"><h3>등록일자</h3></th>
									<td width="150px"><h3>
											<input type='date' id='currentDate' name="rDate" readOnly
												style="border: none;" />
										</h3></td>
								</tr>

								<tr>
									<th colspan="2" width="30%">
										<h3>제목</h3>
									</th>
									<td colspan="2" width="70%"><input type="text"
										id="recipeName" name="recipeName"
										value="${recipe.recipeName }" style="border:none;"></td>
								</tr>
								<tr>
									<th colspan="2" width="30%">
										<h3>재료</h3>
									</th>
									<td colspan="2" width="70%"><input type="text"
										id="recipeParts" name="recipeParts"
										value="${recipe.recipeParts}"></td>
								</tr>
								<tr>
									<th colspan="2" width="30%">
										<h3>종류</h3>
									</th>
									<td colspan="2" width="70%"><input type="text"
										id="recipeKinds" name="recipeKinds"
										value="${recipe.recipeKind}"></td>
								</tr>
								<tr>
									<th colspan="2" width="30%">
										<h3>조리방식</h3>
									</th>
									<td colspan="2" width="70%"><input type="text"
										id="recipeWay" name="recipeWay" value="${recipe.recipeWay}"></td>
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
										<img id='mainImg1' style="width: 180px;"
											src="${recipe.recipeImageSm}"> <input type="hidden"
											id="mainImgV1" name="recipeImgSm"
											value="${recipe.recipeImageSm}">
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
										<img id='mainImg2' style="width: 350px;"
											src="${recipe.recipeImageLg}"> <input type="hidden"
											id="mainImgV2" name="recipeImgLg"
											value="${recipe.recipeImageLg}">
									</div>
								</td>

							</tr>


							<!---내용 등록 -->


							<!-- 추가하면 input 생겨나게 하기 -->

							<c:forEach var="i" begin="1" end="20">
								<c:set var="insert" value="insert${i}" />

								<c:set var="manual" value="manual${i}" />
								<c:set var="manualImage" value="manualImage${i}" />



								<tr style="display: none;" id="${insert}" name="${insert}"
									class="updateTr">
									<th colspan="2" width="30%">
										<h3>
											<input type="file" onchange='Reader(event, ${i})'><input
												type="hidden" id="manualImage${i}" class="updateSrc"
												name="manualImage${i}" value="${recipe[manualImage]}">
										</h3>
									</th>
									<td><img id='output${i}' style="width: 100px;"
										class="updateImg" src="${recipe[manualImage]}"></td>

									<td colspan="2">
										<div align="left">
											<input type="text" id="manual${i}" name="manual${i}"
												class="updateText" value="${recipe[manual]}"
												style="font-size: 2em">
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
						<button type="submit">수정하기</button>
						<button type="button" onclick="home()">취소하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
<script>
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


