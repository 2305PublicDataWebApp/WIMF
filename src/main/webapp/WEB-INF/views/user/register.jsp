<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		
		<!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="/vendor/aos/aos.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="/css/common/reset.css" rel="stylesheet">
        <link href="/css/user/register.css" rel="stylesheet">
        
        
        
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		
		<main id="container">
            <div class="regi-div">
                <div id="top-section">
                    <div class="main-logo-div">
                        <a href="index.html#hero" class="main-logo">
                            <h1>WIMF</h1>
                            <span style="color: var(--primary-color); font-size: 24px; font-weight: 600;">.</span>
                        </a>
                    </div>
                </div>
                <div id="nav-section">
                    <div class="card-body">
                        <div id="step1" class="active">
                            <h4 class="step-title">Step 1<br>약관 동의</h4>
                        </div>
    
                        <div id="step2">
                            <h4 class="step-title">Step 2<br>개인정보 입력</h4>
                        </div>
    
                        <div id="step3">
                            <h4 class="step-title">Step 3<br>회원가입 완료</h4>
                        </div>
                    </div>
                    <hr>
                </div>
                <div id="mid-section">
                    <div class="main-container1">
                        <div id="all-check-box">
                            <input type="checkbox" id="check-all">
                            <label for="check-all">
                                <span>약관 전체 동의</span>
                            </label>
                        </div>
                        <div id="terms-box">
                            <div class="check-box">
                                <div class="c-box">
                                    <input type="checkbox" id="check1" class="check-button" required>
                                    <label for="check1">
                                        <p>이용약관 동의<b class="check-button-b"> (필수)</b></p>
                                    </label>
                                </div>
                                <textarea readonly>여러분을 환영합니다.
WIMF 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 WIMF 서비스의 이용과 관련하여 WIMF 서비스를 제공하는 WIMF 주식회사(이하 ‘WIMF’)와 이를 이용하는 WIMF 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 WIMF 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                                </textarea>
                                <br>
                            </div>

                            <div class="check-box">
                                <div class="c-box">
                                    <input type="checkbox" id="check2" class="check-button">
                                    <label for="check2">
                                        <p>개인정보 수집 및 이용 동의<b class="check-button-b"> (필수)</b></p>
                                    </label>
                                </div>
                                <textarea readonly>여러분을 환영합니다.
WIMF 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 WIMF 서비스의 이용과 관련하여 WIMF 서비스를 제공하는 WIMF 주식회사(이하 ‘WIMF’)와 이를 이용하는 WIMF 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 WIMF 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                                </textarea>
                            </div>
                            <div class="check-box">
                                <div class="c-box">
                                    <input type="checkbox" id="check3" class="check-button" required>
                                    <label for="check3">
                                        <p>위치 기반 서비스 이용 약관 동의<b class="check-button-b"> (필수)</b></p>
                                    </label>
                                </div>
                                <textarea readonly>여러분을 환영합니다.
WIMF 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 WIMF 서비스의 이용과 관련하여 WIMF 서비스를 제공하는 WIMF 주식회사(이하 ‘WIMF’)와 이를 이용하는 WIMF 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 WIMF 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                                </textarea>
                            </div>
                            <div class="check-box">
                                <div class="c-box">
                                    <input type="checkbox" id="check4" class="check-button">
                                    <label for="check4">
                                        <p>이벤트 및 프로모션 혜택 수신 동의(선택)</p>
                                    </label>
                                </div>
                                <textarea readonly>여러분을 환영합니다.
