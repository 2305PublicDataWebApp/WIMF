<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상세 페이지</title>
  <link href="/css/board/communityDetail.css" rel="stylesheet">

  <!-- css -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/vendor/aos/aos.css" rel="stylesheet">

</head>

<body data-bs-spy="scroll" data-bs-target="#navmenu">

  <!-- ======= Header ======= -->
  <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
  
  <!-- ====== Main ====== -->
  <main id="main">
    <div id="container">
      <h3 style="padding-bottom: 2%;">글 상세</h3>
      <div id="board">
        <div id="board-content">
          <div id="borad-subject">
            <tr>
            	<th><a style="font-weight:bold">${board.boardTitle }</a></th>
            </tr>
          </div>
          <div id="borad-writer">
          	<tr>
          		<th><a style="font-weight:bold; color: tomato">작성자 : </a></th>
	      		<th>${board.boardWriter }</th>
	      	</tr>
          </div>
          <div id="borad-create-date">
          	<tr>
          		<th><a style="font-weight:bold; color: tomato">작성일 : </a></th>
	      		<th>
	      			<fmt:formatDate pattern="yyyy-MM-dd a HH:mm:ss" value="${board.createDate }"/>
	      		</th>
	      	</tr>
          </div>
          <div id="borad-deep-content">
            <tr>
            	<th>${board.boardContent }</th>
            </tr>
          </div>
          <div>
            <input id="list-btn" type="submit" value="목록" onClick="location.href='/board/list.dog'">
          </div>
          <div>
            <input id="submit-btn" type="submit" value="수정" onClick="location.href='/board/update.dog?boardNo=${board.boardNo}'">
          </div>
          <div>
            <input id="reset-btn" type="reset" value="삭제" onClick="location.href='/board/delete.dog'">
          </div>
        </div>
      </div>
    </div>
  </main>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	
</body>

</html>