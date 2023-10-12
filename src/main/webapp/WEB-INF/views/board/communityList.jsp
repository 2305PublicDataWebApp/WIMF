<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WIMF - Where Is My Family?</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/img/favicon.png" rel="icon">
  <link href="/img/apple-touch-icon.png" rel="apple-touch-icon">

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
  <link href="/css/board/communityList.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Append
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/append-bootstrap-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="index-page" data-bs-spy="scroll" data-bs-target="#navmenu">

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">
    <div class="container-fluid d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center me-auto me-xl-0">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>WIMF</h1>
        <span>.</span>
      </a>

      <!-- Nav Menu -->
      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="index.html#hero" class="active">Home</a></li>
          <li><a href="index.html#team">돌봄 대기리스트</a></li>
          <li class="dropdown has-dropdown"><a href="blog.html"><span>입양</span> <i class="bi bi-chevron-down"></i></a>
            <ul class="dd-box-shadow">
              <li><a href="#">돌봄 후기</a></li>
              <li><a href="#">입양 후기</a></li>
              <li><a href="#">입양지원서</a></li>
            </ul>
          </li>
          <li><a href="/board/list.dog">소통 게시판</a></li>
          <li><a href="index.html#services">임시보호란?</a></li>
          <li><a href="index.html#about">WIMF 팀 소개</a></li>
          <li><a href="index.html#contact">Contact</a></li>
        </ul>

        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav><!-- End Nav Menu -->

      <a class="btn-getstarted" href="index.html#about">Login</a>

    </div>
  </header><!-- End Header -->
  <main id="main">
    <div id="container">
      <h3 style="padding-bottom: 2%;">소통 게시판</h3>
      <div id="board">
        <div id="board-content">
          <table class="table">
            <div id="board-top-content">
              <div id="select">
                <select>
                  <option>전체</option>
                  <option>작성자</option>
                  <option>제목</option>
                  <option>내용</option>
                </select>
              </div>
              <div id="search">
                <input id="search-value" type="text" placeholder="Search">
              </div>
              <div id="search-btn">
                <input id="search-btn" type="button" value="검색">
              </div>
            </div>
            <colgroup>
              <col width="5%" />
              <col width="35%" />
              <col width="10%" />
              <col width="10%" />
              <col width="5%" />
            </colgroup>
            <tr>
              <th id="number-value">번호</th>
              <th>글 내용</th>
              <th>작성자</th>
              <th>작성일</th>
              <th id="number-value">조회수</th>
            </tr>
            <c:forEach var="board" items="${bList }" varStatus="i">
	            <tr>
	              <td id="number-value">${i.count }</td>
	              <c:url var="detailUrl" value="/board/detail.dog">
	              	<c:param name="boardNo" value="${board.boardNo }"></c:param>
	              </c:url>
	              <td><a href="${detailUrl }">${board.boardTitle }</a></td>
	              <td>${board.userId }</td>
	              <td>
	              	<fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd"/>
	              </td>
	              <td id="number-value">${board.viewCount }</td>
	            </tr>
            </c:forEach>
            </table>
          <div id="create-btn">
            <input id="create-btn" type="button" value="글 작성" onClick="location.href='/board/write.dog'">
          </div>
        </div>
      </div>
    </div>
  </main>


  <!-- Scroll Top Button -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader">
    <div></div>
    <div></div>
    <div></div>
    <div></div>
  </div>

  <!-- Vendor JS Files -->
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/vendor/aos/aos.js"></script>
  <script src="/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/js/main.js"></script>

</body>

</html>