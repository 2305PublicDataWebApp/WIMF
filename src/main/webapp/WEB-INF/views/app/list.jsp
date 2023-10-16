<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8"> 
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>돌봄 입양신청서 리스트</title>
		<link rel="stylesheet" href="/css/app/applicationListStyle.css">
		
		<!-- css -->
	    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	  	<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	  	<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	  	<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	  	<link href="/vendor/aos/aos.css" rel="stylesheet">
	</head>
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<!-- My Code -->
 		<div id="container">
	        <h2>돌봄/입양 희망자 목록</h2>
	
	        <table>
	            <colgroup>
	                <col style="width: 10%">
	                <col style="width: 15%">
	                <col style="width: 15%">
	                <col style="width: 15%">
	                <col style="width: 15%">
	                <col style="width: 15%">
	                <col style="width: 15%">
	            </colgroup>
	            <tr>
	                <th>번호</th>
	                <th>아이디</th>
	                <th>입양동물이름</th>
	                <th>돌봄/입양여부</th>
	                <th>돌봄/입양</th>
	                <th>희망시작일</th>
	                <th>희망종료일</th>
	            </tr>
	            <c:forEach items="${aList}" var="item">
		            <tr onclick="location.href='https://example.com';" style="cursor: pointer;">
		                <td>${item.appNo }</td>
		                <td>${item.userId }</td>
		                <td>멍멍이 이름</td>
		                <c:if test='${item.appStatus.toString() eq "N" }'>
			                <td>반려</td>
		                </c:if>
		                <c:if test='${item.appStatus.toString() eq "W" }'>
			                <td>심사 중</td>
		                </c:if>
		                <c:if test='${item.appStatus.toString() eq "Y" }'>
			                <td>승인</td>
		                </c:if>
		                <c:if test='${item.appDogAdopt.toString() eq "Y" }'>
			                <td>입양</td>
		                </c:if>
		                <c:if test='${item.appDogAdopt.toString() eq "N" }'>
			                <td>돌봄</td>
		                </c:if>
		                <td>${item.appStartDate }</td>
		                <c:if test='${empty item.appEndDate }'>
						    <td>무기한</td>
						</c:if>
		                <c:if test='${not empty item.appEndDate }'>
						    <td>${item.appEndDate }</td>
						</c:if>

		            </tr>
	            </c:forEach>
	        </table>
	        <div aria-label="Page navigation example">
	            <ul class="pagination justify-content-center" style="width: 100%;height: 100px;padding-top: 30px;">
	                <c:if test="${pageInfo.startNavi != 1 }">
	                    <c:url var="pageUrl" value="/app/list.dog">
	                        <c:param name="page" value="${pageInfo.startNavi -1 }"></c:param>
	                    </c:url>
	                    <li class="page-item">
	                        <a style="color: black;" class="page-link" href="${pageUrl }">←</a>
	                    </li>
	                </c:if>
	                <c:forEach begin="${pageInfo.startNavi}" end="${pageInfo.endNavi}" var="p">
	                    <c:url var="pageUrl" value="/app/list.dog">
	                        <c:param name="page" value="${p }"></c:param>
	                    </c:url>
	                    <li class="page-item">
	                        <a style="color: black;" class="page-link" href="${pageUrl }">${p }</a>
	                    </li>
	                </c:forEach>
	                <c:if test="${pageInfo.endNavi != pageInfo.naviTotalCount }">
	                    <c:url var="pageUrl" value="/app/list.dog">
	                        <c:param name="page" value="${pageInfo.endNavi +1 }"></c:param>
	                    </c:url>
	                    <li class="page-item">
	                        <a style="color: black;" class="page-link" href="${pageUrl }">→</a>
	                    </li>
	                </c:if>
	            </ul>
	        </div>
	    </div>
	    
	    <!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />

	</body>
</html>