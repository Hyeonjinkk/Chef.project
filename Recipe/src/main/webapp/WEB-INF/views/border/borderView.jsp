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
	<div align="center">
		<div>
			<h1>게시글 상세보기</h1>
		</div>
		<div>
			<form id="frr" name="frr"  method="post">
				<div>
					<table border="1">
						<tr>
							<th width="100">작성자</th>
							<td width="150"><input type="text" name="borderWriter" value="${border.borderWriter}" ></td>
							<th width="100">작성일자</th>
							<th width="150"><input type="date" name="borderDate" required="required" value="${border.borderDate}"></th>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="borderTitle" required="required" value="${border.borderTitle}"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea rows="15" cols="50" name="borderContents" required="required">${border.borderContents }</textarea></td>
						</tr>
					</table>
				</div>
				<br>
				<div>
					<button type="button" onclick="location.href='borderList.do'">목록가기</button>
					&nbsp;&nbsp;
					<button type="submit"  onclick="borderUpdate(${border.borderId})">수정완료</button>
					&nbsp;&nbsp;
					<button type="button" onclick="borderDelete(${border.borderId})">삭제</button>
					
					<c:if test="${user_no == 1}">
					<button type="submit"  onclick="borderUpdate(${border.borderId})">수정완료</button>
					&nbsp;&nbsp;
					<button type="button" onclick="borderDelete(${border.borderId})">삭제</button>
					</c:if>
					<input type="hidden" id="borderId" name="borderId">

				</div>
						<!-- 댓글창 -->

	<div align="center">
		<table id="tbl">
			<c:forEach items="${comments}" var="c">
				<c:if test="${c.comSeq eq border.borderId}">
					<c:if test="${c.comCategory == '4' }">

					
                    <tr>
                        
                        <td width="150px">${c.comAlias}<input type="hidden" id="comNo" name="comNo" value="${c.comNo }" /></td>
                        <td><input type="date" id="updateDate" name="updateDate" value="${c.comDate }" style="border:none;" readonly ></td>

                    </tr>
                    <tr id="asd">
                        <td colspan="4">
                                <!-- 기존 내용 -->
                                <pre style="height: 50px; width: 500px;" id="beforeContents${c.comNo }">${c.comContents}</pre>
                                <!-- 수정 버튼 클릭시 수정 text area 생성 -->
                                <textarea style="height: 50px; width: 500px; display: none;" id="afterContents${c.comNo }" name="afterValue">
                                </textarea></td>

                        <td><c:if test="${userAlias eq c.comAlias }">
                                <!-- 수정버튼 -->
                                <button type="button" onclick="updateButton(${c.comNo })" id="updateBtn${c.comNo }" name="updateBtn" style="border: 0px; cursor: pointer;">수정</button>
                                <br>
                                <!-- 수정 버튼 클릭시 생성 -->
                                <button type="button" onclick="cancelButton(${c.comNo })" id="cancel${c.comNo }" name="cancel" style="display: none; border: 0px; cursor: pointer;">취소</button>
                                <!-- 삭제 버튼 -->
                                <button type="button" onclick="deleteDo(${c.comNo })" id="deleteBtn${c.comNo }" name="deleteBtn" style="border: 0px; cursor: pointer;">삭제</button>
                            </c:if></td>

                    </tr>
					</c:if>
				</c:if>
			</c:forEach>

		</table>
	</div>


	<!-- 댓글 등록 -->

	<div align="center">
		<table id="tbl">
			<tr>
				<td width="150px">작성자</td>
				<td><b>${userAlias}</b></td>
				<td><input type='date' id='currentDate' name="comDate" readOnly style="border:none;"
					 /> <input type="hidden" name="comCategory"
					value="4" /> <input type="hidden" name="comSeq"
					value="${border.borderId}" /></td>
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
		</div>
</div>
		<script type="text/javascript">
			function borderDelete(a) {
				frr.borderId.value = a;
				frr.action = "borderDelete.do";
				frr.submit();
			}
			function borderUpdate(a) {
				frr.borderId.value = a;
				frr.action = "borderUpdate.do";
				
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
						frr.action = "insertComments.do";
						frr.submit();
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
			        	 
			        		 
			        	 frr.action = "updateComments.do";
			        	 frr.submit();
			             
			        	 
			         }

			     } else {
			         alert('수정 내용을 입력해주세요.');
			     }

			 }
			 /* 댓글 삭제 처리 */
			 function deleteDo(n){
				 let check = confirm('해당 댓글을 삭제하면 복구가 불가능합니다.\n' + "그래도 삭제하시겠습니까?");
				 if(check == true){
					 frr.action = "deleteComments.do?comNo=" + n;
					 frr.submit();
				 }
			 }
			 /* 현재 시간 */
				document.getElementById('currentDate').value = new Date().toISOString()
						.substring(0, 10);
				;

		</script>
</body>
</html>