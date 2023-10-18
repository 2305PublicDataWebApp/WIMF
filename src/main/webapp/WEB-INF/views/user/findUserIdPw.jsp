<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디/비밀번호 찾기</title>
		
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
        
        <!-- 페이지 css -->
		<link href="/css/user/findUserIdPw.css" rel="stylesheet">
		<link href="/css/common/reset.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		<main id="container">
            <div class="login-div">
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
                            <h4 class="step-title">Step 1<br>정보 입력</h4>
                        </div>
    
                        <div id="step2">
                            <h4 class="step-title">Step 2<br>본인 확인</h4>
                        </div>
    
                        <div id="step3">
                            <h4 class="step-title">Step 3<br>찾기 결과</h4>
                        </div>
                    </div>
                    <hr>
                </div>
                <div id="mid-section">
                    <div class="main-container1">
                    	<div class="change-id-pw-box">
                    	
                    		<div class="radio-id-box">
	                    		<input type="radio" id="radio-findId" name="findIdPw" value="find-id" checked>
								<label for="radio-findId">아이디 찾기</label>    	                			
                    		</div>
                    		
                    		<div class="radio-pw-box">
	                    		<input type="radio" id="radio-findPw" name="findIdPw" value="find-pw">
								<label for="radio-findPw">비밀번호 찾기</label>
                    		</div>
                    	</div>
                    	
                    	
                        <div id="find-id-form" class="find-user-info-box">
							<div class="input-user-info-box">
							    <label for="user-name">이름</label>
							    <input type="text" id="user-name" class="find-user-idpw-input" name="userName" placeholder="가입 시 입력 했던 본인 이름을 입력해주세요." required>
							</div>
							<div class="input-user-info-box">
							    <label for="user-email">이메일</label>
							    <input type="text" id="user-email" class="find-user-idpw-input" name="userEmail" placeholder="가입 시 입력 했던 본인 이메일을 입력해주세요." required>
							</div>
							
							<div id="id-msg" style="display=none;"></div>
							
							<div class="find-btn-box">
							    <input type="button" id="find-user-id-btn" class="find-btn" value="확인">
							</div>
                        </div>
                        
                        
                        <form action="" method="post" id="find-pw-form" class="find-user-info-box" style="display: none;">
	                        <div class="find-user-pw-box">
	                        
								<div class="input-user-info-box">
								    <label for="user-pw-name">이름</label>
								    <input type="text" id="user-pw-name" class="find-user-idpw-input" name="userName" placeholder="가입 시 입력 했던 본인 이름을 입력해주세요." required>
								</div>
								
								<div class="input-user-info-box">
								    <label for="user-id">아이디</label>
								    <input type="text" id="user-id" class="find-user-idpw-input" name="userId" placeholder="가입 시 입력 했던 본인 아이디를 입력해주세요." required>
								</div>
								
								<div class="input-user-info-box">
								    <label for="user-pw-email">이메일</label>
								    <input type="text" id="user-pw-email" class="find-user-idpw-input" name="userEmail" placeholder="가입 시 입력 했던 본인 이메일을 입력해주세요." required>
								</div>
								
								<div id="pw-msg" style="display=none;"></div>
								
                                <div class="find-btn-box">
                                    <input type="button" id="find-user-pw-btn" class="find-btn" value="확인">
                                </div>
                                
	                        </div>
                        </form>
                        