WIMF 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 WIMF 서비스의 이용과 관련하여 WIMF 서비스를 제공하는 WIMF 주식회사(이하 ‘WIMF’)와 이를 이용하는 WIMF 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 WIMF 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                                </textarea>
                            </div>
                        </div>
                        <div class="btn-box">
                            <a id="next-btn1" class="next-btn" style="color:#ffffff;" onclick="showStep(2)">다음</a>
                        </div>
                    </div>

                    <div class="main-container2" style="display: none;">
                        <div class="register-box">
                            <form id="register-form" enctype="multipart/form-data" >
                            	
					            <div id="img-div">
					                <div class="profile-image-container">
					                    <img src="/img/user/default-profile.png" id="profile-image-preview" alt="프로필 이미지">
					                    <input type="file" id="profile-image" name="uploadFile" accept="image/*">
					                    <label for="profile-image" class="upload-icon"><img src="/img/user/camera.png" id="camera" class="upload-icon" alt=""></label>
					                </div>
					                <div class="profile-label">프로필 사진 선택</div>
					            </div>

                                <div id="user-info-id" class="user-info-box">
                                    <label for="user-id">
	                                    아이디
	                                    <span id="id-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="text" id="user-id" name="userId" class="input-user-info" placeholder="아이디 입력(6~14자)" required>
                                    <input type="hidden" id="user-ck-id">
                                </div>
                                
                                <div id="user-info-pw" class="user-info-box">
                                    <label for="user-pw">
                                    	비밀번호
                                    	<span id="pw-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="password" id="user-pw" name="userPw" class="input-user-info" placeholder="소문자,숫자,특수문자 포함 10~20자" required>
                                    <input type="hidden" id="user-ck-pw">
                                </div>

                                <div id="user-info-pwck" class="user-info-box">
                                    <label for="user-pw-check">
                                    	비밀번호 확인
                                    	<span id="pw-ck-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="password" id="user-pw-check" name="userPwCheck" class="input-user-info" placeholder="비밀번호를 한 번 더 입력해주세요." required>
                                    <input type="hidden" id="check-pw">
                                </div>

                                <div id="user-info-name" class="user-info-box">
                                    <label for="user-name">이름</label>
                                    <input type="text" id="user-name" name="userName" class="input-user-info" placeholder="이름을 입력해주세요." required>
                                </div>

                                <div id="user-info-nickname" class="user-info-box">
                                    <label for="user-nickname">
                                    	닉네임
                                    	<span id="nick-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="text" id="user-nickname" name="userNickname" class="input-user-info" placeholder="사용할 닉네임을 입력해주세요." required>
                                	<input type="hidden" id="user-ck-nickname">
                                </div>

                                <div id="user-info-ssn" class="user-info-box">
                                    <label for="user-ssn">
                                    	주민번호
                                    	<span id="ssn-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="text" id="user-ssn" name="userSSN" class="input-user-info" maxlength="7" placeholder="-를 뺀 뒷자리 첫번째까지 입력해주세요." required>
                                </div>

                                <div id="user-info-address" class="user-info-box">
                                    <label for="user-address">주소</label>
                                    <input type="text" id="user-address" name="userAddress" class="input-user-info" placeholder="주소 찾기 버튼을 눌러 입력해주세요." required readonly>
                                    <input type="button" id="post-btn" onclick="sample4_execDaumPostcode();" value="주소 찾기">
                                </div>
                                
                                <div id="user-info-deatil-address" class="user-info-box">
                                    <label for="user-detail-address">상세주소 입력</label>
                                    <input type="text" id="user-detail-address" name="userDetailAddress" class="input-user-info" placeholder="상세주소 입력" required>
                                </div>

                                <div id="user-info-phone" class="user-info-box">
                                    <label for="user-phone">전화번호</label>
                                    <input type="text" id="user-phone" name="userPhone" class="input-user-info" placeholder="휴대폰 번호 입력('-' 제외 11자리)" required>
                                </div>

                                <div id="user-info-email" class="user-info-box">
                                    <label for="user-email">
                                    	이메일
                                    	<span id="email-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="text" id="user-email" name="userEmail" class="input-user-info" placeholder="이메일을 입력해주세요." required>
                                    <input type="hidden" id="user-ck-email">
                                    
                                </div>

                                <div id="user-info-email-check" class="user-info-box">
                                    <label for="user-email-check">
                                    	인증번호
                                    	<span id="email-ck-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="text" id="user-email-check" maxlength="6" name="userEmailCheck" class="input-user-info" placeholder="인증번호 6자리를 입력해주세요." required>
                                    <input type="hidden" id="check-certification-num">
                                	<input type="text" id="send-certification-num" style="display:none;">
                                	<input type="button" id="certification-btn" value="인증번호 전송">
                                	<input type="button" id="check-certification-num-btn" onclick="confirmNumber();" value="확인">
                                </div>

	                            <div id="main-con-btn-box" class="btn-box">
	                                <input type="button" id="prev-btn1" class="next-btn" value="이전">
	                                <input type="button" id="next-btn2" class="next-btn" value="확인">
	                            </div>

                            </form>
