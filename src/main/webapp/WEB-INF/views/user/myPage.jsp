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
<!-- 					<div class="app-header-left"> -->
<!-- 						<span class="app-icon"></span> -->
<!-- 						<p class="app-name">Portfolio</p> -->
<!-- 						<div class="search-wrapper"> -->
<!-- 							<input class="search-input" type="text" placeholder="Search"> -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" -->
<!-- 								fill="none" stroke="currentColor" stroke-linecap="round" -->
<!-- 								stroke-linejoin="round" stroke-width="2" -->
<!-- 								class="feather feather-search" viewBox="0 0 24 24"> -->
<!-- 				          <defs></defs> -->
<%-- 				          <circle cx="11" cy="11" r="8"></circle> --%>
<!-- 				          <path d="M21 21l-4.35-4.35"></path> -->
<!-- 				        </svg> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="app-header-right"> -->
<!-- 						<button class="mode-switch" title="Switch Theme"> -->
<!-- 							<svg class="moon" fill="none" stroke="currentColor" -->
<!-- 								stroke-linecap="round" stroke-linejoin="round" stroke-width="2" -->
<!-- 								width="24" height="24" viewBox="0 0 24 24"> -->
<!-- 				          <defs></defs> -->
<!-- 				          <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path> -->
<!-- 				        </svg> -->
<!-- 						</button> -->
<!-- 						<button class="add-btn" title="Add New Project"> -->
<!-- 							<svg class="btn-icon" xmlns="http://www.w3.org/2000/svg" -->
<!-- 								width="16" height="16" viewBox="0 0 24 24" fill="none" -->
<!-- 								stroke="currentColor" stroke-width="3" stroke-linecap="round" -->
<!-- 								stroke-linejoin="round" class="feather feather-plus"> -->
<!-- 				          <line x1="12" y1="5" x2="12" y2="19" /> -->
<!-- 				          <line x1="5" y1="12" x2="19" y2="12" /></svg> -->
<!-- 						</button> -->
<!-- 						<button class="notification-btn"> -->
<!-- 							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" -->
<!-- 								viewBox="0 0 24 24" fill="none" stroke="currentColor" -->
<!-- 								stroke-width="2" stroke-linecap="round" stroke-linejoin="round" -->
<!-- 								class="feather feather-bell"> -->
<!-- 				          <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9" /> -->
<!-- 				          <path d="M13.73 21a2 2 0 0 1-3.46 0" /></svg> -->
<!-- 						</button> -->
<!-- 						<button class="profile-btn"> -->
<!-- 							<img src="https://assets.codepen.io/3306515/IMG_2025.jpg" /> <span>Aybüke -->
<!-- 								C.</span> -->
<!-- 						</button> -->
<!-- 					</div> -->
					<button class="messages-btn">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-message-circle">
				        <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 
				        4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z" /></svg>
					</button>
				</div>
				
				<div class="app-content">
					<div class="app-sidebar">
						<a href="javascript:void(0)" onclick="switchMainByIcon(1);" id="switchIcon1" class="app-sidebar-link active">
							<svg
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-home">
								<path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
								<polyline points="9 22 9 12 15 12 15 22" />
							</svg>
						</a>
						
						<a href="javascript:void(0)" onclick="switchMainByIcon(2);" id="switchIcon2" class="app-sidebar-link">
							<svg class="link-icon"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								fill="none" stroke="currentColor" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								class="feather feather-pie-chart" viewBox="0 0 24 24">
								<defs />
								<path d="M21.21 15.89A10 10 0 118 2.83M22 12A10 10 0 0012 2v10z" />
					        </svg>
						</a>
						
						<a href="javascript:void(0)" onclick="switchMainByIcon(3);" id="switchIcon3" class="app-sidebar-link">
							<svg
										xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
										class="feather feather-calendar">
						          <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
						          <line x1="16" y1="2" x2="16" y2="6" />
						          <line x1="8" y1="2" x2="8" y2="6" />
						          <line x1="3" y1="10" x2="21" y2="10" />
							</svg>
						</a>
						<a href="javascript:void(0)" onclick="switchMainByIcon(4);" id="switchIcon4" class="app-sidebar-link"> 
							<svg class="link-icon"
									xmlns="http://www.w3.org/2000/svg" width="24" height="24"
									fill="none" stroke="currentColor" stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									class="feather feather-settings" viewBox="0 0 24 24">
					          <defs />
					          <circle cx="12" cy="12" r="3" />
					          <path d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 010 2.83 2 2 0 01-2.83 0l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 
					          1.51V21a2 2 0 01-2 2 2 2 0 01-2-2v-.09A1.65 1.65 0 009 19.4a1.65 1.65 0 00-1.82.33l-.06.06a2 2 0 01-2.83 0 2 2 0 010-2.83l.06-.06a1.65 
					          1.65 0 00.33-1.82 1.65 1.65 0 00-1.51-1H3a2 2 0 01-2-2 2 2 0 012-2h.09A1.65 1.65 0 004.6 9a1.65 1.65 0 00-.33-1.82l-.06-.06a2 2 0 
					          010-2.83 2 2 0 012.83 0l.06.06a1.65 1.65 0 001.82.33H9a1.65 1.65 0 001-1.51V3a2 2 0 012-2 2 2 0 012 2v.09a1.65 1.65 0 001 1.51 1.65 1.65 
					          0 001.82-.33l.06-.06a2 2 0 012.83 0 2 2 0 010 2.83l-.06.06a1.65 1.65 0 00-.33 1.82V9a1.65 1.65 0 001.51 1H21a2 2 0 012 2 2 2 0 01-2 
					          2h-.09a1.65 1.65 0 00-1.51 1z" />
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
											<img id="profile-image-preview" class="profile-img" alt="프로필사진" src="">
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
									<input type="text" id="user-id" name="userId" class="input-user-info" readonly required="required">
                                    <input type="hidden" id="user-ck-id">
								</div>
								
<!-- 								<div id="user-info-pw" class="user-info-box"> -->
<!--                                     <label for="user-pw"> -->
<!--                                     	변경할 비밀번호 -->
<!--                                     	<span id="pw-msg" class="dupl-msg" style="display: none;"></span> -->
<!--                                     </label> -->
<!--                                     <input type="password" id="user-pw" name="userPw" class="input-user-info" placeholder="소문자,숫자,특수문자 포함 10~20자" required="required"> -->
<!--                                     <input type="hidden" id="user-ck-pw"> -->
<!--                                 </div> -->

