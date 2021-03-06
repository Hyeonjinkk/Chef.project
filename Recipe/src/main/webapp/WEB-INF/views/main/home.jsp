<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>



<form id="recipeForm" name="recipeForm" method="post">
	<div class="container">
		<div class="row">

			<div class="col-lg-12">
				<div class="header__logo" style="padding-top: 0; padding-bottom: 0;">
					<a href="home.do"><img
						style="width: 300px; height: 230px;"
						src="data:image/png;base64,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"></a>
				</div>
			</div>

		</div>
	</div>

	<!-- Categories Section Begin -->
	<section class="categories spad"
		style="padding-top: 0px; padding-bottom: 0;">

		<div class="categories__post">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="categories__post__item categories__post__item--large">
							<div class="categories__post__item__pic set-bg"
								data-setbg="img/categories/categories-post/cp-1.jpg"
								style="background-image: url(&quot;img/categories/categories-post/cp-1.jpg&quot;);">
								<div class="post__meta">
									<h4>08</h4>
									<span>Aug</span>
								</div>
							</div>
							<div class="categories__post__item__text">
								<ul class="post__label--large">


								</ul>
								<h3>???????????? ???????????????!</h3>

								<p>
									???????????? ?????? ?????? ???????????? ????????? ???????????? ?????? ??????????????????! <b>?????? ??????!</b> ??????????????? ????????? ?????????
									?????? ?????? ????????? ??????! ???????????? ?????? ?????? ????????? ?????? ??? ????????? ?????????! <br>????????? ????????? ?????????
									????????? ?????? ????????????! <br>????????? ????????? ?????? ?????? ?????? ????????? ?????????!
								</p>
								<a href="./myBasketList.do" class="primary-btn"
									style="font-family: 'Noto Sans KR', sans-serif;">????????? ??????</a>

								<div style="text-align: left; padding-left: 135px;">
									<span class="material-icons" style="font-size: 18px;">pan_tool
										<small
										style="font-size: 12px; font-family: 'Noto Sans KR', sans-serif;">?????????
											???????????? ????????? ????????? ????????? ???????????????.</small>
									</span>
								</div>
							</div>
						</div>

					</div>
					<div class="col-lg-3">
						<div class="sidebar__item">
							<div class="sidebar__about__item"> 
								<div class="sidebar__item__title">
									<h6 style="font-family: 'Noto Sans KR', sans-serif;">?????????
										?????????</h6>
								</div>
								<c:forEach items="${recipeLike}" var="r" end="0">
								<img src="${r.recipeImageSm }" style="height: 250px;width: 250px;">
								<h6 style="font-family: 'Noto Sans KR', sans-serif;">
									??????! ?????????. ?????? <span>?????????</span>??? ??????
								</h6>
								<p>???????????? ??????????????? ???????????????! ?????? ??? ?????? ??????????????????!</p>
								<a  class="primary-btn" onclick='DefAction("${r.recipeSeq}")' onmouseover="this.style.cursor='pointer';">????????? ??????</a>
								</c:forEach>
							</div>


							<div class="sidebar__item__banner" style="width: 553px;">
								<video style="width: 565px;" autoplay="" loop="" muted=""
									preload="auto">
									<source
										src="https://player.vimeo.com/external/561020313.hd.mp4?s=0fadf083bb8ee2af49e323aa80fdea74a110e0ac&amp;profile_id=174">

								</video>
							</div>


						</div>
					</div>
					<div class=" col-lg-3">

						<div class="sidebar__item__categories">
							<div class="sidebar__item__title">
								<h6>?????? ????????? ???</h6>
							</div>
							<ul>
								<li><a href="#"
									style="font-family: 'Noto Sans KR', sans-serif;">?????? ????????? <span>${recipeCnt + inquiryCnt + noticeCnt + borderCnt }</span></a></li>
								<li><a href="recipeList.do"
									style="font-family: 'Noto Sans KR', sans-serif;">????????? <span>${recipeCnt}</span></a></li>
								<li><a href="noticeList.do"
									style="font-family: 'Noto Sans KR', sans-serif;">???????????? <span>${inquiryCnt + noticeCnt  }</span></a></li>
								<li class="p-left"><a href="noticeList.do"
									style="font-family: 'Noto Sans KR', sans-serif;">?????? ????????? <span>${noticeCnt }</span></a></li>
								<li class="p-left"><a href="inquiryList.do"
									style="font-family: 'Noto Sans KR', sans-serif;">Cooking
										Tip ????????? <span>${inquiryCnt}</span>
								</a></li>
								<li class="p-left"><a href="questionList.do"
									style="font-family: 'Noto Sans KR', sans-serif;">????????? ????????? <span>15</span></a></li>
								<li><a href="borderList.do"
									style="font-family: 'Noto Sans KR', sans-serif;">???????????? <span>${borderCnt }</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Section 3 -->
		<div class="container">
			<div class="row">
				<h2>
					<span class="material-icons" style="font-size: 30px;">label_important&nbsp;</span>???????????????
				</h2><span style="font-family: 'Noto Sans KR', sans-serif; padding-top: 17px; font-size: 15px">&nbsp;???????????? ?????? ?????? ?????? ???????????? ???????????????!</span>
			</div>
			<p></p>
			<div class="row">
			<c:forEach items="${recipeLike}" var="r" end="5">
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="categories__item set-bg"
							data-setbg="${r.recipeImageSm }"
							style="background-image: url();"
							onmouseover="this.style.cursor='pointer';"
							>
							<div class="categories__hover__text"
								style="text-align: center; opacity: 0.8;"
								onmouseover="this.style.cursor='pointer';"
								onclick='DefAction("${r.recipeSeq}")'>
								<h5>${r.recipeName }</h5>
								<h6>"${r.userAlias }"</h6>
								<p>????????? ${r.recipeHit}???</p>
								<p>????????? ??? ${r.recipeLike}</p>
								<p>${r.recipeDate}</p>
								<input type="hidden" id="recipeSeq" name="recipeSeq"/>
								
							</div>
						</div>
				</div>

		</c:forEach>


			</div>
		</div>
	</section>
	</form>
	<!-- Categories Section End -->
