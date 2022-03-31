<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
input[type=date]:focus {
	outline: none;
}
</style>
<form id="recipeViewFrm" name="recipeViewFrm" method="post">






	<input type="hidden" name="recipeSeq" value="${recipe.recipeSeq}">
	<section class="single-post spad">
		<div class="single-post__hero set-bg"
			data-setbg="${recipe.recipeImageLg }"
			style="background-image: url(&quot;img/categories/single-post/single-post-hero.jpg&quot;); background-size: 55% 99%;"></div>
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-8">
					<div class="single-post__title">

						<div class="single-post__title__text">
							<h4>${recipe.recipeName }</h4>
							<ul class="widget">
								<li>by ${recipe.userAlias }</li>
								<li>${recipe.recipeDate }</li>
								<li>조회수 ${recipe.recipeHit }</li>
							</ul>
						</div>
					</div>

					<div class="single-post__top__text">
						<p style="text-align: center;">${recipe.recipeContent }</p>
					</div>
					<div class="single-post__recipe__details">
						<div class="single-post__recipe__details__option"
							style="padding-left: 130px;">
							<ul>
								<li>
									<h5>
										<i class="fa fa-user-o"></i> 회원명
									</h5> <span>${recipe.userAlias }</span>
								</li>
								<li>
									<h5>
										<i class="fa fa-clock-o"></i> 등록일자
									</h5> <span>${recipe.recipeDate }</span>
								</li>
								<li>
									<h5>
										<span class="material-icons">thumb_up</span> 좋아요 수 :
										${recipe.recipeLike }
									</h5>

								</li>

							</ul>
						</div>
						<div class="single-post__recipe__details__indegradients">
							<h5>준비 재료</h5>
							<ul>
								<li>${recipe.recipeParts }</li>

							</ul>
						</div>
						<div class="single-post__recipe__details__direction">
							<h5>간략 설명</h5>

							<!-- manual 1~20까지 출력 -->



							<ul>
								<c:forEach var="i" begin="1" end="20">
									<c:set var="manual" value="manual${i }" />
									<c:if test="${not empty recipe[manual] }">
										<c:if test="${'' ne recipe[manual]}">
											<li><span>${i }</span> ${recipe[manual] }</li>
										</c:if>
									</c:if>
								</c:forEach>

							</ul>
						</div>
					</div>



					<div class="single-post__more__details"
						style="margin-bottom: 70px;">
						<div class="row">
							<c:forEach var="i" begin="1" end="20">
								<c:set var="manual" value="manual${i }" />
								<!-- manualImage 1~20까지 출력 -->
								<c:set var="image" value="manualImage${i }" />
								<c:if test="${not empty recipe[image] }">
									<c:if test="${'' ne recipe[image]}">
										<div class="col-lg-6 col-md-6">
											<img src="${recipe[image]}" alt="">
										</div>
									</c:if>
								</c:if>
								<c:if test="${not empty recipe[manual] }">
									<c:if test="${not empty recipe[image]}">
										<c:if test="${'' ne recipe[manual]}">
											<div class="col-lg-6 col-md-6">
												<p>${recipe[manual] }</p>
											</div>
										</c:if>
									</c:if>
									<c:if test="${empty recipe[image]}">
										<c:if test="${'' ne recipe[manual]}">
											<div class="col-lg-12 ">
												<p style="text-align: center;">${recipe[manual] }</p>
											</div>
										</c:if>
									</c:if>
								</c:if>
							</c:forEach>

						</div>

					</div>



					<div class="single-post__author__profile">
						<div class="single-post__author__profile__pic"></div>
						<div class="single-post__author__profile__text">
							<h4>"${recipe.userAlias }"</h4>
							<p>${recipe.recipeContent }</p>

						</div>
					</div>



					<c:if test="${userAlias eq recipe.userAlias }">
						<div align="center">
							<button type="button" onclick="update()" class="site-btn">레시피
								수정</button>
							<button type="button" onclick="delete1()" class="site-btn">레시피
								삭제</button>
						</div>
					</c:if>



					<div class="single-post__comment">
						<div class="widget__title">
							<h4>Comment</h4>
						</div>

						<c:forEach items="${comments}" var="c">
							<c:if test="${c.comSeq eq recipe.recipeSeq}">
								<c:if test="${c.comCategory == '1' }">

									<div class="single-post__comment__item">

										<div class="single-post__comment__item__text">
											<h5>${c.comAlias}<input type="hidden" id="comNo"
													name="comNo" value="${c.comNo }" />
											</h5>
											<span><input type="date" id="updateDate"
												name="updateDate" value="${c.comDate }"
												style="border: none;" readonly></span>
											<!-- 기존 내용 -->
											<pre
												style="height: 50px; width: 500px; font-family: 'Noto Sans KR', sans-serif;"
												id="beforeContents${c.comNo }">${c.comContents}</pre>
											<!-- 수정 버튼 클릭시 수정 text area 생성 -->
											<textarea style="height: 50px; width: 500px; display: none;"
												id="afterContents${c.comNo }" name="afterValue"></textarea>

											<c:if test="${userAlias eq c.comAlias }">
												<ul>
													<li>
														<button type="button" onclick="updateButton(${c.comNo })"
															id="updateBtn${c.comNo }" name="updateBtn"
															style="border: 0px; cursor: pointer;">수정</button> <input
														type="hidden" id="comCategory" name="comCategory"
														value="1">
														<button type="button" onclick="cancelButton(${c.comNo })"
															id="cancel${c.comNo }" name="cancel"
															style="display: none; border: 0px; cursor: pointer;">취소</button>
													</li>
													<li>
														<button type="button" onclick="deleteDo(${c.comNo })"
															id="deleteBtn${c.comNo }" name="deleteBtn"
															style="border: 0px; cursor: pointer;">삭제</button>
													</li>
												</ul>
											</c:if>
										</div>
									</div>
								</c:if>
							</c:if>
						</c:forEach>
						<div class="single-post__recipe__details">
							<div class="single-post__recipe__details__option"
								style="padding-left: 10px;">
								<ul>
									<li>
										<h5>
											<i class="fa fa-user-o"></i>${userAlias }
										</h5>
									</li>
									<li>
										<h5>
											<i class="fa fa-clock-o"></i> 등록일자
										</h5> <span><input type='date' id='currentDate'
											name="comDate" readOnly style="border: none;" /></span>
									</li>
									<li>
										<button type="button" onclick="insertComments()"
											style="border: 0px; cursor: pointer;">등록</button>

									</li>
								</ul>
								<div align="center">
									<textarea id="comments" name="comContents" style="width: 100%;"></textarea>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>



		</div>
	</section>