<!--                                 <div id="user-info-pwck" class="user-info-box"> -->
<!--                                     <label for="user-pw-check"> -->
<!--                                     	비밀번호 확인 -->
<!--                                     	<span id="pw-ck-msg" class="dupl-msg" style="display: none;"></span> -->
<!--                                     </label> -->
<!--                                     <input type="password" id="user-pw-check" name="userPwCheck" class="input-user-info" placeholder="비밀번호를 한 번 더 입력해주세요." required> -->
<!--                                     <input type="hidden" id="check-pw"> -->
<!--                                 </div> -->
								
								<div id="user-info-name" class="user-info-box">
                                    <label for="user-name">이름</label>
                                    <input type="text" id="user-name" name="userName" class="input-user-info" readonly required="required">
                                </div>
								
								<div id="user-info-nickname" class="user-info-box">
                                    <label for="user-nickname">
                                    	닉네임
                                    	<span id="nick-msg" class="dupl-msg" style="display: none;"></span>
                                    </label>
                                    <input type="text" id="user-nickname" name="userNickname" class="input-user-info" required="required">
                                	<input type="hidden" id="user-ck-nickname">
                                </div>

                                <div id="user-info-address" class="user-info-box">
                                    <label for="user-address">주소</label>
                                    <input type="text" id="user-address" name="userAddress" class="input-user-info" readonly required="required">
                                    <input type="button" id="post-btn" onclick="sample4_execDaumPostcode();" value="주소 찾기">
                                </div>
                                
                                <div id="user-info-deatil-address" class="user-info-box">
                                    <label for="user-detail-address">상세주소 입력</label>
                                    <input type="text" id="user-detail-address" name="userDetailAddress" class="input-user-info" required="required">
                                </div>

                                <div id="user-info-phone" class="user-info-box">
                                    <label for="user-phone">전화번호</label>
                                    <input type="text" id="user-phone" name="userPhone" class="input-user-info" required="required">
                                </div>

                                <div id="user-info-email" class="user-info-box">
                                    <label for="user-email">
                                    	이메일
                                    	<span id="email-msg" class="dupl-msg success">인증완료</span>
                                    </label>
                                    <input type="text" id="user-email" name="userEmail" class="input-user-info" readonly required="required">
                                    <input type="hidden" id="user-ck-email">
                                    
                                </div>

	                            <div id="main-con-btn-box" class="btn-box">
	                                <input type="reset" id="prev-btn1" class="next-btn" value="취소">
	                                <input type="button" id="next-btn2" class="next-btn" value="수정">
	                            </div>
								
							</div>
						
						</form>
						
					</div>
					
					<div id="main-section1" class="projects-section">
						<div class="projects-section-header">
							<p>후원했던 유기견</p>
<!-- 							<p class="time">December, 12</p> -->
						</div>
<!-- 						<div class="projects-section-line"> -->
<!-- 							<div class="projects-status"> -->
<!-- 								<div class="item-status"> -->
<!-- 									<span class="status-number">45</span> <span class="status-type">In -->
<!-- 										Progress</span> -->
<!-- 								</div> -->
<!-- 								<div class="item-status"> -->
<!-- 									<span class="status-number">24</span> <span class="status-type">Upcoming</span> -->
<!-- 								</div> -->
<!-- 								<div class="item-status"> -->
<!-- 									<span class="status-number">62</span> <span class="status-type">Total -->
<!-- 										Projects</span> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="view-actions"> -->
<!-- 								<button class="view-btn list-view" title="List View"> -->
<!-- 									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" -->
<!-- 										viewBox="0 0 24 24" fill="none" stroke="currentColor" -->
<!-- 										stroke-width="2" stroke-linecap="round" stroke-linejoin="round" -->
<!-- 										class="feather feather-list"> -->
<!-- 				              <line x1="8" y1="6" x2="21" y2="6" /> -->
<!-- 				              <line x1="8" y1="12" x2="21" y2="12" /> -->
<!-- 				              <line x1="8" y1="18" x2="21" y2="18" /> -->
<!-- 				              <line x1="3" y1="6" x2="3.01" y2="6" /> -->
<!-- 				              <line x1="3" y1="12" x2="3.01" y2="12" /> -->
<!-- 				              <line x1="3" y1="18" x2="3.01" y2="18" /></svg> -->
<!-- 								</button> -->
<!-- 								<button class="view-btn grid-view active" title="Grid View"> -->
<!-- 									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" -->
<!-- 										viewBox="0 0 24 24" fill="none" stroke="currentColor" -->
<!-- 										stroke-width="2" stroke-linecap="round" stroke-linejoin="round" -->
<!-- 										class="feather feather-grid"> -->
<!-- 				              <rect x="3" y="3" width="7" height="7" /> -->
<!-- 				              <rect x="14" y="3" width="7" height="7" /> -->
<!-- 				              <rect x="14" y="14" width="7" height="7" /> -->
<!-- 				              <rect x="3" y="14" width="7" height="7" /></svg> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div id="donation-dog-box" class="project-boxes jsGridView">
							
						</div>
					</div>
					
					<div id="main-section2" class="projects-section" style="display: none;">
					
						<div id="section2-title-box">
							<div id="section2-title">
								<h1>나의 활동</h1>
							</div>
						</div>
						
						<div id="section-choice-box">
						
							<div id="choice-btn-box1" class="choice-btn-box">
								<input type="radio" id="my-write-board" class="choice-radio-btn" name="section2Choice" value="" onclick="changeSection2(1)" checked>
								<label for="my-write-board">작성한 게시글</label>
							
							</div>
							
							<div id="choice-btn-box2" class="choice-btn-box">
								<input type="radio" id="my-like-board" class="choice-radio-btn" name="section2Choice" onclick="changeSection2(2)" value="">
								<label for="my-like-board">좋아요 한 강아지</label>
							</div>
							
							<div id="choice-btn-box3" class="choice-btn-box">
								<input type="radio" id="my-adopt-subscription" class="choice-radio-btn" name="section2Choice" onclick="changeSection2(3)" value="">
								<label for="my-adopt-subscription">작성한 입양신청서</label>
							</div>
							
						</div>
						
						<div id="my-write-board-box">
							<div id="write-title-section">
								<h3>작성한 게시글</h3>
							</div>
							<div id="write-list-box">
							
