<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>지도</title>
		<link rel="stylesheet" href="/css/map/map.css">
		
		<!-- css -->
	    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	  	<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	  	<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	  	<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	  	<link href="/vendor/aos/aos.css" rel="stylesheet">
	</head>
	<body>
		<!-- ======= Header ======= -->
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
			
	
		<!-- 메인 -->
	    <main>
	        <div id="map" style="width: 100%; height: 90vh; margin: 100px auto 0px auto;"></div>
	    </main>
	    
	     <!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d52709ffacc68e58aa4c5df1743f8ea&libraries=services" ></script>
		<script>
		    // Kakao Maps SDK가 로드된 후에 실행되도록 이벤트 리스너를 추가합니다.
		    window.addEventListener('load', function () {
		        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		        var mapOption = {
		            center: new kakao.maps.LatLng(37.55909, 126.97717), // 지도의 중심좌표
		            level: 8, // 지도의 확대 레벨
		        };  
		        
		        // 지도를 생성합니다    
		        var map = new kakao.maps.Map(mapContainer, mapOption);
		        
		        // 지도에 확대 축소 컨트롤을 생성한다
		        var zoomControl = new kakao.maps.ZoomControl();
		
		        // 지도의 우측에 확대 축소 컨트롤을 추가한다
		        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		        
		        // 마커 이미지의 주소
		        var markerImageUrl = '/map/marker.png';
		        var markerImageSize = new kakao.maps.Size(40, 42); // 마커 이미지의 크기
		        var markerImageOptions = {
		            offset: new kakao.maps.Point(19, 43) // 마커 좌표에 일치시킬 이미지 안의 좌표
		        };
		        
		        // 마커 이미지를 생성합니다
		        var markerImage = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
		        
		        // 주소-좌표 변환 객체를 생성합니다
		        var geocoder = new kakao.maps.services.Geocoder();
		        
		        // 주소와 장소 이름을 포함한 배열
		        var locations = [];
		        
		        // dList 배열에 저장된 dogRLocation 및 dogName 추가
		        <c:forEach items="${combinedList}" var="combinedList">
		            locations.push({
		                address: '<c:out value="${combinedList.dog.dogRLocation}" />',
		                name: '<c:out value="${combinedList.dog.dogName}" />',
		                no: '<c:out value="${combinedList.dog.dogNo}" />',
		                path: '<c:out value="${combinedList.dogFile.dogFilePath}" />'
		            });
		        </c:forEach>
		        
		        // 각 주소에 대한 좌표를 검색하고 마커를 표시합니다.
		        locations.forEach(function (location) {
		            geocoder.addressSearch(location.address, function (result, status) {
		                if (status === kakao.maps.services.Status.OK) {
		                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		                    var marker = new kakao.maps.Marker({
		                        map: map,
		                        image: markerImage,
		                        position: coords
		                    });

		                    // 마커를 클릭했을 때 이벤트 핸들러를 추가합니다.
		                    var overlayVisible = false; // 오버레이의 표시 여부를 추적하는 변수
		                    kakao.maps.event.addListener(marker, 'click', function() {
		                    	 console.log("Marker clicked!"); // 클릭 이벤트가 발생했는지 확인
		                    	    console.log("Overlay visibility: " + overlayVisible); // 오버레이 상태를 확인
		                        // 오버레이가 표시 중이면 숨깁니다.
		                        if (overlayVisible) {
		                            overlay.setMap(null);
		                            overlayVisible = false;
		                        } else { // 오버레이가 숨겨져 있으면 표시합니다.
		                            overlay.setMap(map);
		                            overlayVisible = true;
		                        }
		                    });

		                    // 커스텀 오버레이를 생성하고 컨텐츠를 설정합니다.
		                    var content = '<div id="customoverlay" class="customoverlay">' +
				                        '      <a href="/dog/detail.dog?dogNo='+location.no +'" target="_blank">' +
				                        '          <span class="title">' +
				                        '              <div id="dogImg"class="img">' +
				                        '                  <img src="' + location.path +'" width="73" height="70">' +
				                        '              </div>' +
				                        			location.name + 
			                        	'          </span>' +
				                        '      </a>' +
				                        '</div>';
		                    var overlay = new kakao.maps.CustomOverlay({
		                        content: content,
		                        map: null, // 초기에는 지도에 표시하지 않음
		                        position: marker.getPosition()
		                    });
		                } else {
		                    console.log('주소 검색 실패: ' + status);
		                }
		            });
		        });
		    });
		</script>
	</body>
</html>