</form>
<!-- 댓글창 -->









<script>



	/* 댓글 등록 */
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
	
	/* 댓글 수정 버튼 */
	 function updateButton(n) {
         let updateBtn = document.getElementById('updateBtn' + n);
         updateBtn.setAttribute("onClick", "updateDo("+n+")");
		
         let date = document.getElementById('updateDate');
         date.setAttribute('id','currentDate');

         let before = document.getElementById('beforeContents' + n);
         let after = document.getElementById('afterContents' + n);
         let cancelBtn = document.getElementById('cancel' + n);
         let deleteBtn = document.getElementById('deleteBtn' + n);

         // pre 태그 숨기기
         before.style.display = "none";

         // pre 태그 내용 Text Area에 innerHTML & Display 초기화
         after.value = before.innerHTML;
         after.style.display = "";
		
         // 삭제버튼 숨기기 & 수정취소버튼 Display 초기화
         deleteBtn.style.display = "none";
         cancelBtn.style.display = "";
         
     }
	 /* 댓글 수정 취소 버튼 */
     function cancelButton(n) {
         const check = confirm('댓글 수정을 취소하시겠습니까?\n' + '→수정 중 입력한 값을 모두 잃게 됩니다.');

         if(check == true) {
             let before = document.getElementById('beforeContents' + n);
             let after = document.getElementById('afterContents' + n);
             let cancelBtn = document.getElementById('cancel' + n);
             let deleteBtn = document.getElementById('deleteBtn' + n);
             let updateBtn = document.getElementById('updateBtn'+ n);

             before.style.display = "";

             after.innerHTML = "";
             after.style.display = "none";

             deleteBtn.style.display = "";
             cancelBtn.style.display = "none";

             updateBtn.setAttribute("onClick", "updateButton("+n+")");
             
             let date = document.getElementById('currentDate');
             date.setAttribute('id','updateDate');

         }
     }
     /* 댓글 수정 처리 버튼 */
     function updateDo(n) {
         let before = document.getElementById('beforeContents' + n);
         let after = document.getElementById('afterContents' + n);
         let cancelBtn = document.getElementById('cancel' + n);
         let deleteBtn = document.getElementById('deleteBtn' + n);
         let updateBtn = document.getElementById('updateBtn'+ n);


         if(after.value != ''){
             let check = confirm('입력한 내용으로 댓글을 수정하시겠습니까?');
             if(check == true){
            	 
            		 
                 recipeViewFrm.action = "updateComments.do";
                 recipeViewFrm.submit();
                 
            	 
             }

         } else {
             alert('수정 내용을 입력해주세요.');
         }

     }
     /* 댓글 삭제 처리 */
     function deleteDo(n){
    	 let check = confirm('해당 댓글을 삭제하면 복구가 불가능합니다.\n' + "그래도 삭제하시겠습니까?");
    	 if(check == true){
    		  recipeViewFrm.action = "deleteComments.do?comNo=" + n;
              recipeViewFrm.submit();
    	 }
     }
	
	

	/* 레시피 수정 시 처리 */
	if ('${message}' != '') {
		alert('${message}');
		window.location = "recipeView.do?recipeSeq=" + ${recipe.recipeSeq};
	}

	/* 레시피 수정 버튼 Action */
	function update() {
		recipeViewFrm.action = "updateRecipeForm.do";
		recipeViewFrm.submit();

	}
	
	/* 레시피 삭제 버튼 Action */
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

	/* 현재 시간 */
	document.getElementById('currentDate').value = new Date().toISOString()
			.substring(0, 10);
	;
</script>
