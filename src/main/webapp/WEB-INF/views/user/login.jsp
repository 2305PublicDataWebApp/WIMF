<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		
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
        <!-- <link href="assets/css/main.css" rel="stylesheet"> -->
        <link href="/css/user/login.css" rel="stylesheet">
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
                <div id="mid-section">
                    <div class="login-box">
                        <form action="/user/login.dog" method="post">
                            <div class="input-id-box">
                                <label for="user-id">아이디</label>
                                <input type="text" id="user-id" name="userId" required>
                            </div>
                            <div class="input-pw-box">
                                <label for="user-pw">비밀번호</label>
                                <input type="password" id="user-pw" name="userPw" required>
                            </div>
                            <div>
                                <input type="submit" class="login-btn" value="로그인">
                            </div>
                        </form>
                    </div>
    
                </div>
                <div id="bottom-section">
                    <div class="hr-box"><hr></div>
                    <div class="find-user-info-box">
                        <a href="/user/findUserIdPw.dog" class="user-a-tag">아이디 찾기</a> | 
                        <a href="/user/findUserIdPw.dog" class="user-a-tag">비밀번호 찾기</a> | 
                        <a href="/user/register.dog" class="user-a-tag">회원가입</a>
                    </div>
                    <div class="sns-login-box">
                        <div class="naver-login-box">

                        </div>
                        <div class="kakao-login-box">

                        </div>
                        <div class="google-login-box">

                        </div>
                    </div>
                </div>
            </div>
        </main>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</body>
</html>