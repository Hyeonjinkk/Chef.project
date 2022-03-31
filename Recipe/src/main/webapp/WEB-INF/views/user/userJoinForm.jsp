<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
</head>
<body>

<div class="container">
    <div class="row"  style="
    height: 10px;
">
      <div class="col-xs-12"></div>
    </div>


    <div class="row">
      <div class="col-lg-3"></div>
      <div class="col-lg-6">
        <!-- Sign In Section Begin -->
        <div class="">
          <div class="signin__warp">
            <div class="signin__content">

              <div class="signin__form">
                <ul class="nav" role="">

                  <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#tabs-2" role="tab" aria-selected="true" style="font-family: 'Do Hyeon', sans-serif;width: 640px;font-size: 30px;">회원가입</a>
                  </li>

                </ul>
                <div class="tab-content">
                  <a href="./home.do"><img style="width: 250px;height: 190px;padding-top: 20px;" src="data:image/png;base64,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"></a>


        
                  <div class="tab-pane active" id="tabs-2" role="tabpanel">



                       
                    <div class="signin__form__text">



                      <form action="userJoin.do" method="post">
                      <!-- 회원가입 폼 -->
                      <font size="2" id="checkValue" name="checkValue"></font>
                       <input type="email" id="userId" name="userId" required="required" placeholder="이메일 주소를 입력해주세요"> 
                        <input type="password" id="userPassword" placeholder="사용할 비밀번호를 입력해주세요." name="userPassword" required="required">

                        <input type="password" id="userPassword1" placeholder="입력한 비밀번호와 일치한 암호를 입력해주세요." name="userPassword1" required="required">
                        
                        <input type="text" id="userName" name="userName" placeholder="가입자 성명을 기입해주세요." required="required">
                        
                       <input type="text" placeholder="사용할 닉네임을 입력해주세요." id="userAlias" name="userAlias">
                       
                       <input type="text" id="userTel" name="userTel" placeholder="전화번호를 입력해주세요">
                       
                       <input type="text" id="userAddress" placeholder="가입자의 거주 주소를 입력해주세요." name="userAddress">
                       
                       <input type="text" id="addressDetail" name="addressDetail" placeholder="상세주소를 입력해주세요">
                        
                        <button type="submit" class="site-btn">회원가입</button>
                        <button type="button" class="site-btn" onclick="location.href='home.do'">뒤로가기</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="col-lg-3"></div>
    </div>
    <div class="row">
      <div class="col-xs-12"></div>
    </div>
  </div>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		document
				.getElementById("userAddress")
				.addEventListener(
						"click",
						function() { //주소입력칸을 클릭하면
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) { //선택시 입력값 세팅
											document
													.getElementById("userAddress").value = data.address; // 주소 넣기
											document
													.querySelector(
															"input[name=addressDetail]")
													.focus(); //상세입력 포커싱
										}
									}).open();
						});
	}
</script>

	<script type="text/javascript">
	document.getElementById('userId').addEventListener('focusout', isIdCheck);
	const checkValue = document.getElementById('checkValue');
	
		function isIdCheck() {
			$.ajax({
				url : "ajaxUserIdCheck.do",
				type : "post",
				data : {"str" : $("#userId").val()},
				dataType : "text",
			
				
				success : function(result) {
					if(result == '1') {
						/* alert("사용 가능한 아이디입니다."); */
						checkValue.innerHTML =	"사용 가능한 아이디입니다."; 
						$("#checkId").val('Yes');
						$("#checkId").attr("disabled", "disabled");
						$("#userPassword").focus();
					} else {
						/* alert("이미 사용 중인 아이디입니다."); */
						checkValue.innerHTML =	"이미 사용 중인 아이디입니다.";
						$("#userId").val('');
						$("#userId").focus();
					};
				}
				
			});
		}
	
		function formCheck() {
			
			if($("#checkId").val() != 'Yes') {
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if($("#userPassword").val() != $("#userPassword1").val()) {
				alert("패스워드가 일치하지 않습니다.");
				$("#userPassword").val('');
				$("#userPassword1").val('');
				$("#userPassword").focus();
				return false;
			}
			
			return true;
		}

	</script>
</body>
</html>