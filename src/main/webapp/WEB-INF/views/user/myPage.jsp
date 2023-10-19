<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		
		<!-- Fonts -->
		<link href="https://fonts.googleapis.com" rel="preconnect">
		<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
		<link
			href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap"
			rel="stylesheet">
		
		<!-- Vendor CSS Files -->
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/vendor/bootstrap-icons/bootstrap-icons.css"
			rel="stylesheet">
		<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
		<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
		<link href="/vendor/aos/aos.css" rel="stylesheet">
		
		<!-- Template Main CSS File -->
		<link href="/css/common/reset.css" rel="stylesheet">
		<link href="/css/user/myPage.css" rel="stylesheet">
		
		<script src="/js/myPage.js"></script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	
		<main id="container">
			<div class="app-container">
				<div class="app-header">
					<div class="app-header-left">
						<span class="app-icon"></span>
						<p class="app-name">Portfolio</p>
						<div class="search-wrapper">
							<input class="search-input" type="text" placeholder="Search">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								fill="none" stroke="currentColor" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								class="feather feather-search" viewBox="0 0 24 24">
				          <defs></defs>
				          <circle cx="11" cy="11" r="8"></circle>
				          <path d="M21 21l-4.35-4.35"></path>
				        </svg>
						</div>
					</div>
					<div class="app-header-right">
						<button class="mode-switch" title="Switch Theme">
							<svg class="moon" fill="none" stroke="currentColor"
								stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
								width="24" height="24" viewBox="0 0 24 24">
				          <defs></defs>
				          <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path>
				        </svg>
						</button>
						<button class="add-btn" title="Add New Project">
							<svg class="btn-icon" xmlns="http://www.w3.org/2000/svg"
								width="16" height="16" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="3" stroke-linecap="round"
								stroke-linejoin="round" class="feather feather-plus">
				          <line x1="12" y1="5" x2="12" y2="19" />
				          <line x1="5" y1="12" x2="19" y2="12" /></svg>
						</button>
						<button class="notification-btn">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-bell">
				          <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9" />
				          <path d="M13.73 21a2 2 0 0 1-3.46 0" /></svg>
						</button>
						<button class="profile-btn">
							<img src="https://assets.codepen.io/3306515/IMG_2025.jpg" /> <span>Aybüke
								C.</span>
						</button>
					</div>
					<button class="messages-btn">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-message-circle">
				        <path
								d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z" /></svg>
					</button>
				</div>
				
				<div class="app-content">
					<div class="app-sidebar">
						<a href="" class="app-sidebar-link active"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-home">
				          <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
				          <polyline points="9 22 9 12 15 12 15 22" /></svg>
						</a> <a href="" class="app-sidebar-link"> <svg class="link-icon"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								fill="none" stroke="currentColor" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								class="feather feather-pie-chart" viewBox="0 0 24 24">
				          <defs />
				          <path
									d="M21.21 15.89A10 10 0 118 2.83M22 12A10 10 0 0012 2v10z" />
				        </svg>
						</a> <a href="" class="app-sidebar-link"> <svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-calendar">
				          <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
				          <line x1="16" y1="2" x2="16" y2="6" />
				          <line x1="8" y1="2" x2="8" y2="6" />
				          <line x1="3" y1="10" x2="21" y2="10" /></svg>
						</a> <a href="" class="app-sidebar-link"> <svg class="link-icon"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								fill="none" stroke="currentColor" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								class="feather feather-settings" viewBox="0 0 24 24">
				          <defs />
				          <circle cx="12" cy="12" r="3" />
				          <path
									d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 010 2.83 2 2 0 01-2.83 0l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 1.51V21a2 2 0 01-2 2 2 2 0 01-2-2v-.09A1.65 1.65 0 009 19.4a1.65 1.65 0 00-1.82.33l-.06.06a2 2 0 01-2.83 0 2 2 0 010-2.83l.06-.06a1.65 1.65 0 00.33-1.82 1.65 1.65 0 00-1.51-1H3a2 2 0 01-2-2 2 2 0 012-2h.09A1.65 1.65 0 004.6 9a1.65 1.65 0 00-.33-1.82l-.06-.06a2 2 0 010-2.83 2 2 0 012.83 0l.06.06a1.65 1.65 0 001.82.33H9a1.65 1.65 0 001-1.51V3a2 2 0 012-2 2 2 0 012 2v.09a1.65 1.65 0 001 1.51 1.65 1.65 0 001.82-.33l.06-.06a2 2 0 012.83 0 2 2 0 010 2.83l-.06.06a1.65 1.65 0 00-.33 1.82V9a1.65 1.65 0 001.51 1H21a2 2 0 012 2 2 2 0 01-2 2h-.09a1.65 1.65 0 00-1.51 1z" />
				        </svg>
						</a>
					</div>
					<div class="messages-section">
						<button class="messages-close">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-x-circle">
					      <circle cx="12" cy="12" r="10" />
					      <line x1="15" y1="9" x2="9" y2="15" />
					      <line x1="9" y1="9" x2="15" y2="15" /></svg>
						</button>
						<form id="update-form" enctype="multipart/form-data" >
							<div class="projects-section-header">
								<div id="user-profile-div">
									<div id="img-div">
						                <div class="profile-image-container">
											<c:if test="${user.userFileRename ne null}">
												<img class="profile-img" alt="프로필사진" src="/resources/profileUploadFiles/${user.userFileRename }">
											</c:if>
											<c:if test="${user.userFileRename eq null}">
												<img class="profile-img" alt="프로필사진" src="/img/user/default-profile.png">
											</c:if>
	<!-- 					                    <img src="/img/user/default-profile.png" id="profile-image-preview" alt="프로필 이미지"> -->
						                    <input type="file" id="profile-image" name="uploadFile" accept="image/*">
						                    <label for="profile-image" class="upload-icon"><img src="/img/user/camera.png" id="camera" class="upload-icon" alt=""></label>
						                </div>
						                <div class="profile-label"><h4>개인정보 수정</h4></div>
						            </div>
								</div>
							</div>
							
							<div id="user-persnal-info-box">
							
								<div id="user-persnal-nickname-box" class="user-info-box">
									<label for="user-id">
	                                    아이디
	                                    <span id="id-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
									<input type="text" id="user-id" name="userId" class="input-user-info" value="${user.userId }" readonly required="required">
                                    <input type="hidden" id="user-ck-id">
								</div>
								
								<div id="user-info-pw" class="user-info-box">
                                    <label for="user-pw">
                                    	변경할 비밀번호
                                    	<span id="pw-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="password" id="user-pw" name="userPw" class="input-user-info" placeholder="소문자,숫자,특수문자 포함 10~20자" required="required">
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
                                    <input type="text" id="user-name" name="userName" class="input-user-info" value="${user.userName }" readonly required="required">
                                </div>
								
								<div id="user-info-nickname" class="user-info-box">
                                    <label for="user-nickname">
                                    	닉네임
                                    	<span id="nick-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="text" id="user-nickname" name="userNickname" class="input-user-info" value="${user.userNickname }" required="required">
                                	<input type="hidden" id="user-ck-nickname">
                                </div>

                                <div id="user-info-address" class="user-info-box">
                                    <label for="user-address">주소</label>
                                    <input type="text" id="user-address" name="userAddress" class="input-user-info" value="${user.userAddress }" readonly required="required">
                                    <input type="button" id="post-btn" onclick="sample4_execDaumPostcode();" value="주소 찾기">
                                </div>
                                
                                <div id="user-info-deatil-address" class="user-info-box">
                                    <label for="user-detail-address">상세주소 입력</label>
                                    <input type="text" id="user-detail-address" name="userDetailAddress" class="input-user-info" required="required">
                                </div>

                                <div id="user-info-phone" class="user-info-box">
                                    <label for="user-phone">전화번호</label>
                                    <input type="text" id="user-phone" name="userPhone" class="input-user-info" value="${user.userPhone }" required="required">
                                </div>

                                <div id="user-info-email" class="user-info-box">
                                    <label for="user-email">
                                    	이메일
                                    	<span id="email-msg" class="dupl-msg success">인증완료</span>
                                    </label>
                                    <input type="text" id="user-email" name="userEmail" class="input-user-info" value="${user.userEmail }" readonly required="required">
                                    <input type="hidden" id="user-ck-email">
                                    
                                </div>

	                            <div id="main-con-btn-box" class="btn-box">
	                                <input type="reset" id="prev-btn1" class="next-btn" value="취소">
	                                <input type="button" id="next-btn2" class="next-btn" value="수정">
	                            </div>
								
							</div>
						
						</form>
						
					</div>
					<div class="projects-section">
						<div class="projects-section-header">
							<p>후원중인 유기견</p>