</body>

<script>


		/* 1. ???????????? ?????? ????????? ????????? ?????? */
		function DefAction(n) {
			if ('${userId}' != '') {
				const recipeNum = document.getElementById('recipeSeq');
				recipeNum.value = n;
				recipeForm.action = "recipeView.do";
				recipeForm.submit();
			} else {
				var check = confirm('???????????? ????????? ??????????????????.\n' + '????????? ???????????????????');
				if (check == true) {
					location.href = "userLoginForm.do";
				} else {
					
				return false;
				}
			}

		};
	</script>

<script type="text/javascript">
	/* ????????? ????????? */
	if ('${message}' != '') {
		alert('${message}');
		window.location = "home.do";
	}

	
	
	
	if ('${recipeComments}' != '') {
		alert('${recipeComments}');
		if ('${recipe.recipeSeq}' != '') {
			window.location = "recipeView.do?recipeSeq="
					+ '${recipe.recipeSeq}';
		}
	}

	if ('${noticeComments}' != '') {
		alert('${noticeComments}');
		if ('${nt.noticeNo}' != '') {
			window.location = "noticeView.do?noticeNo=" + '${nt.noticeNo}';
		}
	}

	if ('${inquiryComments}' != '') {
		alert('${inquiryComments}');
		if ('${iq.inquiryNo}' != '') {
			window.location = "inquiryView.do?inquiryNo=" + '${iq.inquiryNo}';
		}
	}

	if ('${borderComments}' != '') {
		alert('${borderComments}');
		if ('${border.borderId}' != '') {
			window.location = "borderView.do?borderId=" + '${border.borderId}';
		}
	}
	
	
	if ('${loginComments}' != '') {
		alert('${loginComments}');
		window.location = "userLoginForm.do";
	}
</script>
</html>