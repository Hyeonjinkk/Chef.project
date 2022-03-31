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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>

<body>

	<table class="table table-hover text-nowrap">
		<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col">Product Detail Views</th>
				<th scope="col">Unique Purchases</th>
				<th scope="col">Quantity</th>
				<th scope="col">Product Revenue</th>
				<th scope="col">Avg. Price</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">Value</th>
				<td>18,492</td>
				<td>228</td>
				<td>350</td>
				<td>$4,787.64</td>
				<td>$13.68</td>
			</tr>
			<tr>
				<th scope="row">Percentage change</th>
				<td><span class="text-danger"> <i
						class="fas fa-caret-down me-1"></i><span>-48.8%%</span>
				</span></td>
				<td><span class="text-success"> <i
						class="fas fa-caret-up me-1"></i><span>14.0%</span>
				</span></td>
				<td><span class="text-success"> <i
						class="fas fa-caret-up me-1"></i><span>46.4%</span>
				</span></td>
				<td><span class="text-success"> <i
						class="fas fa-caret-up me-1"></i><span>29.6%</span>
				</span></td>
				<td><span class="text-danger"> <i
						class="fas fa-caret-down me-1"></i><span>-11.5%</span>
				</span></td>
			</tr>
			<tr>
				<th scope="row">Absolute change</th>
				<td><span class="text-danger"> <span>-17,654</span>
				</span></td>
				<td><span class="text-success"> <i
						class="fas fa-caret-up me-1"></i><span>28</span>
				</span></td>
				<td><span class="text-success"> <i
						class="fas fa-caret-up me-1"></i><span>111</span>
				</span></td>
				<td><span class="text-success"> <i
						class="fas fa-caret-up me-1"></i><span>$1,092.72</span>
				</span></td>
				<td><span class="text-danger"> <i
						class="fas fa-caret-down me-1"></i><span>$-1.78</span>
				</span></td>
			</tr>
		</tbody>
	</table>




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
								<th>작성자</th>
								<td width="250px">${userAlias}<input type="hidden"
									id="userNo" name="userNo" value="${userNo}"></td>

								<th width="350px">등록일자</th>
								<td width="150px"><input type='date' id='currentDate'
									name="rDate" readOnly style="border: none;" /></td>
							</tr>

							<tr>
								<th colspan="2" width="30%">
									<h2>제목</h2>
								</th>
								<td colspan="2" width="70%"><input type="text"
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
										<input type="text" id="manual${i}" name="manual${i}" value=""
											style="font-size: 2em">
									</div>
								</td>

							</tr>
						</c:forEach>
						<div>
							<input type="hidden" value="1" id="insertNo" name="insertNo">
							<button type="button" onclick="insetCheck()">등록하기</button>
							<button type="button" onclick="home()">취소하기</button>
							<br> <input type="button" value="+" onclick="plusInsert()"
								id="btnClick">
						</div>
					</table>
					<button type="button" onclick="insetCheck()">등록하기</button>
					<button type="button" onclick="home()">취소하기</button>
				</form>


			</div>

		</div>
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
