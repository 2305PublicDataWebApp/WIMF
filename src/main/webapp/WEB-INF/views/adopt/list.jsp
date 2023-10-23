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
		<title>입양 후기 게시판</title>
		<link href="/css/adopt/communityList.css" rel="stylesheet">
		<link href="/css/main.css" rel="stylesheet">
		
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
				<h3 style="padding-bottom: 2%;">
					<c:if test="${adoptType == 'adopt'}">입양</c:if>
			    	<c:if test="${adoptType == 'care'}">돌봄</c:if>
					후기 게시판
				</h3>
				<div id="board">
					<div id="board-content">
						<div id="board-top-content">
							<form action="/adopt/search.dog" method="get">
								<input type="hidden" name="adoptType" 	value="${adoptType }">
								<div id="select">
									<select name="searchCondition">
										<option value="all">전체</option>
										<option value="writer">작성자</option>
										<option value="title">제목</option>
									</select>
								</div>
								<div id="search">
									<input id="search-value" type="text" name="searchKeyword" placeholder="Search">
								</div>
								<div id="search-btn">
									<input id="search-btn" type="submit" value="검색">
								</div>
							</form>
						</div>
						
<!-- 						<table class="table"> -->
<%-- 							<colgroup> --%>
<%-- 								<col width="5%" /> --%>
<%-- 								<col width="35%" /> --%>
<%-- 								<col width="10%" /> --%>
<%-- 								<col width="10%" /> --%>
<%-- 								<col width="5%" /> --%>
<%-- 							</colgroup> --%>
<!-- 							<tr> -->
<!-- 								<th id="number-value">번호</th> -->
<!-- 								<th>글 제목</th> -->
<!-- 								<th>작성자</th> -->
<!-- 								<th>작성일</th> -->
<!-- 								<th id="number-value">조회수</th> -->
<!-- 							</tr> -->
<%-- 							<c:forEach var="adopt" items="${aList }"> --%>
<!-- 								<tr> -->
<%-- 									<td id="number-value">${adopt.adoptNo }</td> --%>
<%-- 									<c:url var="detailUrl" value="/adopt/detail.dog"> --%>
<%-- 										<c:param name="adoptNo" value="${adopt.adoptNo }"></c:param> --%>
<%-- 									</c:url> --%>
<%-- 									<td><a href="${detailUrl }">${adopt.adoptTitle }</a></td> --%>
<%-- 									<td>${adopt.userNickName }</td> --%>
<!-- 									<td> -->
<%-- 										<fmt:formatDate value="${adopt.adoptCreateDate }" pattern="yyyy-MM-dd"/> --%>
<!-- 									</td> -->
<%-- 									<td id="number-value">${adopt.viewCount }</td> --%>
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
<!-- 						</table> -->
						
						<div class="recent-posts container row gy-4">
							<c:forEach var="aList" items="${aList}">
								<div class="col-xl-4 col-md-6" >
								<article>
									<div class="post-img">
										<c:if test="${aList.adoptFilePath == null}">
											<a href="/adopt/detail.dog?adoptNo=${aList.adoptNo}">
												<img src="/img/user/default-profile.png" alt="후기게시판사진" class="img-fluid">
											</a>
										</c:if>
										<c:if test="${aList.adoptFilePath != null}">
											<a href="/adopt/detail.dog?adoptNo=${aList.adoptNo}">
												<img src="${aList.adoptFilePath }" alt="후기게시판사진" class="img-fluid">
											</a>
										</c:if>
									</div>
									<div style="display:inline;">
										<c:if test="${aList.adoptType == 'care'}">
											<p class="post-category">돌봄 후기</p>
										</c:if>
										<c:if test="${aList.adoptType == 'adopt'}">
											<p class="post-category">입양 후기</p>
										</c:if>
										<p class="post-category">조회수 ${aList.viewCount }</p>
									</div>
									<c:url var="detailUrl" value="/adopt/detail.dog">
										<c:param name="adoptNo" value="${aList.adoptNo }"></c:param>
									</c:url>
									<h2 class="title">
										<a href="${detailUrl }">${aList.adoptTitle }</a>
									</h2>
									
									<div class="d-flex align-items-center">
										<img src = "${aList.userFilePath }"alt="프로필사진" class="img-fluid post-author-img flex-shrink-0">
										<div class="post-meta">
											<p class="post-author">${aList.userNickName }</p>
											<p class="post-date">
												<fmt:formatDate value="${aList.adoptDate }" pattern="yyyy-MM-dd"/>~
												<fmt:formatDate value="${aList.giveUpDate }" pattern="yyyy-MM-dd"/>
									        </p>
										</div>
									</div>
								</article>
								</div><!-- End post list item -->
							</c:forEach>
						</div>
						
						<div id="paging">
							<div align="center">
								<c:if test="${bpInfo.startNavi != 1}">
									<c:url var="prevUrl" value="/adopt/list.dog?adoptType=${adoptType }">
										<c:param name="page" value="${bpInfo.startNavi - 1 }"></c:param>
									</c:url>
									<a href="${prevUrl }">◀</a>
								</c:if>
								<c:forEach begin="${bpInfo.startNavi }" end="${bpInfo.endNavi }" var="p">
									<c:url var="pageUrl" value="/adopt/list.dog?adoptType=${adoptType }">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<a href="${pageUrl }">${p }</a>&nbsp;
								</c:forEach>
								<c:if test="${bpInfo.endNavi != bpInfo.naviTotalCount}">
									<c:url var="nextUrl" value="/adopt/list.dog?adoptType=${adoptType }">
										<c:param name="page" value="${bpInfo.endNavi + 1 }"></c:param>
									</c:url>          		
									<a href="${nextUrl }">▶</a>
								</c:if>
							</div>
						</div>
						
						<div id="create-btn">
							<input id="create-btn" type="button" value="글 작성" onClick="checkLogin()">
						</div>
					</div>
				</div>
			</div>
		</main>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		
		<script>
			function checkLogin(){
				var sessionId = "${sessionScope.userId}";
				
				if(sessionId === null || sessionId === ""){
					alert("글작성을 하려면 로그인이 필요합니다");
					window.location.href="/user/login.dog";
				}else{
					window.location.href="/adopt/write.dog";
				}
			}
		</script>
	
	</body>
</html>