<!--                         <div id="btn-box"> -->
<!--                             <a id="next-btn1" class="next-btn" style="color:#ffffff;" onclick="showStep(2)">다음</a> -->
<!--                         </div> -->
                        
                    </div>

                    <div class="main-container2" style="display: none;">
                        <div class="identification-box">
                            <div class="check-certification-number-box">
                            	<div id="identify-email" class="identification">
                            		<p>받는 이메일 : <span id="request-email"></span></p>
                            	</div>
                            	<div id="certification-number-box" class="identification">
                            		<label for="certification-number">인증 번호</label>
                            		<div class="certification-box2">
	                            		<input type="text" id="certification-number" placeholder="인증번호 6자리를 입력해주세요.">
	                            		<input type="text" id="send-certification-number" style="display:none;">
	                            		<input type="text" id="isChecked" style="display:none;">
	                            		<input type="button" id="check-certification-num-btn" onclick="confirmNumber();" value="확인">
	                            		<button type="button" id="certification-btn">인증번호 전송</button>
                            		</div>
                            	</div>
                            </div>
                            <div id="btn-box">
                                <a id="prev-btn1" class="next-btn" style="color:#ffffff;" onclick="showStep(1)">이전</a>
                                <a id="next-btn2" class="next-btn" style="color:#ffffff;" onclick="nextStep()">다음</a>
                            </div>
                        </div>
                    </div>

                    <div class="main-container3" style="display: none;">
                        <div class="find-idpw-complete-box">
                            <div class="success-dog-img-box">
                                <img src="/img/user/success-dog.png" alt="성공강아지" class="success-dog-img">
                            </div>

                            <div class="find-idpw-content-box">
                                <p id="p1"><b>아이디</b>를 찾았습니다!</p>
                                <p id="p2"></p>
                            </div>
                            <hr>
                            <div class="signup-btn-box">
                                <a href="/" id="move-home-btn" class="btn1">홈으로</a>
                                <a href="/user/login.dog" id="move-login-btn" class="btn1" style="color: #ffffff;">로그인</a>
                            </div>
                        </div>
                        <div id="btn-box">
                            <a id="prev-btn2" class="next-btn" style="color:#ffffff;" onclick="showStep(2)">이전</a>
                            <!-- <a id="next-btn3" class="next-btn" style="color:#ffffff;" onclick="showStep(3)">다음</a> -->
                        </div>
                    </div>
                    
                    <div class="main-container4" style="display: none;">
                    	<div class="update-pw-box">
                    		<div class="user-info-box">
                    			<h1 class="update-pw-title">비밀번호 재설정</h1>
                    		</div>
                    		
							<div id="user-info-pw" class="user-info-box">
							    <label for="user-pw">재설정할 비밀번호</label>
							    <input type="password" id="user-pw" name="userPw" class="find-user-idpw-input" placeholder="소문자,숫자,특수문자 포함 10~20자" required>
							</div>
							
							<div id="user-info-pwck" class="user-info-box">
							    <label for="user-pw-check">재설정할 비밀번호 확인</label>
							    <input type="password" id="user-pw-check" name="userPwCheck" class="find-user-idpw-input" placeholder="비밀번호를 한 번 더 입력해주세요." required>
							</div>
							
							<div id="update-pw-btn-box" class="user-info-box">
								<input type="button" id="update-pw-btn" value="확인">
							</div>
                    	</div>
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

        <script>
        
   			// 이메일 인증 ajax
	     	$(document).ready(function() {
				$("#certification-btn").on("click",function(){
					var emailVal = $("#user-email").val();
					var emailPwVal = $("#user-pw-email").val();
					if(emailVal == null || emailVal == ""){
						if(emailPwVal == null || emailPwVal =="") {
							alert("이메일을 먼저 입력해주세요.");
						} else {
							alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");
							$.ajax({
								url : "/user/sendMail.dog",
								type : "POST",
								data : { mail : emailPwVal },
								success : function(data) {
									$("#send-certification-number").attr("value", data);
								},
								error : function() {
									alert:("ajax 오류, 관리자에게 문의 바랍니다.");
								}
							});
						}
					} else {
						alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");
						$.ajax({
							url : "/user/sendMail.dog",
							type : "POST",
							data : { mail : emailVal },
							success : function(data) {
								$("#send-certification-number").attr("value", data);
							},
							error : function() {
								alert:("ajax 오류, 관리자에게 문의 바랍니다.");
							}
						});
					}
				});
			});
	     	
	     	function confirmNumber(){
	     		var num1 = $("#certification-number");
	     		var num2 = $("#send-certification-number");
	     		if(num1.val() != ""){
		     		if(num1.val() === num2.val()) {
		     			alert("인증이 완료되었습니다.");
		     			$("#isChecked").attr("value", "true");
		     		} else {
		     			alert("작성한 인증번호가 다릅니다.");
		     			$("#isChecked").attr("value", "false");
		     		}
	     		} else {
	     			alert("인증번호를 입력해주세요.");
	     		}
	     	}
        	
	        $(document).ready(function() {
	        	// 비밀번호 찾기에 작성한 유저 정보 유효성 체크
	        	$("#find-user-pw-btn").on("click", function() {
	        		var userName = $("#user-pw-name").val();
	        		var userId = $("#user-id").val();
	        		var userEmail = $("#user-pw-email").val();
	        		
	        		$.ajax({
	        			url : "/user/checkUserByNameIdEmail.dog",
	        			type : "POST",
	        			data : 
	        			{
	        				"userName" : userName
	        				, "userId" : userId
	        				, "userEmail" : userEmail
	        			},
	        			success : function(data) {
	        				var msg = "";
	        				if(data == "true"){
	        					
	        					$("#step1, #step2, #step3").removeClass("active");
	        	                $("#step2").addClass("active");
	        	                
	        	                $(".main-container1, .main-container2, .main-container3, .main-container4").hide();
	        	                $(".main-container2").show();
	        					
	        	                $("#request-email").text(userEmail);
	        				} else if(data == "false"){
	        					msg = "이름 또는 아이디 또는 이메일이 다릅니다.<br>다시 확인해주세요.";
		        				$("#pw-msg").show().html(msg);
	        				}
	        			},
	        			error : function() {
	        				alert("ajax 오류 관리자에게 문의해주세요.")
	        			}
	        		});
	        	});
	        });
        
	        
	        $(document).ready(function() {
	        	
	        	// 아이디 찾기에 작성한 유저 정보 유효성 체크
	        	$("#find-user-id-btn").on("click", function() {
	        		var userName = $("#user-name").val();
	        		var userEmail = $("#user-email").val();
	        		
	        		$.ajax({
	        			url : "/user/checkUserByNameEmail.dog",
	        			type : "POST",
	        			data :
	        			{ 
	        				"userName" : userName
	        				, "userEmail" : userEmail 
	        			},
	        			success : function(data) {
	        				var msg = "";
	        				var result = data.split(",");
	        				if(result[0] == "true") {
	        					var userId = result[1];
	        					$("#p2").html(userName + " 님의 아이디는 <b>" + userId + "</b> 입니다.");
	        	                $("#step1, #step2, #step3").removeClass("active");
	        	                $("#step2").addClass("active");
	        	                
	        					$(".main-container1").hide();
	        	                $(".main-container2").show();
	        	                
	        	                $("#request-email").text(userEmail);
	        				} else if(result[0] == "false") {
	        					msg = "이름 또는 이메일이 다릅니다. 다시 확인해주세요.";
		        				$("#id-msg").show().text(msg);
	        				} else {
	        					msg = "오류";
		        				$("#id-msg").text(msg);
	        				}
	        			},
	        			error : function() {
	        				alert("Ajax 오류, 관리자에게 문의바랍니다.");
	        			}
	        		});
	        	});
	    	});

        	// 체크한 라디오버튼에 따라 display 변경
        	$(".radio-id-box").click(function() {
        		$("#find-pw-form").hide();
        		$("#find-id-form").show();
        	});
        	$(".radio-pw-box").click(function() {
        		$("#find-id-form").hide();
        		$("#find-pw-form").show();
        	});
        	
            function showStep(stepNumber) {
                // 모든 단계 비활성화
                $("#step1, #step2, #step3").removeClass("active");
                
                // 클릭된 단계 활성화
                $("#step" + stepNumber).addClass("active");
                $(".main-container1, .main-container2, .main-container3, .main-container4").hide();
                $(".main-container2").show();
            }
            
            // 다음 버튼
            function nextStep() {
            	var isChecked = $("#isChecked");
            	if(isChecked.val() === "true") {
	                $("#step1, #step2, #step3").removeClass("active");
	                var rFindIdBtn = $("#radio-findId");
	                console.log("아이디 찾기 체크 여부 : " + rFindIdBtn.prop("checked"));
	                console.log("비밀번호 찾기 체크 여부 : " + $("#radio-findPw").prop("checked"));
	            	if(rFindIdBtn.prop("checked")){
		                $("#step3").addClass("active");
		                $(".main-container1, .main-container2, .main-container3, .main-container4").hide();
		                $(".main-container3").show();
	            	} else {
	            		$("#step3").addClass("active");
	            		$(".main-container1, .main-container2, .main-container3, .main-container4").hide();
		                $(".main-container4").show();
	            	}
            	} else {
            		alert("확인 버튼을 눌러서 인증 확인을 받아야 합니다.");
            	}
            }


            // 이전 단계로 이동 (Step 1 <- Step 2)
            $("#prev-btn1").click(function() {
            	$(".main-container1, .main-container2, .main-container3, .main-container4").hide();
                $(".main-container1").show();
            });

            // 이전 단계로 이동 (Step 2 <- Step 3)
            $("#prev-btn2").click(function() {
            	$(".main-container1, .main-container2, .main-container3, .main-container4").hide();
                $(".main-container2").show();
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