<!-- 					            <div id="paging"> -->
<!-- 						        	<tr align="center"> -->
<!-- 						          	<td colspan="5"> -->
<%-- 						          		<c:if test="${bpInfo.startNavi != 1}"> --%>
<%-- 						          			<c:url var="prevUrl" value="/user/myPage.dog"> --%>
<%-- 						          				<c:param name="page" value="${bpInfo.startNavi - 1 }"></c:param> --%>
<%-- 						          			</c:url> --%>
<%-- 						          			<a href="${prevUrl }">◀</a> --%>
<%-- 						          		</c:if> --%>
<%-- 						          		<c:forEach begin="${bpInfo.startNavi }" end="${bpInfo.endNavi }" var="p"> --%>
<%-- 						          			<c:url var="pageUrl" value="/user/myPage.dog"> --%>
<%-- 						          				<c:param name="page" value="${p }"></c:param> --%>
<%-- 						          			</c:url> --%>
<%-- 						          			<a href="${pageUrl }">${p }</a>&nbsp; --%>
<%-- 						          		</c:forEach> --%>
<%-- 						          		<c:if test="${bpInfo.endNavi != bpInfo.naviTotalCount}"> --%>
<%-- 											<c:url var="nextUrl" value="/user/myPage.dog"> --%>
<%-- 												<c:param name="page" value="${bpInfo.endNavi + 1 }"></c:param> --%>
<%-- 											</c:url>          		 --%>
<%-- 						          			<a href="${nextUrl }">▶</a> --%>
<%-- 						          		</c:if> --%>
<!-- 						          	</td> -->
<!-- 						          </tr> -->
<!-- 					            </div> -->
							</div>
							
						</div>
						
						<div id="my-like-board-box" style="display: none;">
							<div id="like-title-section">
								<h3>좋아요 한 강아지</h3>
							</div>
							<div id="like-list-box">
								
							</div>
						</div>
						
						<div id="my-adopt-subscription-box" style="display: none;">
							<div id="app-title-section">
								<h3>작성한 입양신청서</h3>
							</div>
							<div id="app-list-box">
								
							</div>
						</div>
					</div>
					
					<div id="main-section3" class="projects-section" style="display: none;">
						<!-- Pricing Section - Home Page -->
    <c:if test="${sessionScope.userId ne null}">
    
    <section id="pricing" class="pricing">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Calendar</h2>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row g-4">

          <!-- <div class="col"> -->
            <!-- <div class="pricing-item">
              <h3>Free Plan</h3>
              <div class="icon">
                <i class="bi bi-box"></i>
              </div>
              <h4><sup>$</sup>0<span> / month</span></h4>
              <ul>
                <li><i class="bi bi-check"></i> <span>Quam adipiscing vitae proin</span></li>
                <li><i class="bi bi-check"></i> <span>Nec feugiat nisl pretium</span></li>
                <li><i class="bi bi-check"></i> <span>Nulla at volutpat diam uteera</span></li>
                <li class="na"><i class="bi bi-x"></i> <span>Pharetra massa massa ultricies</span></li>
                <li class="na"><i class="bi bi-x"></i> <span>Massa ultricies mi quis hendrerit</span></li>
              </ul>
              <div class="text-center"><a href="#" class="buy-btn">Buy Now</a></div>
            </div> -->
          <!-- </div> -->
          <!-- End Pricing Item -->

          <!-- <div class="col-lg-12"> -->
            <div class="pricing-item"> <!-- class="featured" -->
            <div id='calendar'></div>
            <!-- 날짜 누르면 표시되는 날짜에 대한 일정 가져오기 div -->
            <div class="calendarList" id="calendarList">
              <ul id="eventList">
                <li></li>
              </ul>
            </div>
            
            
              <!-- <h3>Business Plan</h3>
              <div class="icon">
                <i class="bi bi-rocket"></i>
              </div>

              <h4><sup>$</sup>29<span> / month</span></h4>
              <ul>
                <li><i class="bi bi-check"></i> <span>Quam adipiscing vitae proin</span></li>
                <li><i class="bi bi-check"></i> <span>Nec feugiat nisl pretium</span></li>
                <li><i class="bi bi-check"></i> <span>Nulla at volutpat diam uteera</span></li>
                <li><i class="bi bi-check"></i> <span>Pharetra massa massa ultricies</span></li>
                <li><i class="bi bi-check"></i> <span>Massa ultricies mi quis hendrerit</span></li>
              </ul> -->
              <div class="text-center">              
                <button type="button" onclick="openPopup1();" class="buy-btn text-center calendarPopupBtn">등록</button>
              </div>
            </div>
          <!-- </div> -->
          <!-- End Pricing Item -->

          <!-- <div class="col"> -->
            <!-- <div class="pricing-item">
              <h3>Developer Plan</h3>
              <div class="icon">
                <i class="bi bi-send"></i>
              </div>
              <h4><sup>$</sup>49<span> / month</span></h4>
              <ul>
                <li><i class="bi bi-check"></i> <span>Quam adipiscing vitae proin</span></li>
                <li><i class="bi bi-check"></i> <span>Nec feugiat nisl pretium</span></li>
                <li><i class="bi bi-check"></i> <span>Nulla at volutpat diam uteera</span></li>
                <li><i class="bi bi-check"></i> <span>Pharetra massa massa ultricies</span></li>
                <li><i class="bi bi-check"></i> <span>Massa ultricies mi quis hendrerit</span></li>
              </ul>
              <div class="text-center"><a href="#" class="buy-btn">Buy Now</a></div>
            </div> -->
          <!-- </div> -->
          <!-- End Pricing Item -->

        </div>

      </div>

    </section><!-- End Pricing Section -->
    
    </c:if>
					</div>
					
					<div id="main-section4" class="projects-section" style="display: none;">
					

						<div id="main-sub-section1">
                    		<div id="update-pw-title-box" class="user-info-box">
                    			<h1 class="update-pw-title">비밀번호 재설정</h1>
                    			<hr>
                    		</div>
						
<!-- 							<div id="check-pw-box"> -->
<!-- 								<div id="user-info-pwck" class="pw-sub-box"> -->
<!-- 								    <label for="user-pw-now">현재 비밀번호 입력</label> -->
<!-- 								    <input type="password" id="user-pw-now" name="userPw" class="find-user-idpw-input" placeholder="현재 비밀번호를 입력해주세요."> -->
<!-- 								</div> -->
								
