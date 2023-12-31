<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="/css/header.css" rel="stylesheet">
	</head>
	<body>
		<!-- ======= Header ======= -->
		<header id="header" class="header fixed-top d-flex align-items-center">
			<div
				class="container-fluid d-flex align-items-center justify-content-between">
	
				<a href="/" class="logo d-flex align-items-center me-auto me-xl-0">
					<!-- Uncomment the line below if you also wish to use an image logo -->
					<!-- <img src="assets/img/logo.png" alt=""> -->
					<h1>WIMF</h1> <span>.</span>
				</a>
	
				<!-- Nav Menu -->
				<nav id="navmenu" class="navmenu">
					<ul>
						<li><a href="/#hero" id="nav-home" class="active">Home</a></li>
						<li><a href="/dog/list.dog#team" id="nav-dolbom-list">돌봄 리스트</a></li>
						<li><a href="/board/list.dog#testimonials" id="nav-board-list">소통 게시판</a></li>
						<li class="dropdown has-dropdown">
							<a href="/adopt/list.dog#recent-posts" id="nav-adopt">
								<span>후기</span>
								<i class="bi bi-chevron-down"></i>
							</a>
							<ul class="dd-box-shadow">
								<li><a href="/adopt/list.dog?adoptType=care" id="nav-dolbom-list-review">돌봄 후기</a></li>
								<li><a href="/adopt/list.dog?adoptType=adopt" id="nav-adopt-review">입양 후기</a></li>
							</ul>
						</li>
<!-- 						<li class="dropdown has-dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down"></i></a> -->
<!-- 							<ul class="dd-box-shadow"> -->
<!-- 								<li><a href="#">Deep Dropdown 1</a></li> -->
<!-- 								<li><a href="#">Deep Dropdown 2</a></li> -->
<!-- 								<li><a href="#">Deep Dropdown 3</a></li> -->
<!-- 								<li><a href="#">Deep Dropdown 4</a></li> -->
<!-- 								<li><a href="#">Deep Dropdown 5</a></li> -->
<!-- 							</ul> -->
<!-- 						</li> -->
						<li><a href="/#services" id="nav-sevice">임시보호란?</a></li>
						<li><a href="/#about" id="nav-about">WIMF 팀 소개</a></li>
						<li><a href="/#contact" id="nav-Contact">Contact</a></li>
						<li><a href="/map/map.dog" id="nav-Contact">구조위치</a></li>
					</ul>
	
					<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
				</nav>
				<!-- End Nav Menu -->
				<div id="user-info-div">
					<c:if test="${sessionScope.userId eq null}">
						<a class="btn-getstarted" href="/user/login.dog">Login</a>				
					</c:if>
					<c:if test="${sessionScope.userId ne null}">
						<div id="session-id">${sessionScope.userNickname } 님</div>
						<div class="register-btn space">
							<c:if test="${sessionScope.userId ne 'admin' }">
								<button class="mypage-btn" onclick="location.href='/user/myPage.dog?userId=${sessionScope.userId}'">My page</button>
							</c:if>
							<c:if test="${sessionScope.userId eq 'admin' }">
								<button class="mypage-btn" onclick="location.href='/app/list.dog'">Admin page</button>
							</c:if>
						</div>
						<a class="btn-getstarted" href="/user/logout.dog">Logout</a>
					</c:if>
				</div>
	
			</div>
		</header>
		<!-- End Header -->
	
	</body>
</html>