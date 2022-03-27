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
</style>
</head>

<body>
	<div align="center">
		<table>
			<thead>
				<h1>레시피 등록부분</h1>
			</thead>
			<tbody>
				<tr>
					<th>작성자</th>
					<td width="250px">${userId}</td>

					<th width="350px">등록일자</th>
					<td width="150px"><input type='date' id='currentDate' readOnly style="border: none;"/></td>
				</tr>

				<tr>
					<th colspan="2" width="30%">
						<h2>제목</h2>
					</th>
					<td colspan="2" width="70%"><input type="text" id="recipeName"
						name="recipeName"></td>
				</tr>
				<tr>
					<th colspan="2" width="30%">
						<h3>재료</h3>
					</th>
					<td colspan="2" width="70%"><input type="text" id="recipeName"
						name="recipeName"></td>
				</tr>




			</tbody>

			<!-- 메인 메뉴 이미지 -->
			<tr>
				<th colspan="2" width="30%">
					<h3>
						메인 메뉴 이미지 <input type="file" onchange='ReaderMainImg(event, 1)'>
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
						완성 메인 이미지 <input type="file" onchange='ReaderMainImg(event, 2)'>
					</h3>
				</th>

				<td colspan="2">
					<div align="left">
						<img id='mainImg2' style="width: 350px;"> <input
							type="hidden" id="mainImgV2" name="recipeImgLg" value="">
					</div>
				</td>

			</tr>


		</table>
		<p></p>

		<!---내용 등록 -->
		<table id="isnertTbl" name="isnertTbl">


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
					<td><img id='output${i}' style="width: 350px;"></td>

					<td colspan="2">
						<div align="left">
							<input type="text" id="manual${i}" name="manual${i}"
								value="${i}." style="font-size: 2em">
						</div>
					</td>

				</tr>
			</c:forEach>
			<div>
				<input type="hidden" value="1" id="insertNo" name="insertNo">
				<button type="submit">등록하기</button>
				<button type="button" onclick="home()" id="home" name="home">취소하기</button>
				<br> <input type="button" value="+" onclick="plusInsert()"
					id="btnClick">
			</div>
		</table>
	</div>
	<div align="center">
		<button type="submit">등록하기</button>
		<button type="button" onclick="home()" id="home" name="home">취소하기</button>
	</div>
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