<!-- 							<p class="time">December, 12</p> -->
						</div>
						<div class="projects-section-line">
							<div class="projects-status">
								<div class="item-status">
									<span class="status-number">45</span> <span class="status-type">In
										Progress</span>
								</div>
								<div class="item-status">
									<span class="status-number">24</span> <span class="status-type">Upcoming</span>
								</div>
								<div class="item-status">
									<span class="status-number">62</span> <span class="status-type">Total
										Projects</span>
								</div>
							</div>
							<div class="view-actions">
								<button class="view-btn list-view" title="List View">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-list">
				              <line x1="8" y1="6" x2="21" y2="6" />
				              <line x1="8" y1="12" x2="21" y2="12" />
				              <line x1="8" y1="18" x2="21" y2="18" />
				              <line x1="3" y1="6" x2="3.01" y2="6" />
				              <line x1="3" y1="12" x2="3.01" y2="12" />
				              <line x1="3" y1="18" x2="3.01" y2="18" /></svg>
								</button>
								<button class="view-btn grid-view active" title="Grid View">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-grid">
				              <rect x="3" y="3" width="7" height="7" />
				              <rect x="14" y="3" width="7" height="7" />
				              <rect x="14" y="14" width="7" height="7" />
				              <rect x="3" y="14" width="7" height="7" /></svg>
								</button>
							</div>
						</div>
						<div class="project-boxes jsGridView">
							<div class="project-box-wrapper">
								<div class="project-box" style="background-color: #fee4cb;">
									<div class="project-box-header">
										<span>December 10, 2020</span>
										<div class="more-wrapper">
											<button class="project-btn-more">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-more-vertical">
				                    <circle cx="12" cy="12" r="1" />
				                    <circle cx="12" cy="5" r="1" />
				                    <circle cx="12" cy="19" r="1" /></svg>
											</button>
										</div>
									</div>
									<div class="project-box-content-header">
										<p class="box-content-header">Web Designing</p>
										<p class="box-content-subheader">Prototyping</p>
									</div>
									<div class="box-progress-wrapper">
										<p class="box-progress-header">Progress</p>
										<div class="box-progress-bar">
											<span class="box-progress"
												style="width: 60%; background-color: #ff942e"></span>
										</div>
										<p class="box-progress-percentage">60%</p>
									</div>
									<div class="project-box-footer">
										<div class="participants">
											<img
												src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80"
												alt="participant"> <img
												src="https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"
												alt="participant">
											<button class="add-participant" style="color: #ff942e;">
												<svg xmlns="http://www.w3.org/2000/svg" width="12"
													height="12" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="3"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-plus">
				                <path d="M12 5v14M5 12h14" />
				              </svg>
											</button>
										</div>
										<div class="days-left" style="color: #ff942e;">2 Days
											Left</div>
									</div>
								</div>
							</div>
							<div class="project-box-wrapper">
								<div class="project-box" style="background-color: #e9e7fd;">
									<div class="project-box-header">
										<span>December 10, 2020</span>
										<div class="more-wrapper">
											<button class="project-btn-more">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-more-vertical">
				                <circle cx="12" cy="12" r="1" />
				                <circle cx="12" cy="5" r="1" />
				                <circle cx="12" cy="19" r="1" /></svg>
											</button>
										</div>
									</div>
									<div class="project-box-content-header">
										<p class="box-content-header">Testing</p>
										<p class="box-content-subheader">Prototyping</p>
									</div>
									<div class="box-progress-wrapper">
										<p class="box-progress-header">Progress</p>
										<div class="box-progress-bar">
											<span class="box-progress"
												style="width: 50%; background-color: #4f3ff0"></span>
										</div>
										<p class="box-progress-percentage">50%</p>
									</div>
									<div class="project-box-footer">
										<div class="participants">
											<img
												src="https://images.unsplash.com/photo-1596815064285-45ed8a9c0463?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1215&q=80"
												alt="participant"> <img
												src="https://images.unsplash.com/photo-1583195764036-6dc248ac07d9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2555&q=80"
												alt="participant">
											<button class="add-participant" style="color: #4f3ff0;">
												<svg xmlns="http://www.w3.org/2000/svg" width="12"
													height="12" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="3"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-plus">
				                <path d="M12 5v14M5 12h14" />
				              </svg>
											</button>
										</div>
										<div class="days-left" style="color: #4f3ff0;">2 Days
											Left</div>
									</div>
								</div>
							</div>
							<div class="project-box-wrapper">
								<div class="project-box">
									<div class="project-box-header">
										<span>December 10, 2020</span>
										<div class="more-wrapper">
											<button class="project-btn-more">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-more-vertical">
				                <circle cx="12" cy="12" r="1" />
				                <circle cx="12" cy="5" r="1" />
				                <circle cx="12" cy="19" r="1" /></svg>
											</button>
										</div>
									</div>
									<div class="project-box-content-header">
										<p class="box-content-header">Svg Animations</p>
										<p class="box-content-subheader">Prototyping</p>
									</div>
									<div class="box-progress-wrapper">
										<p class="box-progress-header">Progress</p>
										<div class="box-progress-bar">
											<span class="box-progress"
												style="width: 80%; background-color: #096c86"></span>
										</div>
										<p class="box-progress-percentage">80%</p>
									</div>
									<div class="project-box-footer">
										<div class="participants">
											<img
												src="https://images.unsplash.com/photo-1587628604439-3b9a0aa7a163?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fHdvbWFufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"
												alt="participant"> <img
												src="https://images.unsplash.com/photo-1596815064285-45ed8a9c0463?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1215&q=80"
												alt="participant">
											<button class="add-participant" style="color: #096c86;">
												<svg xmlns="http://www.w3.org/2000/svg" width="12"
													height="12" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="3"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-plus">
				                <path d="M12 5v14M5 12h14" />
				              </svg>
											</button>
										</div>
										<div class="days-left" style="color: #096c86;">2 Days
											Left</div>
									</div>
								</div>
							</div>
							<div class="project-box-wrapper">
								<div class="project-box" style="background-color: #ffd3e2;">
									<div class="project-box-header">
										<span>December 10, 2020</span>
										<div class="more-wrapper">
											<button class="project-btn-more">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-more-vertical">
				                <circle cx="12" cy="12" r="1" />
				                <circle cx="12" cy="5" r="1" />
				                <circle cx="12" cy="19" r="1" /></svg>
											</button>
										</div>
									</div>
									<div class="project-box-content-header">
										<p class="box-content-header">UI Development</p>
										<p class="box-content-subheader">Prototyping</p>
									</div>
									<div class="box-progress-wrapper">
										<p class="box-progress-header">Progress</p>
										<div class="box-progress-bar">
											<span class="box-progress"
												style="width: 20%; background-color: #df3670"></span>
										</div>
										<p class="box-progress-percentage">20%</p>
									</div>
									<div class="project-box-footer">
										<div class="participants">
											<img
												src="https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80"
												alt="participant"> <img
												src="https://images.unsplash.com/photo-1587628604439-3b9a0aa7a163?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fHdvbWFufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"
												alt="participant">
											<button class="add-participant" style="color: #df3670;">
												<svg xmlns="http://www.w3.org/2000/svg" width="12"
													height="12" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="3"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-plus">
				                <path d="M12 5v14M5 12h14" />
				              </svg>
											</button>
										</div>
										<div class="days-left" style="color: #df3670;">2 Days
											Left</div>
									</div>
								</div>
							</div>
							<div class="project-box-wrapper">
								<div class="project-box" style="background-color: #c8f7dc;">
									<div class="project-box-header">
										<span>December 10, 2020</span>
										<div class="more-wrapper">
											<button class="project-btn-more">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-more-vertical">
				                <circle cx="12" cy="12" r="1" />
				                <circle cx="12" cy="5" r="1" />
				                <circle cx="12" cy="19" r="1" /></svg>
											</button>
										</div>
									</div>
									<div class="project-box-content-header">
										<p class="box-content-header">Data Analysis</p>
										<p class="box-content-subheader">Prototyping</p>
									</div>
									<div class="box-progress-wrapper">
										<p class="box-progress-header">Progress</p>
										<div class="box-progress-bar">
											<span class="box-progress"
												style="width: 60%; background-color: #34c471"></span>
										</div>
										<p class="box-progress-percentage">60%</p>
									</div>
									<div class="project-box-footer">
										<div class="participants">
											<img
												src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80"
												alt="participant"> <img
												src="https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"
												alt="participant">
											<button class="add-participant" style="color: #34c471;">
												<svg xmlns="http://www.w3.org/2000/svg" width="12"
													height="12" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="3"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-plus">
				                <path d="M12 5v14M5 12h14" />
				              </svg>
											</button>
										</div>
										<div class="days-left" style="color: #34c471;">2 Days
											Left</div>
									</div>
								</div>
							</div>
							<div class="project-box-wrapper">
								<div class="project-box" style="background-color: #d5deff;">
									<div class="project-box-header">
										<span>December 10, 2020</span>
										<div class="more-wrapper">
											<button class="project-btn-more">
												<svg xmlns="http://www.w3.org/2000/svg" width="24"
													height="24" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-more-vertical">
				                <circle cx="12" cy="12" r="1" />
				                <circle cx="12" cy="5" r="1" />
				                <circle cx="12" cy="19" r="1" /></svg>
											</button>
										</div>
									</div>
									<div class="project-box-content-header">
										<p class="box-content-header">Web Designing</p>
										<p class="box-content-subheader">Prototyping</p>
									</div>
									<div class="box-progress-wrapper">
										<p class="box-progress-header">Progress</p>
										<div class="box-progress-bar">
											<span class="box-progress"
												style="width: 40%; background-color: #4067f9"></span>
										</div>
										<p class="box-progress-percentage">40%</p>
									</div>
									<div class="project-box-footer">
										<div class="participants">
											<img
												src="https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80"
												alt="participant"> <img
												src="https://images.unsplash.com/photo-1583195764036-6dc248ac07d9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2555&q=80"
												alt="participant">
											<button class="add-participant" style="color: #4067f9;">
												<svg xmlns="http://www.w3.org/2000/svg" width="12"
													height="12" viewBox="0 0 24 24" fill="none"
													stroke="currentColor" stroke-width="3"
													stroke-linecap="round" stroke-linejoin="round"
													class="feather feather-plus">
				                <path d="M12 5v14M5 12h14" />
				              </svg>
											</button>
										</div>
										<div class="days-left" style="color: #4067f9;">2 Days
											Left</div>
									</div>
								</div>
							</div>
						</div>
					</div>
	
				</div>
			</div>
		</main>
	
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	
		<!-- 부트스트랩 JS 및 jQuery 스크립트 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="/vendor/glightbox/js/glightbox.min.js"></script>
		<script src="/vendor/purecounter/purecounter_vanilla.js"></script>
		<script src="/vendor/isotope-layout/isotope.pkgd.min.js"></script>
		<script src="/vendor/swiper/swiper-bundle.min.js"></script>
		<script src="/vendor/aos/aos.js"></script>
		<script src="/vendor/php-email-form/validate.js"></script>
	
		<!-- 다음 주소 API -->
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
		<script>
			
			// 개인정보 수정
			$(document).ready(function(){
				$("#next-btn2").on("click", function(event){
					
					event.preventDefault();
	        		
	            	var userIdVal = $("#user-id").val();
	            	var userPwVal = $("#user-pw").val();
	            	var userNicknameVal = $("#user-nickname").val();
	            	var userAddressVal = $("#user-address").val();
	            	var userDetailAddressVal = $("#user-detail-address").val();
	            	var userPhoneVal = $("#user-phone").val();
	            	var userFileRename = ${user.userFileRename };
					
	            	var formData = new FormData();
					var fileInput = document.getElementById("profile-image");
					var file = fileInput.files[0];
	                formData.append("uploadFile", file);
	                formData.append("userId", userIdVal);
	                formData.append("userPw", userPwVal);
	                formData.append("userNickname", userNicknameVal);
	                formData.append("userAddress", userAddressVal);
	                formData.append("userDetailAddress", userDetailAddressVal);
	                formData.append("userPhone", userPhoneVal);
	                formData.append("userFileRename", userFileRename);
	            	
					$.ajax({
						url : "/user/update.dog",
						type : "POST",
						data : formData,
						success : function(data){
							if(data === "success"){
								alert("수정 완료");
							} else if(data ==="false") {
								alert("수정 실패");
							} else {
								alert("오류, 관리자에게 문의해주세요.");
							}
						},
						error : function(){
							alert("ajax 오류, 관리자에게 문의해주세요.");
						}
					});
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
	        
	        $(".user-menu-box > ul > li > a").click(function(e) {
	           e.preventDefault();
	  
	           // 현재 클릭한 버튼에 대한 하위 메뉴만 열기
	           var subMenu = $(this).next('.subMenu').not(':animated');
	           subMenu.slideToggle();
	  
	           // 다른 모든 하위 메뉴 닫기
	           $(".subMenu").not(subMenu).slideUp();
	        });
			function closeSubMenu() {
				$(".subMenu").slideUp();
			}
			
			$(document).ready(function() {
				removeNavClass();
				$(".subMenu").slideUp();
			});
			function removeNavClass() {
				$("#nav-home").removeClass("active");
				$("#nav-dolbom-list").removeClass("active");
				$("#nav-adopt").removeClass("active");
				$("#nav-dolbom-list-review").removeClass("active");
				$("#nav-adopt-review").removeClass("active");
				$("#nav-adopt-request").removeClass("active");
				$("#nav-board-list").removeClass("active");
				$("#nav-sevice").removeClass("active");
				$("#nav-about").removeClass("active");
				$("#nav-Contact").removeClass("active");
			}
		</script>
	</body>
</html>