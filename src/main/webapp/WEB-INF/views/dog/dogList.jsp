<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>돌봄 동물 리스트</title>
		<!-- css -->
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
		<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
		<link href="/vendor/aos/aos.css" rel="stylesheet">
		<link rel="stylesheet" href="/css/dog/dogList.css">
		<style>
		</style>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
		<!-- My Code -->
		<main>				
			${region }		
			<br> <span>돌봄 강아지 수 : ${pInfo.totalCount }</span> <br>
			<form action="/dog/list.dog" method="get">
			  <label for="region">지역 선택:</label>
			  <select name="region" id="region">
			    <option value="all">전체</option>
			    <option value="서울">서울</option>
			    <option value="경기">경기</option>
			    <option value="인천">인천</option>
			  </select>
			
			  <label for="sort">정렬:</label>
			  <select name="sort" id="sort">
			    <option value="latest">최신 등록 순</option>
			    <option value="euthanasia">안락사 임박 순</option>
			  </select>
			
			  <input type="submit" value="적용">
			</form>			
		
			<br>
			<br>
			<h1>강아지 리스트</h1>
			<br>
			<hr>
			<br>
			<c:if test="${adminCheck eq 'Y' }">					
				<button onclick="location.href='/dog/insert.dog';" style="cursor: pointer;">강아지 등록</button>						
			</c:if>

			<div class="dog_list">
				
				<c:forEach var="combinedList" items="${combinedList}">
					<div class="dog_item">
						<div class="image_thumbnail">
							<img src="${combinedList.dogFile.dogFilePath}"
								alt="${combinedList.dogFile.dogFileName}"
								onclick="showDogDetail(${combinedList.dog.dogNo})">
						</div>
						<div class="dog_info">
							<h2>${combinedList.dog.dogName }</h2>
							<p><br>${combinedList.dog.dogKind } <br>
							${combinedList.dog.dogInfo}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="searchDog">
			    <input type="text" id="searchInput" name="searchInput" placeholder="강아지 이름을 검색해보세요!">
			    <button id="searchButton">검색</button>
			</div>
			
			
			<div class="pagination">
				<c:if test="${ pInfo.startNavi != 1 }">
					<c:url var="prevUrl" value="/dog/list.dog">
						<c:param name="page" value="${ pInfo.startNavi - 1 }"></c:param>
						<c:if test="${not empty category}">
							<c:param name="category" value="${category}" />
						</c:if>
					</c:url>
					<a href="${prevUrl}">[이전]</a>
				</c:if>
				<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}" var="p">
					<c:url var="pageUrl" value="/dog/list.dog">
						<c:param name="page" value="${p}"></c:param>
						<c:if test="${not empty category}">
							<c:param name="category" value="${category}" />
						</c:if>
					</c:url>
					<a href="${pageUrl}">${p}</a>&nbsp;
			</c:forEach>
				<c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
					<c:url var="nextUrl" value="/dog/list.dog">
						<c:param name="page" value="${pInfo.endNavi + 1 }"></c:param>
						<c:if test="${not empty category}">
							<c:param name="category" value="${category}" />
						</c:if>
					</c:url>
					<a href="${nextUrl}">[다음]</a>
				</c:if>		
			</div>	
		</main>
	
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<script>
	      function showDogDetail(dogNo) {    	    	    	       	       
	    	        var url = "/dog/detail.dog?dogNo=" + dogNo;
	    	        window.location.href = url;	    	    
	    	}	

	      document.getElementById('searchButton').addEventListener('click', function () {
	          var searchInput = document.getElementById('searchInput').value;
	          var url = '/dog/list.dog?searchInput=' + searchInput;
	          window.location.href = url;
	      });	      
		</script>
	</body>
</html>