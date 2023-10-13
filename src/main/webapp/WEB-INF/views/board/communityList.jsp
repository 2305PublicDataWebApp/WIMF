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
</head>

<body class="index-page" data-bs-spy="scroll" data-bs-target="#navmenu">

  <!-- ======= Header ======= -->
  <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
  
  <!-- ====== Main ====== -->
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
              <th>글 제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th id="number-value">조회수</th>
            </tr>
            <c:forEach var="board" items="${bList }">
	            <tr>
	              <td id="number-value">${board.boardNo }</td>
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
            <div id="paging">
	        	<tr align="center">
	          	<td colspan="5">
	          		<c:if test="${bpInfo.startNavi != 1}">
	          			<c:url var="prevUrl" value="/board/list.dog">
	          				<c:param name="page" value="${bpInfo.startNavi - 1 }"></c:param>
	          			</c:url>
	          			<a href="${prevUrl }">◀</a>
	          		</c:if>
	          		<c:forEach begin="${bpInfo.startNavi }" end="${bpInfo.endNavi }" var="p">
	          			<c:url var="pageUrl" value="/board/list.dog">
	          				<c:param name="page" value="${p }"></c:param>
	          			</c:url>
	          			<a href="${pageUrl }">${p }</a>&nbsp;
	          		</c:forEach>
	          		<c:if test="${bpInfo.endNavi != bpInfo.naviTotalCount}">
						<c:url var="nextUrl" value="/board/list.dog">
							<c:param name="page" value="${bpInfo.endNavi + 1 }"></c:param>
						</c:url>          		
	          			<a href="${nextUrl }">▶</a>
	          		</c:if>
	          	</td>
	          </tr>
            </div>
          <div id="create-btn">
            <input id="create-btn" type="button" value="글 작성" onClick="location.href='/board/write.dog'">
          </div>
        </div>
      </div>
    </div>
  </main>
  
  <!-- footer -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>


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