<!--                                 <a id="prev-btn1" class="next-btn" style="color:#ffffff;" onclick="showStep(1)">이전</a> -->
<!--                                 <a id="next-btn2" class="next-btn" style="color:#ffffff;" onclick="showStep(3)">다음</a> -->
                        </div>
                    </div>

                    <div class="main-container3" style="display: none;">
                        <div class="signup-complete-box">
                            <div class="congrats-img-box">
                                <img src="/img/user/congratulation.png" alt="축하이미지" class="congrats-img">
                            </div>

                            <div class="signup-content-box">
                                <p id="p1">회원가입이 <b>완료</b> 되었습니다!</p>
                                <p id="p2"><b id="bTag"></b>님의 회원가입을 축하합니다.</p>
                            </div>
                            <hr>
                            <div class="signup-btn-box">
                                <a href="/" id="move-home-btn" class="btn1">홈으로</a>
                                <a href="/user/login.dog" id="move-login-btn" class="btn1" style="color: #ffffff;">로그인</a>
                            </div>
                        </div>
<!--                         <div id="btn-box"> -->
<!--                             <a id="prev-btn2" class="next-btn" style="color:#ffffff;" onclick="showStep(2)">이전</a> -->
<!--                             <a id="next-btn3" class="next-btn" style="color:#ffffff;" onclick="showStep(3)">다음</a> -->
<!--                         </div> -->
                    </div>
                </div>

                <div id="bottom-section">

                </div>
            </div>
        </main>
		
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		
		<!-- 부트스트랩 JS 및 jQuery 스크립트 -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- 다음 주소 API -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <script>
        	
	        
	     	// 이미지 업로드 및 미리보기 관련 JavaScript
	        const profileImageInput = document.getElementById('profile-image');
	        const profileImagePreview = document.getElementById('profile-image-preview');
	        const defaultProfileImage = 'default-profile.png';
	
	        profileImageInput.addEventListener('change', (e) => {
	            const file = e.target.files[0];
	
	            if (file) {
	                const reader = new FileReader();
	                reader.onload = (e) => {
	                    profileImagePreview.src = e.target.result;
	                };
	
	                reader.readAsDataURL(file);
	            } else {
	                // 이미지가 선택되지 않았을 때 디폴트 이미지로 변경
	                profileImagePreview.src = defaultProfileImage;
	            }
	        });
	        
	        
	     	// 이메일 인증 ajax
	     	$(document).ready(function() {
				$("#certification-btn").on("click",function(){
					var emailVal = $("#user-email").val();
					if(emailVal == null || emailVal == ""){
						alert("이메일을 먼저 입력해주세요.");
					}
					if($("#user-ck-email").val() === "false"){
						alert("사용할 수 없는 이메일입니다.")
					} else {
						alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");
						
						$.ajax({
							url : "/user/sendMail.dog",
							type : "POST",
							data : { mail : $("#user-email").val() },
							success : function(data) {
								$("#send-certification-num").attr("value", data);
							},
							error : function() {
								alert:("ajax 오류, 관리자에게 문의 바랍니다.");
							}
						});
					}
				});
			});
	     	
	     	function confirmNumber(){
	     		var num1 = $("#user-email-check").val();
	     		var num2 = $("#send-certification-num").val();
	     		if(num1 == num2) {
	     			alert("인증이 완료되었습니다.");
	     			$("#check-certification-num").attr("value", "true");
	     			$("#user-email-check").attr("readonly", "true");
	     			$("#email-ck-msg").text("인증 완료").removeClass("error").addClass("success").show();
	     		} else {
	     			alert("작성한 인증번호가 다릅니다.");
	     			$("#check-certification-num").attr("value", "false");
	     			$("#email-ck-msg").text("인증 실패").removeClass("success").addClass("error").show();
	     		}
	     	}
	     	
	        // 회원가입 ajax
	        $(document).ready(function() {
	        	$("#next-btn2").on("click", function(event) {
	        		
	        		event.preventDefault();
	        		
	            	var userIdVal = $("#user-id").val();
	            	var userPwVal = $("#user-pw").val();
	            	var userNameVal = $("#user-name").val();
	            	var userNicknameVal = $("#user-nickname").val();
	            	var userSSNVal = $("#user-ssn").val();
	            	var userAddressVal = $("#user-address").val();
	            	var userDetailAddressVal = $("#user-detail-address").val();
	            	var userPhoneVal = $("#user-phone").val();
	            	var userEmailVal = $("#user-email").val();
	            	
	            	
					
					var formData = new FormData();
					var fileInput = document.getElementById("profile-image");
					var file = fileInput.files[0];
	                formData.append("uploadFile", file);
	                formData.append("userId", userIdVal);
	                formData.append("userPw", userPwVal);
	                formData.append("userName", userNameVal);
	                formData.append("userNickname", userNicknameVal);
	                formData.append("userSSN", userSSNVal);
	                formData.append("userAddress", userAddressVal);
	                formData.append("userDetailAddress", userDetailAddressVal);
	                formData.append("userPhone", userPhoneVal);
	                formData.append("userEmail", userEmailVal);

	        		// 전부 작성 했는지 확인
	        		if(
	       				userIdVal != null
	       				&& userPwVal != null
	       				&& userNameVal != null
	       				&& userNicknameVal != null
	       				&& userSSNVal != null
	       				&& userAddressVal != null
	       				&& userDetailAddressVal != null
	       				&& userPhoneVal != null
	       				&& userEmailVal != null
	       			) {
	        			if(
	        				$("#user-ck-id").val() === "true"
        					&& $("#user-ck-pw").val() === "true"
        					&& $("#check-pw").val() === "true"
        					&& $("#user-ck-nickname").val() === "true"
        					&& $("#user-ck-email").val() === "true"
	        			) {
	        				$.ajax({
		        				url : "/user/register.dog",
		        				type : "POST",
		        				data : formData,
		        				processData: false,
		        	            contentType: false,
		        				success : function(data) {
		        					if(data == "true"){
		        	                    $("#step1, #step2, #step3").removeClass("active");
		        	                    $("#step3").addClass("active");
		        						
		        						$(".main-container2").hide();
		        		                $(".main-container3").show();
		        						$("#bTag").text(userNameVal);
		        					} else if(data == "false"){
		        						alert("회원가입에 실패하였습니다.");
		        					} else {
		        						alert("회원가입이 완료되지 않았습니다.");
		        					}
		        				},
		        				error : function(){
		        					alert("Ajax 오류, 관리자에게 문의바랍니다.");
		        				}
		        			});
	        			} else {
	        				alert("사용할 수 없는 아이디 또는 비밀번호, 닉네임, 이메일이 있습니다. 다시 확인해주세요.");
	        			}
	        		}
	        	});
	        });
        
        	// 아이디 중복체크 ajax
        	$(document).ready(function() {
        		var userIdTag = $("#user-id");
        		userIdTag.on("change", function() {
	        		var userId = userIdTag.val();
	        		$.ajax({
	        			url : "/user/checkDuplUserId.dog",
	        			type : "POST",
	        			data :{ userId : userId },
	        			success : function(data) {
	        				var msg = "";
	        				var idMsg = $("#id-msg");
	        				if(data == "true") {
	        					idMsg.removeClass("success").addClass("error");
	        					$("#user-ck-id").attr("value","false");
	        					msg = "이미 사용중인 아이디 입니다.";
	        					
	        				} else if(data == "false1") {
	        					idMsg.removeClass("success").addClass("error");
	        					$("#user-ck-id").attr("value","false");
	        					msg = "소문자와 숫자를 포함한 6 ~ 14자리만 가능합니다.";
	        					
	        				} else if(data == "false2") {
	        					idMsg.removeClass("error").addClass("success");
	        					$("#user-ck-id").attr("value","true");
		        				msg = "사용 가능한 아이디 입니다.";
		        				
	        				} else {
		        				alert("오류");
	        				}
	        				
	        				idMsg.text(msg).show();
	        			},
	        			error : function() {
	        				alert("Ajax 오류, 관리자에게 문의바랍니다.");
	        			}
	        		})
	        	});
        	});
        	
        	// 닉네임 중복체크 ajax
        	$(document).ready(function() {
        		var userNicknameTag = $("#user-nickname");
        		userNicknameTag.on("change", function() {
        			var userNickname = userNicknameTag.val();
        			
        			$.ajax({
        				url : "/user/checkDuplUserNickname.dog",
        				type : "POST",
        				data : { userNickname : userNickname },
        				success : function(data) {
        					var msg = "";
	        				var nickMsg = $("#nick-msg");
	        				
	        				if(data == "true") {
	        					nickMsg.removeClass("success").addClass("error");
	        					$("#user-ck-nickname").attr("value","false");
	        					msg = "이미 사용중인 닉네임 입니다.";
	        					
	        				} else if(data == "false1") {
	        					nickMsg.removeClass("success").addClass("error");
	        					$("#user-ck-nickname").attr("value","false");
	        					msg = "한글이나 영어, 2자 ~ 15자만 가능합니다.";
	        					
	        				} else if(data == "false2") {
	        					nickMsg.removeClass("error").addClass("success");
	        					$("#user-ck-nickname").attr("value","true");
		        				msg = "사용 가능한 닉네임 입니다.";
		        				
	        				} else {
		        				alert("오류");
	        				}
	        				
	        				nickMsg.text(msg).show();
        				},
        				error : function() {
        					alert("Ajax 오류, 관리자에게 문의바랍니다.");
        				}
        			});
        		});
        	});
        	
        	// 이메일 중복체크 ajax
        	$(document).ready(function() {
        		var userEmailTag = $("#user-email");
        		userEmailTag.on("change", function() {
        			var userEmail = userEmailTag.val();
        			
        			$.ajax({
        				url : "/user/checkDuplUserEmail.dog",
        				type : "POST",
        				data : { userEmail : userEmail },
        				success : function(data) {
        					var msg = "";
	        				var emailMsg = $("#email-msg");
	        				
	        				if(data == "true") {
	        					emailMsg.removeClass("success").addClass("error");
	        					$("#user-ck-email").attr("value","false");
	        					msg = "이미 사용중인 이메일 입니다.";
	        					
	        				} else if(data == "false1") {
	        					emailMsg.removeClass("success").addClass("error");
	        					$("#user-ck-email").attr("value","false");
	        					msg = "이메일 형식만 가능합니다.";
	        					
	        				} else if(data == "false2") {
	        					emailMsg.removeClass("error").addClass("success");
	        					$("#user-ck-email").attr("value","true");
		        				msg = "사용 가능한 이메일 입니다.";
		        				
	        				} else {
		        				alert("오류");
	        				}
	        				
	        				emailMsg.text(msg).show();
        				},
        				error : function() {
        					alert("Ajax 오류, 관리자에게 문의바랍니다.");
        				}
        			});
        		});
        	});
        	
        	// 비밀번호 유효성 체크 정규식 함수
			function validPw(pw) {
			    // 비밀번호 10 ~ 20자
			    if (pw.length < 10 || pw.length > 20) {
			        return "10자 이상, 20자 이하로 작성해야 합니다.";
			    }
			    
			    // 소문자 하나 이상 포함
			    var lowercase = /[a-z]/;
			    // 숫자 하나 이상 포함
			    var number = /\d/;
			    // 특수문자 하나 이상 포함
			    var special = /[!@#\$%\^&\*\(\)_\+\-=\[\]\{\};':"\\|,.<>\/?]/;
				
			    // 비교
			    if (!lowercase.test(pw) || !number.test(pw) || !special.test(pw)) {
			        return "소문자/숫자/특수문자를 1개이상 포함 해야 합니다.";
			    }
			    
			    // 유효한 비밀번호
			    return "";
			}
        	
        	// 비밀번호 유효성 체크
			$(document).ready(function() {
			    var pwTag = $("#user-pw");
			    var pwMsg = $("#pw-msg");
			
			    pwTag.on("change", function() {
			        var pw = pwTag.val();
			        var msg = validPw(pw);
			
			        if (msg) {
			            // 사용 불가
       					$("#user-ck-pw").attr("value","false");
			            pwMsg.text(msg).removeClass("success").addClass("error").show();
			        } else {
			            // 사용 가능
       					$("#user-ck-pw").attr("value","true");
			            pwMsg.text("사용 가능한 비밀번호 입니다.").removeClass("error").addClass("success").show();
			        }
			    });
			});
        	
        	// 비밀번호 확인 유효성 체크
        	$(document).ready(function() {
        		var pwCkMsg = $("#pw-ck-msg");
        		
        		$("#user-pw-check").on("change", function() {
        			var pwTagVal = $("#user-pw").val();
        			var pwCkTagVal = $("#user-pw-check").val();
        			var msg = "";
        			
        			if(pwTagVal != pwCkTagVal) {
       					$("#check-pw").attr("value","false");
        				msg = "입력한 비밀번호와 다릅니다.";
        				pwCkMsg.removeClass("success").addClass("error");
        			} else {
       					$("#check-pw").attr("value","true");
        				msg = "입력한 비밀번호와 일치합니다.";
        				pwCkMsg.removeClass("error").addClass("success");
        			}
        			pwCkMsg.text(msg).show();
        		});
        	});
        	

        	
	        // 주소 api
			function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function (data) {
		                const fullAddress = data.address; // 선택한 주소
		                document.querySelector("#user-address").value = fullAddress; // 주소 입력란에 주소 설정
		            },
		        }).open();
		    }
	        
            const check1 = document.querySelector("#check1");
            const check2 = document.querySelector("#check2");
            const check3 = document.querySelector("#check3");
            function showStep(stepNumber) {
                if (check1.checked && check2.checked && check3.checked) {
                    // 모든 단계 비활성화
                    $("#step1, #step2, #step3").removeClass("active");
                    
                    // 클릭된 단계 활성화
                    $("#step" + stepNumber).addClass("active");
                    $(".main-container1").hide();
                    $(".main-container2").show();
                } else{
                    alert("필수 체크박스를 전부 체크해주세요.");
                }
            }


            // 이전 단계로 이동 (Step 1 <- Step 2)
            $("#prev-btn1").click(function() {
                $(".main-container2").hide();
                $(".main-container1").show();
            });


            // 전체 동의 체크박스 처리
            $("#check-all").change(function() {
                $(".check-button").prop('checked', $(this).prop("checked"));
            });

            // 전체 동의 체크 이후 하나 체크 해제 시 전체 동의 체크 박스도 해제
            $(".check-button").change(function() {
                $("#check-all").prop('checked', false);
            });
            
            

        </script>
	</body>
</html>