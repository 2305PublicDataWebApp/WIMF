<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">		
		<title>돌봄 동물 등록</title>
    	<link rel="stylesheet" href="/css/dog/dogInsert.css">		
		<!-- css -->
	    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	  	<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	  	<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	  	<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	  	<link href="/vendor/aos/aos.css" rel="stylesheet">	
		<style>

		</style>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<!-- My Code -->
        <main>
			<h1 id="insert">돌봄 동물 등록</h1><hr>
			<form action="/dog/insert.dog" method="POST" enctype="multipart/form-data">
            <select name="dogRegion" id="dogRegion" class="pl">
                <option value="서울">서울</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>                
            </select>
				<div id="insertForm_container">
					<div id="dateInsert">
						<div><label>안락사 예정일</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="dogDeathDate"></div> 
						<div><label>발견일 </label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="dogRDate"></div>
					</div>
					<br><br>
					<div id="infoInsert">
						<div class="infoInsertContatiner">
							<div class="input_box">
		                        <div class="input_title">
		                            <label>이름</label> 
		                        </div>
		                        <input type="text" id="dogName" name="dogName" placeholder="이름을 입력하세요!"><br><br>
		                    </div>
							<div class="input_box">
		                        <div class="input_title">
		                            <label>품종</label> 
		                        </div>
		                        <input type="text" id="dogKind" name="dogKind" placeholder="품종을 입력하세요!"><br><br>
		                    </div>
							<div class="input_box">
		                        <div class="input_title">
		                            <label>보호소</label> 
		                        </div>
		                        <input type="text" id="dogAgency" name="dogAgency" placeholder="보호소를 입력하세요!"><br><br>
		                    </div>
							<div class="input_box">
		                        <div class="input_title">
		                            <label>나이</label> 
		                        </div>
		                        <input type="text" id="dogAge" name="dogAge" placeholder="나이를 입력하세요!"><br><br>
		                    </div>
							<div class="input_box">
		                        <div class="input_title">
		                            <label>성별</label> 
		                        </div>
		                        <input type="text" id="dogGender" name="dogGender" placeholder="성별을 입력하세요(M/F)"><br><br>
		                    </div>	                    	                    	                    	                    		
						</div>
						<div class="infoInsertContatiner">
							<div class="input_box">
		                        <div class="input_title">
		                            <label>몸무게</label> 
		                        </div>
		                        <input type="text" id="dogWeight" name="dogWeight" placeholder="몸무게를 입력하세요!"><br><br>
		                    </div>	
							<div class="input_box">
		                        <div class="input_title">
		                            <label>성격</label> 
		                        </div>
		                        <input type="text" id="dogPersonality" name="dogPersonality" placeholder="성격을 입력하세요!"><br><br>
		                    </div>
							<div class="input_box">
		                        <div class="input_title">
		                            <label>건강상태</label> 
		                        </div>
		                        <input type="text" id="dogHealth" name="dogHealth" placeholder="건강상태를 입력하세요!"><br><br>
		                    </div>
							<div class="input_box">
		                        <div class="input_title">
		                            <label>구조장소</label> 
		                        </div>
		                        <input type="text" id="dogRLocation" name="dogRLocation" placeholder="구조장소를 입력하세요!"><br><br>
		                    </div>
							<div class="input_box">
		                        <div class="input_title">
		                            <label>추가정보</label> 
		                        </div>
		                        <input type="text" id="dogInfo" name="dogInfo" placeholder="추가정보를 입력하세요!"><br><br>
		                    </div>	  	                    						
						</div>		
					</div>
				<hr><br>								
				</div>

					<div id="image-file-container">
	                    <div id="image1" class="imageFile">
	                        <div id="image_container1" class="image_thumbnail"></div><br>
	                        <div id="image_reg_btn1" class = "image_reg_btn">
	                            <input type="file" id="image1" name="uploadFiles"/>
	                        </div>
	                    </div>
	                    <div id="image2" class="imageFile">
	                        <div id="image_container2" class="image_thumbnail"></div><br>
	                        <div id="image_reg_btn2" class = "image_reg_btn">
	                            <input type="file" id="image2" name="uploadFiles"/>
	                        </div>
	                    </div>
	                    <div id="image3" class="imageFile">
	                        <div id="image_container3" class="image_thumbnail"></div><br>
	                        <div id="image_reg_btn3" class = "image_reg_btn">
	                            <input type="file" id="image3" name="uploadFiles"/>
	                        </div>
	                    </div>
	                </div><br>
				<hr><br>
                <button id="submit-button" class="custom-btn btn-11">제출</button>
			</form>
        </main>
        
        <!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<script>
    document.addEventListener('DOMContentLoaded', function () {
        var submitButton = document.getElementById('submit-button');

        submitButton.addEventListener('click', function () {
            window.location.href = '/dog/insert.dog';
        });
    });	
	
		// 강아지 파일 등록 썸네일 표시 함수
	   function handleFileSelection(inputSelector, containerSelector) {
	       // 파일 선택 버튼과 이미지 컨테이너를 선택합니다.
	       const fileInput = document.querySelector(inputSelector);
	       const imageContainer = document.querySelector(containerSelector);
	
	       // 파일 선택 버튼에 'change' 이벤트 리스너를 추가합니다.
	       fileInput.addEventListener('change', function(event) {
	           // 선택한 파일을 가져옵니다.
	           const selectedFile = event.target.files[0];
	
	           // 선택한 파일이 이미지인지 확인합니다.
	           if (selectedFile && selectedFile.type.startsWith('image')) {
	               // FileReader 객체를 생성합니다.
	               const reader = new FileReader();
	
	               // FileReader가 파일을 읽고 완료했을 때 실행할 함수를 정의합니다.
	               reader.onload = function() {
	                   // 이미지 엘리먼트를 생성하고 이미지 소스를 설정합니다.
	                   const image = new Image();
	                   image.src = reader.result;
	
	                   // 이미지 컨테이너를 초기화하고 이미지를 추가합니다.
	                   imageContainer.innerHTML = '';
	                   imageContainer.appendChild(image);
	               };
	
	               // 선택한 파일을 데이터 URL로 읽습니다.
	               reader.readAsDataURL(selectedFile);
	           } else {
	               // 이미지가 아닌 경우에 대한 처리: 에러 메시지를 이미지 컨테이너에 표시합니다.
	               imageContainer.innerHTML = '선택한 파일이 이미지가 아닙니다.';
	           }
	       });
	   }
	
	   // 각 파일 선택 버튼과 이미지 컨테이너에 handleFileSelection 함수를 적용합니다.
	   handleFileSelection('#image1 input[type="file"]', '#image_container1');
	   handleFileSelection('#image2 input[type="file"]', '#image_container2');
	   handleFileSelection('#image3 input[type="file"]', '#image_container3');

	</script>			
	</body>
</html>