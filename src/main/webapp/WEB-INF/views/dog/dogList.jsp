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
			<br>
			<br>
			<br>
			<c:choose>
				<c:when test="${empty category}">
			    전체
			</c:when>
				<c:otherwise>
			    ${foodProductSetList[0].foodProduct.fProductType}
			    </c:otherwise>
			</c:choose>
			<br> <span>전체 돌봄 강아지 수 : ${pInfo.totalCount }</span> <br>
			<br>
			<h1>상품 리스트</h1>
			<br>
			<hr>
			<br>
			<c:if test="${userId eq 'admin' }">
				<button onclick="productRegister();" id="product_register_button" class="custom-btn btn-11">상품등록</button>
			</c:if>
	
			<div class="product_list">
				<!-- 상품 리스트를 반복하여 출력합니다 -->
				<c:forEach var="productSet" items="${foodProductSetList}">
					<div class="product_item">
						<div class="image_thumbnail">
							<img src="${productSet.foodProductFile.fProductFilepath}"
								alt="${productSet.foodProduct.fProductName}"
								onclick="showProductDetail(${productSet.foodProduct.fProductId}, ${productSet.foodProductFile.refFProductId})">
						</div>
						<div class="product_info">
							<h2>${productSet.foodProduct.fProductName}</h2>
							<br> 가격 : ${productSet.foodProduct.fProductPrice}원 <br>
							간단설명 : ${productSet.foodProduct.fProductSimple}
						</div>
					</div>
				</c:forEach>
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
	
		</script>
	</body>
</html>