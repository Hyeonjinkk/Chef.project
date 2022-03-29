<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<form id="recipeViewFrm" name="recipeViewFrm" method="post">

	<div align="center">
		<h1>${recipe.userAlias }</h1>
		<input type="hidden" name="recipeSeq" value="${recipe.recipeSeq}">
		<c:forEach var="i" begin="1" end="20">
			<!-- manual 1~20까지 출력 -->
			<c:set var="manual" value="manual${i }" />

			<!-- manualImage 1~20까지 출력 -->
			<c:set var="image" value="manualImage${i }" />

			<!-- EL문안에 EL문 입력 -->
			<c:if test="${not empty recipe[manual] }">
				<c:if test="${'' ne recipe[manual]}">
					<h4>${recipe[manual] }</h4>
				</c:if>

			</c:if>

			<c:if test="${not empty recipe[image] }">
				<c:if test="${'' ne recipe[image]}">
					<img src="${recipe[image]}" style="width: 350px;">
				</c:if>
			</c:if>

		</c:forEach>

		<h1>완성</h1>
		<img src="${recipe.recipeImageLg }" style="width: 450px;">
		<c:if test="${userAlias eq recipe.userAlias }">
			<div align="center">
				<button type="submit" onclick="update()">수정하기</button>
				<button type="submit" onclick="delete1()">삭제하기</button>
			</div>
		</c:if>

	</div>
	<!-- 댓글창 -->

	<div align="center">
		<table id="tbl">
			<c:forEach items="${comments}" var="c">
				<c:if test="${c.comSeq eq recipe.recipeSeq}">
					<c:if test="${c.comCategory == '1' }">

						<tr>
							<td width="150px">${c.comAlias}</td>
							<td>${c.comDate}</td>

						</tr>
						<tr id="asd">
							<td colspan="4"><pre>${c.comContents}</pre></td>

							<td>
								<button type="button" onclick="insertComments()"
									style="border: 0px; cursor: pointer;">등록</button>
							</td>

						</tr>
					</c:if>
				</c:if>
			</c:forEach>

		</table>
	</div>



	<div align="center">
		<table id="tbl">
			<tr>
				<td width="150px">작성자</td>
				<td><b>${userAlias}</b></td>
				<td><input type='date' id='currentDate' name="comDate" readOnly
					style="border: none;" /> <input type="hidden" name="comCategory"
					value="1" /> <input type="hidden" name="comSeq"
					value="${recipe.recipeSeq}" /></td>
			</tr>
			<tr id="asd">
				<td colspan="4"><textarea id="comments" name="comContents"
						style="width: 100%;"></textarea></td>
				<td>
					<button type="button" onclick="insertComments()"
						style="border: 0px; cursor: pointer;">등록</button>
				</td>

			</tr>

		</table>
	</div>


</form>
<script>
	function insertComments() {
		if ('${userAlias}' == '') {
			let check = confirm('로그인이 필요한 기능입니다.\n' + '로그인 하시겠습니까?');
			if (check == true) {
				location.href = "userLoginForm.do";
			}
		} else {
			let value = document.getElementById('comments').value;
			if (value == '') {
				alert('댓글을 입력해주세요.');
			} else {
				recipeViewFrm.action = "insertComments.do";
				recipeViewFrm.submit();
			}
		}
	}

	if ('${message}' != '') {
		alert('${message}');
		window.location = "recipeView.do?recipeSeq=" + $
		{
			recipe.recipeSeq
		}
		;
	}

	function update() {
		recipeViewFrm.action = "updateRecipeForm.do";
		recipeViewFrm.submit();

	}

	function delete1() {
		let check = confirm('해당 게시글을 삭제하시겠습니까?');
		if (check == true) {
			recipeViewFrm.action = "deleteRecipe.do?recipeSeq=" + $
			{
				recipe.recipeSeq
			}
			;
			recipeViewFrm.submit();
		}
	}
</script>
<script>
	document.getElementById('currentDate').value = new Date().toISOString()
			.substring(0, 10);
	;
</script>