<!-- 								<div id="update-pw-btn-box1" class="user-info-box"> -->
<!-- 									<input type="button" id="check-pw-btn" value="확인"> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
							<div id="update-pw-box" style="display:none">
								<div id="user-info-pw" class="pw-sub-box">
								    <label for="user-pw">재설정할 비밀번호</label>
								    <input type="password" id="user-pw" name="userPw" class="find-user-idpw-input" placeholder="소문자,숫자,특수문자 포함 10~20자" required>
								</div>
								
								<div class="pw-sub-box">
								    <label for="user-pw-check">재설정할 비밀번호 확인</label>
								    <input type="password" id="user-pw-check" name="userPwCheck" class="find-user-idpw-input" placeholder="비밀번호를 한 번 더 입력해주세요." required>
								</div>
								
								<div id="update-pw-btn-box2" class="user-info-box">
									<input type="button" id="update-pw-btn" value="확인">
								</div>
                    		</div>
						</div>
						
						
						
						<div id="main-sub-section2" style="display: none;">
							<div id="delete-user-title-box" class="user-info-box">
                    			<h1 class="delete-user-title">회원탈퇴</h1>
                    			<hr>
                    		</div>
						</div>
						
						<div id="check-pw-box">
								<div class="pw-sub-box">
								    <label for="user-pw-now">
								    	현재 비밀번호 입력
								    	<span id="pw-now-msg"></span>
								    </label>
								    <input type="password" id="user-pw-now" name="userPw" class="find-user-idpw-input" placeholder="현재 비밀번호를 입력해주세요.">
								</div>
								
								<div id="update-pw-btn-box1" class="user-info-box">
									<input type="button" id="check-pw-btn" value="확인">
								</div>
						</div>
						
						<div id="main-choice-section">
							<div class="choice-btn-box">
								<input type="radio" id="update-pw-radio-btn" name="choiceSection" onclick="changeSubSection(1)" value="updatePw" checked>
								<label for="update-pw-radio-btn">비밀번호 변경</label>
							</div>
							
							<div class="choice-btn-box">
								<input type="radio" id="delete-user-btn" name="choiceSection" onclick="changeSubSection(2)" value="deleteUser">
								<label for="delete-user-btn">회원 탈퇴</label>
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
		</main>
	
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	
		<!-- 부트스트랩 JS 및 jQuery 스크립트 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
		
			// 함수 실행
			$(document).ready(function(){
				removeNavClass();
				showUserPersnalInfo();
				showDonationDogList();
// 				showBoardList();
// 				showBoardLikeList();
// 				showAdoptApplicationList();
			});
			
			// 마이페이지 후원중인 강아지 리스트 출력 ajax
			function showDonationDogList(){
				$.ajax({
					url : "/user/myPageDonationList.dog",
					type : "POST",
					success : function(data) {
						if(data !== "false") {
							let donationList = "";
							for(let i = 0; i < data.length - 1; i++){
// 							let donationWon = data[i].donationMoney;
								if(data[i].dogNo == data[i+1].dogNo){
// 									donationWon = data[i].donationMoney + data[i+1].donationMoney;
									return;
								} else {
									donationList +=
										"<div class='project-box-wrapper'>" + 
											"<div class='project-box' style='background-color: #fee4cb;''>" +
												"<div class='project-box-header'>" + 
													"<span>최근 후원 날짜 : " + data[i].donationDate + "</span>" +
// 													"<div class='more-wrapper'>" +
// 														"<button class='project-btn-more'>" +
// 															"<svg xmlns='http://www.w3.org/2000/svg' width='24'"+
// 																"height='24' viewBox='0 0 24 24' fill='none'"+
// 																"stroke='currentColor' stroke-width='2'"+
// 																"stroke-linecap='round' stroke-linejoin='round'"+
// 																"class='feather feather-more-vertical'>"+
// 							                    "<circle cx='12' cy='12' r='1' />"+
// 							                    "<circle cx='12' cy='5' r='1' />"+
// 							                    "<circle cx='12' cy='19' r='1' /></svg>"+
// 														"</button>" +
// 													"</div>" +
												"</div>" +
												"<div class='project-box-content-header'>" +
	// 												<p class="box-content-header">Web Designing</p>
													"<img src='" + data[i].dogFilePath + "' alt='" + data[i].dogFileName + "' id='donation-dog-img' />"+
	// 												<p class="box-content-subheader">Prototyping</p>
													"<p id='donation-dog-name' class='box-content-subheader'>" + 
														"<a href='/dog/detail.dog?dogNo=" + data[i].dogNo + "'>" +
															data[i].dogName +
														"</a>" +
													"</p>"+
												"</div>"+
	// 											"<div class='box-progress-wrapper'>"+
	// 												"<p class='box-progress-header'>Progress</p>"+
	// 												"<div class='box-progress-bar'>"+
	// 													"<span class='box-progress'"+
	// 														"style='width: 60%; background-color: #ff942e'></span>"+
	// 												"</div>" +
	// 												"<p class='box-progress-percentage'>60%</p>" +
	// 											"</div>"+
												"<div class='project-box-footer'>";
	// 												"<div class='participants'>" +
	// 													"<img"+
	// 														"src='https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80'"+
	// 														"alt='participant'> <img" +
	// 														"src='https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60'"+
	// 														"alt='participant'>"+
	// 													"<button class='add-participant' style='color: #ff942e;'>"+
	// 														"<svg xmlns='http://www.w3.org/2000/svg' width='12'"+
	// 															"height='12' viewBox='0 0 24 24' fill='none'"+
	// 															"stroke='currentColor' stroke-width='3'"+
	// 															"stroke-linecap='round' stroke-linejoin='round'"+
	// 															"class='feather feather-plus'>"+
	// 											                "<path d='M12 5v14M5 12h14' />"+
	// 										                "</svg>"+
	// 													"</button>"+
	// 												"</div>" +
													if(data[i].dogAdopt !== 'Y'){
														donationList +=
															"<div class='days-left' style='color: #ff942e;'>" + 
																"안락사 예정일 : " + data[i].dogDeathDate +
															"</div>";
													} else {
														donationList +=
															"<div class='days-left' style='color: #ff942e;'>" + 
																"입양" +
															"</div>";
													}
													donationList +=
														"<div class='days-left' style='color: #ff942e;'>" + 
															"금액 : " + data[i].donationMoney + " 원" +
														"</div>" +
													"</div>" +
												"</div>"+ 
											"</div>";
									$("#donation-dog-box").html(donationList);
								}
							}
							
						} else {
							alert("후원중인 강아지가 없습니다.");
						}
					},
					error : function() {
						alert("ajax 오류, 관리자에게 문의해주세요.");
					}
				});
			}
			
			// 입양, 돌봄 신청중인 신청서 리스트 출력 ajax
			function showAdoptApplicationList() {
				$.ajax({
					url : "/user/myPageAdoptList.dog",
					type : "POST",
					success : function(data){
						if(data !== "false"){
							let appList =
			                    "<div class='board'>" +
			                    "<div class='board-content'>" +
			                    "<table class='table'>" +
			                    "<div class='board-top-content'>" +
			                    "<colgroup>" +
			                    "<col width='5%' />" +
			                    "<col width='35%' />" +
			                    "<col width='10%' />" +
			                    "<col width='10%' />" +
			                    "<col width='5%' />" +
			                    "</colgroup>" +
			                    "<tr>" +
			                    "<th class='number-value'>번호</th>" +
			                    "<th>강아지 이름</th>" +
			                    "<th>신청자</th>" +
			                    "<th>작성일</th>" +
			                    "<th class='number-value'>상태</th>" +
			                    "</tr>";
			
			                for (let i = 0; i < 5; i++) {
			                    appList +=
			                        "<tr>" +
			                        "<td class='number-value'>" + data[i].appNo + "</td>" +
			                        "<td><a href='/dog/detail.dog?dogNo=" + data[i].dogNo + "'>" + data[i].dogName + "</a></td>" +
			                        "<td>" + data[i].userNickname + "</td>" +
			                        "<td>" + data[i].appCreateDate +
			                        "</td>";
			                        if(data[i].appStatus == "Y"){
			                        	appList += "<td class='number-value'>승인</td>";
			                        } else if(data[i].appStatus == "N"){
			                        	appList += "<td class='number-value'>반려</td>";
			                        } else {
			                        	appList += "<td class='number-value'>심사중</td>";
			                        }
			                        appList += "</tr>";
			                }
			
			                $("#app-list-box").html(appList);
						} else {
							alert("입양 신청한 게시물이 없습니다.")
						}
					},
					error : function() {
						alert("ajax 오류, 관리자에게 문의해주세요.");
					}
				});
			}
			
			
			// 좋아요 누른 강아지 리스트 출력 ajax
			function showBoardLikeList(){
				$.ajax({
					url : "/user/myPageLikeList.dog",
					type : "POST",
					success: function(data) {
						if(data !== "false"){
							let likeList = "";
							for(let i = 0; i < data.length; i++){
								likeList +=
									"<div class='dog_item'>" +
										"<div class='image_thumbnail'>" +
											"<img src='" + data[i].dogFilePath + "' " +
												"alt='" + data[i].dogFileName + "'> "+
// 												"onclick='showDogDetail(" + data[i].dogNo + ")'
										"</div>" +
										"<div class='dog_info'>" +
												"<h2>" + 
													"<a href='/dog/detail.dog?dogNo=" + data[i].refDogNo + "'>" +
														data[i].dogName + 
													"</a>" +
												"</h2>" +
											"<p><br>" + data[i].dogKind +" <br>" +
											data[i].dogInfo + "</p>" +
										"</div>" +
									"</div>";
								
							}
							
							$("#like-list-box").html(likeList);
						} else {
							alert("좋아요 한 강아지가 없습니다.");
						}
					},
					error : function() {
						alert("ajax 오류, 관리자에게 문의해주세요.");
					}
				});
			}
			
			// 작성한 게시글 리스트 출력 ajax
			function showBoardList() {
			let currentPage = 1;
			    $.ajax({
			        url: "/user/myPageBoardList.dog",
			        type: "POST",
			        data: { currentPage: currentPage },
			        success: function(data) {
			            if (data !== "false") {
			                let writeList =
			                    "<div class='board'>" +
			                    "<div class='board-content'>" +
			                    "<table class='table'>" +
			                    "<colgroup>" +
			                    "<col width='5%' />" +
			                    "<col width='35%' />" +
			                    "<col width='10%' />" +
			                    "<col width='10%' />" +
			                    "<col width='5%' />" +
			                    "</colgroup>" +
			                    "<tr>" +
			                    "<th class='number-value'>번호</th>" +
			                    "<th>글 제목</th>" +
			                    "<th>작성자</th>" +
			                    "<th>작성일</th>" +
			                    "<th class='number-value'>조회수</th>" +
			                    "</tr>";
			
			                for (let i = 0; i < data.length; i++) {
			                    writeList +=
			                        "<tr>" +
			                        "<td class='number-value'>" + data[i].boardNo + "</td>" +
			                        "<td><a href='/board/detail.dog?boardNo=" + data[i].boardNo + "'>" + data[i].boardTitle + "</a></td>" +
			                        "<td>" + data[i].userNickname + "</td>" +
			                        "<td>" + data[i].createDate +
			                        "</td>" +
			                        "<td class='number-value'>" + data[i].viewCount + "</td>" +
			                        "</tr>";
			                }
			
			                $("#write-list-box").html(writeList);
			            }
			        },
			        error: function () {
			            alert("ajax 오류, 관리자에게 문의해주세요.");
			        },
			    });
			}
			
			
			
			
			
			
			
			
			
			
			

			
			// 비밀번호 유효성 체크
			$(document).ready(function() {
				$("#user-pw-now").on("change", function(){
					var userPw = $("#user-pw-now").val();
					
					$.ajax({
						url : "/user/checkUserPw.dog",
						type : "POST",
						data : {
							userPw : userPw
						},
						success : function(data) {
							if(data === "false"){
								$("#pw-now-msg").text("비밀번호가 일치하지 않습니다.").removeClass("success").addClass("error");
							} else {
								if(userPw == data.userPwVal){
									$("#pw-now-msg").text("비밀번호가 일치합니다.").removeClass("error").addClass("success");
								}
							}
						},
						error : function() {
							alert("ajax 오류, 관리자에게 문의해주세요.");
						}
					});
					
					
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
		
			// 비밀번호 변경 ajax
			$(document).ready(function(){
				$("#update-pw-btn").on("click", function() {
					var userPw = $("#user-pw").val();
					var userPwCk = $("#user-pw-check").val();
					if(userPw != "" && userPwCk != ""){
						if(userPw === userPwCk){
							$.ajax({
								url : "/user/updatePw.dog",
								type : "POST",
								data : {
									userPw : userPw
								},
								success : function(data){
									alert("비밀번호가 변경되었습니다.");
									$("#check-pw-box").show();
									$("#update-pw-box").hide();
									$("#user-pw").val("");
									$("#user-pw-now").val("");
									$("#user-pw-check").val("");
								},
								error : function(){
									alert("ajax 오류, 관리자에게 문의해주세요.");
								}
							});
						} else {
							alert("비밀번호가 다릅니다. 다시 확인 해주세요.");
						}
					} else {
						alert("빈 칸 없이 작성해주세요.");
					}
					
				});
			});
			
			// 비밀번호 변경 시 확인 후 다음 스텝 이동
			$(document).ready(function(){
				$("#check-pw-btn").on("click", function() {
					var checkPwValue = $("#user-pw-now").val();
					var selectRadioBtn = $('input[name="choiceSection"]:checked').val();
					
					if(checkPwValue == "" || checkPwValue == null){
						alert("비밀번호를 다시 확인해주세요.");
					} else {
						$.ajax({
							url : "/user/updateCkPw.dog",
							type : "POST",
							data : {
								userPw : checkPwValue
							},
							success : function(data) {
								if(data === "true"){
									if(selectRadioBtn === "updatePw"){
										alert("확인되었습니다.");
										$("#check-pw-box").hide();
										$("#update-pw-box").show();
									} else if(selectRadioBtn === "deleteUser"){
										confirm("복구가 불가능합니다. 정말 탈퇴하시겠습니까?");
										if(confirm){
											deleteUser();
										} else {
											alert("취소되었습니다.");
										}
									}
								} else {
									alert("비밀번호가 다릅니다. 다시 확인해주세요.");
								}
							},
							error : function(){
								alert("ajax 오류, 관리자에게 문의해주세요.");
							}
						});
					}
				});
			});
			
			// 회원탈퇴 ajax
			function deleteUser() {
				$.ajax({
					url : "/user/deleteUser.dog",
					type : "POST",
					success : function(data) {
						if(data ==="true"){
							alert("회원탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
							location.href = "/user/logout.dog";
						} else {
							alert("회원탈퇴에 실패하였습니다. 다시 시도해주세요.");
						}
					},
					error : function(){
						alert("ajax 오류, 관리자에게 문의해주세요.");
					}
				});
			}
		
			// 체크한 라디오 버튼에 따라 display 변경
			function changeSubSection(selectNum){
				$("#main-sub-section1, #main-sub-section2").hide();
				$("#main-sub-section" + selectNum).show();
			}
			function changeSection2(selectNum){
				$("#my-write-board-box, #my-like-board-box, #my-adopt-subscription-box").hide();
				if(selectNum == "1"){
					$("#my-write-board-box").show();
				} else if(selectNum == "2"){
					$("#my-like-board-box").show();
				} else {
					$("#my-adopt-subscription-box").show();
				}
			}
		
			// 사이드바 아이콘 스크립트
			function switchMainByIcon(mainNum){
				$("#main-section1, #main-section2, #main-section3, #main-section4").hide();
				$("#main-section" + mainNum).show();
				$("#switchIcon1, #switchIcon2, #switchIcon3, #switchIcon4").removeClass("active");
				$("#switchIcon" + mainNum).addClass("active");
			}
			
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
			
	        // 회원 개인정보 불러오기
			function showUserPersnalInfo() {
				var sessionId = "${sessionScope.userId}";
				const userId = $("#user-id");
				const userName = $("#user-name");
				const userNickname = $("#user-nickname");
				const userAddress = $("#user-address");
				const userDetailAddress = $("#user-detail-address");
				const userPhone = $("#user-phone");
				const userEmail = $("#user-email");
				const userProfileImg = $("#profile-image-preview");
				
				$.ajax({
					url : "/user/showPerInf.dog",
					type : "POST",
					data : {
						"userId" : sessionId
					},
					success : function(data) {
						if(data != null && data !== ""){
							userId.attr("value", data.userIdVal);
							userName.attr("value", data.userNameVal);
							userNickname.attr("value", data.userNicknameVal);
							userAddress.attr("value", data.userAddressVal);
							userPhone.attr("value", data.userPhoneVal);
							userEmail.attr("value", data.userEmailVal);
							if(data.userFileRenameVal == "noneProfile"){
								userProfileImg.attr("src", "/img/user/default-profile.png");
							} else {
								userProfileImg.attr("src", "/resources/profileUploadFiles/" + data.userFileRenameVal);
							}
							
						} else {
							alert("유저 정보를 불러오는데 실패하였습니다. 관리자에게 문의해주세요.");
						}
					},
					error : function() {
						alert("ajax 오류, 관리자에게 문의해주세요.");
					}
				});
			}
			
			
			// 개인정보 수정
			$(document).ready(function(){
				$("#next-btn2").on("click", function(event){
					
					event.preventDefault();
	        		
	            	var userIdVal = $("#user-id").val();
// 	            	var userPwVal = $("#user-pw").val();
	            	var userNicknameVal = $("#user-nickname").val();
	            	var userAddressVal = $("#user-address").val();
	            	var userDetailAddressVal = $("#user-detail-address").val();
	            	var userPhoneVal = $("#user-phone").val();
	            	var userFileRename = $("#profile-image-preview").attr("src");
					var subUserFileRename = userFileRename.substring("/resources/profileUploadFiles/".length);
					
	            	var formData = new FormData();
					var fileInput = document.getElementById("profile-image");
					var file = fileInput.files[0];
					
					if (file) {
					    formData.append("uploadFile", file);
					}
	                formData.append("userId", userIdVal);
// 	                formData.append("userPw", userPwVal);
	                formData.append("userNickname", userNicknameVal);
	                formData.append("userAddress", userAddressVal);
	                formData.append("userDetailAddress", userDetailAddressVal);
	                formData.append("userPhone", userPhoneVal);
	                formData.append("userFileRename", subUserFileRename);
	            	
					$.ajax({
						url : "/user/update.dog",
						type : "POST",
						data : formData,
						processData: false,
        	            contentType: false,
						success : function(data){
							if(data === "true"){
								alert("수정 완료");
								showUserPersnalInfo();
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
	        
// 	        $(".user-menu-box > ul > li > a").click(function(e) {
// 	           e.preventDefault();
	  
// 	           // 현재 클릭한 버튼에 대한 하위 메뉴만 열기
// 	           var subMenu = $(this).next('.subMenu').not(':animated');
// 	           subMenu.slideToggle();
	  
// 	           // 다른 모든 하위 메뉴 닫기
// 	           $(".subMenu").not(subMenu).slideUp();
// 	        });
// 			function closeSubMenu() {
// 				$(".subMenu").slideUp();
// 			}
			
// 			$(document).ready(function() {
// 				removeNavClass();
// 				$(".subMenu").slideUp();
// 			});

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
		
		<!-- 풀캘린더 -->
	  	<link href='/vendor/fullcalendar-5/lib/main.css' rel='stylesheet' />
	    <script src='/vendor/fullcalendar-5/lib/main.js'></script>
	    <script>
	      document.addEventListener('DOMContentLoaded', function () {
	        $(function getCalendar() {
	          var request = $.ajax({
	              url: "/calendar/list.dog",
	              method: "GET"
	          });
	
	          request.done(function (data) {
	            console.log(data); // log 로 데이터 찍어주기.
	
	            var calendarEl = document.getElementById('calendar');
	
	            var calendar = new FullCalendar.Calendar(calendarEl, {
	              schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	// 고급 플러그인 무료
	              initialView: 'dayGridMonth',		// 처음 캘린더 형식
	              titleFormat: function (date) {	// 날짜 표시 형식
	                year = date.date.year;
	                month = date.date.month + 1;
	
	                return year + "년 " + month + "월";
	              },
	              headerToolbar: {
	                left: 'prev,next today',
	                center: 'title',
	                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	              },
	              editable: true,
	              droppable: true, // this allows things to be dropped onto the calendar
	              selectable: true,	// 날짜 선택
	              drop: function (arg) {
	                // is the "remove after drop" checkbox checked?
	                if (document.getElementById('drop-remove').checked) {
	                  // if so, remove the element from the "Draggable Events" list
	                  arg.draggedEl.parentNode.removeChild(arg.draggedEl);
	                }
	              },
	              events: data.map(function(event) {
	                return {
	                  title: event.title,
	                  start: event.start,
	                  end: event.end,
	                  backgroundColor: getColorByOption(event.option),	// 옵션값에 따라 배경색 동적 할당
	                  borderColor: getColorByOption(event.option)
	                }
	              }),
	                
	              /**
	               * 드래그로 이벤트 수정하기
	               */
	              eventDrop: function (info){
	                if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){
	
	                var events = new Array(); // Json 데이터를 받기 위한 배열 선언
	                var obj = new Object();
	
	                obj.title = info.event._def.title;
	                obj.start = info.event._instance.range.start;
	                obj.end = info.event._instance.range.end;
	
	                obj.oldTitle = info.oldEvent._def.title;
	                obj.oldStart = info.oldEvent._instance.range.start;
	                obj.oldEnd = info.oldEvent._instance.range.end;
	
	                events.push(obj);
	
	                console.log(events);
	                } else {
	                  updateFullCalendar();
	                }
	                $(function modifyData() {
	                  $.ajax({
	                    url: "/calendar/update.dog",
	                    method: "POST",
	                    data: JSON.stringify(events),
	                    contentType: 'application/json',
	                    success: function (response) {
	                      if(response == "success"){
	                        // 성공적으로 등록되면 부모 창의 함수를 호출하여 메인 페이지의 풀캘린더를 업데이트
	                        getCalendar();
	                        
	                        // 등록 성공 알림
	                        alert('일정 수정 성공');
	                      }
	                    },
	                    error: function (error) {
	                      console.log(error);
	                      // 실패 시에 대한 처리 추가
	                      
	                      // 등록 실패 알림
	                      alert('일정 수정 실패');
	                    }
	                  })
	                })
	              },
	              eventResize: function (info){
	                console.log(info);
	                if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){
	
	                var events = new Array(); // Json 데이터를 받기 위한 배열 선언
	                var obj = new Object();
	
	                obj.title = info.event._def.title;
	                obj.start = info.event._instance.range.start;
	                obj.end = info.event._instance.range.end;
	
	                obj.oldTitle = info.oldEvent._def.title;
	                obj.oldStart = info.oldEvent._instance.range.start;
	                obj.oldEnd = info.oldEvent._instance.range.end;
	
	                events.push(obj);
	
	                console.log(events);
	                } else {
	                  updateFullCalendar();
	                }
	                $(function modifyData() {
	                  $.ajax({
	                    url: "/calendar/update.dog",
	                    method: "POST",
	                    data: JSON.stringify(events),
	                    contentType: 'application/json',
	                    success: function (response) {
	                      if(response == "success"){
	                        // 성공적으로 등록되면 부모 창의 함수를 호출하여 메인 페이지의 풀캘린더를 업데이트
	                        getCalendar();
	                        
	                        // 등록 성공 알림
	                        alert('일정 수정 성공');
	                      }
	                    },
	                    error: function (error) {
	                      console.log(error);
	                      // 실패 시에 대한 처리 추가
	                      
	                      // 등록 실패 알림
	                      alert('일정 수정 실패');
	                    }
	                  })
	                })
	              },
	          
	              /**
	               * 이벤트 선택해서 삭제하기
	               */
	              eventClick: function (info){
	                if(confirm("'"+ info.event.title +"' 일정을 삭제하시겠습니까 ?")){
	                  // 확인 클릭 시
	                  info.event.remove();
	
	                  console.log(info.event);
	                  var events = new Array(); // Json 데이터를 받기 위한 배열 선언
	                  var obj = new Object();
	                  obj.title = info.event._def.title;
	                  obj.start = info.event._instance.range.start;
	                  obj.end = info.event._instance.range.end;
	                  obj.id = info.event._def.defId;
	                  
	                  events.push(obj);
	
	                  console.log(events);
	                }
	                $(function deleteData(){
	                  $.ajax({
	                    url: "/calendar/delete.dog",
	                    method: "POST",
	                    data: JSON.stringify(events),
	                    contentType: 'application/json',
	                    success: function (response) {
	                      if(response == "success"){
	                        // 성공적으로 삭제시 메인 페이지의 풀캘린더를 업데이트
	                        getCalendar();
	                        
	                        // 삭제 성공 알림
	                        alert('일정 삭제 성공');
	                      }
	                    },
	                    error: function (response) {
	                      console.log(error);
	                      // 실패 시에 대한 처리 추가
	                      
	                      // 삭제 실패 알림
	                      alert('일정 삭제 실패');
	                    }
	                  })
	                })
	              },
	              
	              dateClick: function dateClick(info) {
	                // 선택된 날짜 정보를 가져옵니다.
	                var selectedDate = info.date;
	
	                // 날짜를 "YYYY-MM-DD" 형식의 문자열로 변환합니다.
	                var formattedDate = selectedDate.toISOString().split('T')[0];
	
	                // Ajax 요청을 보낼 데이터를 준비합니다.
	                var requestData = {
	                  date: formattedDate
	                };
	
	                // Ajax 요청을 보냅니다.
	                $.ajax({
	                  url: '/calendar/getEventListByDate.dog',
	                  method: 'GET',
	                  data: requestData,
	                  success: function(response) {
	                    // 서버로부터 받은 데이터를 이용하여 이벤트 목록을 업데이트합니다.
	                    getEventListByDate(response);
	                  },
	                  error: function(error) {
	                    console.error('Ajax request failed:', error);
	                  }
	                });
	              },
	              locale: 'ko',
	              // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
	              //
	              // },
	              
	              // url로 이동
	              /* eventClick: function(info) {
	                window.location.href(info.event.url);
	              } */
	            });
	            calendar.render();
	          });
	
	          request.fail(function( jqXHR, textStatus ) {
	            alert( "Request failed: " + textStatus );
	          });
	        });
	      });
	      
	      /* 풀캘린더 리로드 */
	      function updateFullCalendar() {
	        var request = $.ajax({
	          url: "/calendar/list.dog",
	          method: "GET"
	        });
	
	        request.done(function (data) {
	          console.log(data); // log 로 데이터 찍어주기.
	
	          var calendarEl = document.getElementById('calendar');
	
	          var calendar = new FullCalendar.Calendar(calendarEl, {
	            schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	// 고급 플러그인 무료
	            initialView: 'dayGridMonth',		// 처음 캘린더 형식
	            titleFormat: function (date) {	// 날짜 표시 형식
	              year = date.date.year;
	              month = date.date.month + 1;
	
	              return year + "년 " + month + "월";
	            },
	            headerToolbar: {
	              left: 'prev,next today',
	              center: 'title',
	              right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	            },
	            editable: true,
	            droppable: true, // this allows things to be dropped onto the calendar
	            selectable: true,	// 날짜 선택
	            drop: function (arg) {
	              // is the "remove after drop" checkbox checked?
	              if (document.getElementById('drop-remove').checked) {
	                // if so, remove the element from the "Draggable Events" list
	                arg.draggedEl.parentNode.removeChild(arg.draggedEl);
	              }
	            },
	            events: data.map(function(event) {
	              return {
	                title: event.title,
	                start: event.start,
	                end: event.end,
	                backgroundColor: getColorByOption(event.option),	// 옵션값에 따라 배경색 동적 할당
	                borderColor: getColorByOption(event.option)
	              }
	            }),
	              
	            /**
	             * 드래그로 이벤트 수정하기
	             */
	            eventDrop: function (info){
	              if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){
	
	              var events = new Array(); // Json 데이터를 받기 위한 배열 선언
	              var obj = new Object();
	
	              obj.title = info.event._def.title;
	              obj.start = info.event._instance.range.start;
	              obj.end = info.event._instance.range.end;
	
	              obj.oldTitle = info.oldEvent._def.title;
	              obj.oldStart = info.oldEvent._instance.range.start;
	              obj.oldEnd = info.oldEvent._instance.range.end;
	
	              events.push(obj);
	
	              console.log(events);
	              } else {
	                updateFullCalendar();
	              }
	              $(function modifyData() {
	                $.ajax({
	                  url: "/calendar/update.dog",
	                  method: "POST",
	                  data: JSON.stringify(events),
	                  contentType: 'application/json',
	                  success: function (response) {
	                    if(response == "success"){
	                      // 성공적으로 등록되면 부모 창의 함수를 호출하여 메인 페이지의 풀캘린더를 업데이트
	                      getCalendar();
	                      
	                      // 등록 성공 알림
	                      alert('일정 수정 성공');
	                    }
	                  },
	                  error: function (error) {
	                    console.log(error);
	                    // 실패 시에 대한 처리 추가
	                    
	                    // 등록 실패 알림
	                    alert('일정 수정 실패');
	                  }
	                })
	              })
	            },
	            eventResize: function (info){
	              console.log(info);
	              if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){
	
	              var events = new Array(); // Json 데이터를 받기 위한 배열 선언
	              var obj = new Object();
	
	              obj.title = info.event._def.title;
	              obj.start = info.event._instance.range.start;
	              obj.end = info.event._instance.range.end;
	
	              obj.oldTitle = info.oldEvent._def.title;
	              obj.oldStart = info.oldEvent._instance.range.start;
	              obj.oldEnd = info.oldEvent._instance.range.end;
	
	              events.push(obj);
	
	              console.log(events);
	              } else {
	                updateFullCalendar();
	              }
	              $(function modifyData() {
	                $.ajax({
	                  url: "/calendar/update.dog",
	                  method: "POST",
	                  data: JSON.stringify(events),
	                  contentType: 'application/json',
	                  success: function (response) {
	                    if(response == "success"){
	                      // 성공적으로 등록되면 부모 창의 함수를 호출하여 메인 페이지의 풀캘린더를 업데이트
	                      getCalendar();
	                      
	                      // 등록 성공 알림
	                      alert('일정 수정 성공');
	                    }
	                  },
	                  error: function (error) {
	                    console.log(error);
	                    // 실패 시에 대한 처리 추가
	                    
	                    // 등록 실패 알림
	                    alert('일정 수정 실패');
	                  }
	                })
	              })
	            },
	        
	            /**
	             * 이벤트 선택해서 삭제하기
	             */
	            eventClick: function (info){
	              if(confirm("'"+ info.event.title +"' 일정을 삭제하시겠습니까 ?")){
	                // 확인 클릭 시
	                info.event.remove();
	
	                console.log(info.event);
	                var events = new Array(); // Json 데이터를 받기 위한 배열 선언
	                var obj = new Object();
	                obj.title = info.event._def.title;
	                obj.start = info.event._instance.range.start;
	                obj.end = info.event._instance.range.end;
	                obj.id = info.event._def.defId;
	                
	                events.push(obj);
	
	                console.log(events);
	              }
	              $(function deleteData(){
	                $.ajax({
	                  url: "/calendar/delete.dog",
	                  method: "POST",
	                  data: JSON.stringify(events),
	                  contentType: 'application/json',
	                  success: function (response) {
	                    if(response == "success"){
	                      // 성공적으로 삭제시 메인 페이지의 풀캘린더를 업데이트
	                      getCalendar();
	                      
	                      // 삭제 성공 알림
	                      alert('일정 삭제 성공');
	                    }
	                  },
	                  error: function (response) {
	                    console.log(error);
	                    // 실패 시에 대한 처리 추가
	                    
	                    // 삭제 실패 알림
	                    alert('일정 삭제 실패');
	                  }
	                })
	              })
	            },
	            
	            dateClick: function dateClick(info) {
	              // 선택된 날짜 정보를 가져옵니다.
	              var selectedDate = info.date;
	
	              // 날짜를 "YYYY-MM-DD" 형식의 문자열로 변환합니다.
	              var formattedDate = selectedDate.toISOString().split('T')[0];
	
	              // Ajax 요청을 보낼 데이터를 준비합니다.
	              var requestData = {
	                date: formattedDate
	              };
	
	              // Ajax 요청을 보냅니다.
	              $.ajax({
	                url: '/calendar/getEventListByDate.dog',
	                method: 'GET',
	                data: requestData,
	                success: function(response) {
	                  // 서버로부터 받은 데이터를 이용하여 이벤트 목록을 업데이트합니다.
	                  getEventListByDate(response);
	                },
	                error: function(error) {
	                  console.error('Ajax request failed:', error);
	                }
	              });
	            },
	            locale: 'ko',
	            // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
	            //
	            // },
	            
	            // url로 이동
	            /* eventClick: function(info) {
	              window.location.href(info.event.url);
	            } */
	          });
	          calendar.render();
	        });
	
	        request.fail(function( jqXHR, textStatus ) {
	          alert( "Request failed: " + textStatus );
	        });
	      }
		   // 팝업창 열기
		      function openPopup1() {
		        var width = 800;
		        var height = 800;
		        var left = (window.innerWidth - width) / 2;
		        var top = (window.innerHeight - height) / 2;
		        var noticeWin = window.open("/calendar/popup.dog", "Popup", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
		        if (!noticeWin) {
		          alert("팝업이 차단되었습니다. 팝업차단을 해제해주세요.");
		        }
		      }
		    	
		      /* 캘린더 업데이트 되면 캘린더 리로드 */
		      window.addEventListener('updateCalendarEvent', function () {
		          getCalendar();
		        });
		      
		      /* 날짜에 따른 캘린더 정보 가져오기 */
		      function getEventListByDate(events) {
		      	
		     	  $('#calendarList').css('display', 'none');
		        
		    	  console.log("Function called");
		    	  console.log(events);
	
		  	  // id가 'eventList'인 UL 엘리먼트를 가져옵니다.
		        var ulElement = $('#eventList');
		          console.log(ulElement);
	
		  	    // 기존 콘텐츠를 지웁니다.
		        	ulElement.empty();
	
		  	    // 받아온 이벤트 목록을 순회하면서 li 엘리먼트를 생성하고 추가합니다.
		        	events.forEach(function(event, index) {
		  	        // 각 li 엘리먼트에 고유한 id를 만듭니다.
		  	        var liId = 'eventItem_' + index;
		  	
		  	        // 해당 li 엘리먼트를 만듭니다.
		  	        var liElement = $('<li>').attr('id', liId);
		  	
		  	        // 이벤트 정보를 li 엘리먼트에 추가합니다.
		  	        liElement.html('• 제목 : ' + event.title
		  	          + '&emsp;&emsp;&emsp; • 강아지 번호 : ' + event.dogNo
		  	          + '&emsp;&emsp;&emsp; • 강아지 : ' + event.dogName
		  	          + '&emsp;&emsp;&emsp; • 기간 : ' + event.start + ' ~ ' + event.end);
		  	          + '&emsp;&emsp;&emsp; • 내용 : ' + event.content
		  	
		  	        // ul에 li 엘리먼트를 추가합니다.
		  	        ulElement.append(liElement);
		            
		              if (ulElement.children().length > 0) {
		         	      $('#calendarList').css('display', 'block');
		         	    } else {
		         	      $('#calendarList').css('display', 'none');
		         	    }
		        });
		      }
		      
		   	/* 옵션값에 따른 배경색을 동적으로 할당 */
		      function getColorByOption(option) {
		        switch (option) {
		          case '후원':
		            return '#e84545';
		          case '임시보호':
		            return '#3788d8';
		          default:
		            return '#3788d8'; // 기본 값
		        }
		      }
	    </script>
	</body>
</html>