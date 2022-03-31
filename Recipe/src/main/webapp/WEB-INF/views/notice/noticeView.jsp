<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type=date]:focus {
	outline: none;
}
</style>
</head>
<body>
	<section class="single-post spad" style="padding-top: 180px;">
		<form id="ntView" name="ntView" method="post">
			<input type="hidden" name="comSeq" value="${nt.noticeNo}" /> 
			<input type="hidden" name="noticeNo" value="${nt.noticeNo}" /> 

			<div class="container">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12">
						<div>
							<div>
								<table class="table table-hover">
									<tr>
										<th width="100">작성자</th>
										<td width="150">${nt.userAlias }</td>

										<th width="100">작성일자</th>
										<td width="150">${nt.noticeDate }</td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">${nt.noticeTitle }</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3"><pre style="height: 150px;">
							${nt.noticeContent }
							${nt.ntImage1 }
							${nt.ntImage2 }
							${nt.ntImage3 }
						</pre></td>
									</tr>
								</table>
							</div>
							<br>
							<div align="center">
								<button type="button" onclick="location.href='noticeList.do'">목록가기</button>
								&nbsp;&nbsp;
								<c:if test="${nt.userAlias == userAlias }">
									<button type="button" onclick="noticeUpdate(${nt.noticeNo})">수정</button>
			&nbsp;&nbsp;
			<button type="button" onclick="noticeDelete(${nt.noticeNo})">삭제</button>
			&nbsp;&nbsp;
			</c:if>
							</div>
						</div>

						<!-- 댓글창 -->

						<div class="single-post__comment">
							<div class="widget__title">
								<h4>Comment</h4>
							</div>
							<c:forEach items="${comments}" var="c">
								<c:if test="${c.comSeq eq nt.noticeNo}">
									<c:if test="${c.comCategory == '2' }">


										<div class="single-post__comment__item">

											<div class="single-post__comment__item__text">

												<h5>${c.comAlias}<input type="hidden" id="comNo"
														name="comNo" value="${c.comNo }" />
												</h5>

												<span> <input type="date" id="updateDate"
													name="updateDate" value="${c.comDate }"
													style="border: none;" readonly>
												</span>

												<!-- 기존 내용 -->
												<pre
													style="height: 50px; width: 500px; font-family: 'Noto Sans KR', sans-serif;"
													id="beforeContents${c.comNo }">${c.comContents}
										</pre>

												<!-- 수정 버튼 클릭시 수정 text area 생성 -->
												<textarea style="height: 50px; width: 500px; display: none;"
													id="afterContents${c.comNo }" name="afterValue"></textarea>

												<c:if test="${userAlias eq c.comAlias }">
													<ul>
														<li>
															<button type="button" onclick="updateButton(${c.comNo })"
																id="updateBtn${c.comNo }" name="updateBtn"
																style="border: 0px; cursor: pointer;">수정</button>

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


							<!-- 댓글 등록 -->

							<div class="single-post__recipe__details">
								<div class="single-post__recipe__details__option"
									style="padding-left: 28px;">
									<ul>
										<li>
											<h5>
												<i class="fa fa-user-o" style="margin-right: 22px;">${userAlias }</i>
											</h5>
										</li>
										<li>
											<h5>
												<i class="fa fa-clock-o"></i> 등록일자
											</h5> <span><input type="date" id="currentDate"
												name="comDate" readonly="readonly"
												style="border: none; background: none;"></span>
										</li>
										<li>
											<button type="button" onclick="insertComments()"
												style="border: 0px; cursor: pointer; margin-left: 44em;"
												class="site-btn">등록</button> <input type="hidden"
											id="comCategory" name="comCategory" value="2">
										</li>
									</ul>
									<div align="center" style="padding-top: 14px;">
										<textarea id="comments" name="comContents"
											style="width: 100%; border: -3px; border-color: antiquewhite;"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>



	<script type="text/javascript">
	function noticeDelete(n){
		ntView.noticeNo.value = n;
		ntView.action = "noticeDelete.do";
		ntView.submit();
	}
	
	function noticeUpdate(n){
		ntView.noticeNo.value = n;
		ntView.action = "noticeUpdateForm.do";
		ntView.submit();
	}
	
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
				ntView.action = "insertComments.do";
				ntView.submit();
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
        after.innerHTML = before.innerHTML;
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
           	 
           		 
            	ntView.action = "updateComments.do";
            	ntView.submit();
                
           	 
            }

        } else {
            alert('수정 내용을 입력해주세요.');
        }

    }
    /* 댓글 삭제 처리 */
    function deleteDo(n){
   	 let check = confirm('해당 댓글을 삭제하면 복구가 불가능합니다.\n' + "그래도 삭제하시겠습니까?");
   	 if(check == true){
   		ntView.action = "deleteComments.do?comNo=" + n;
   		ntView.submit();
   	 }
    }
	
	
	
	/* 현재 시간 */
	document.getElementById('currentDate').value = new Date().toISOString()
			.substring(0, 10);
	;
	
	
</script>
</body>
</html>