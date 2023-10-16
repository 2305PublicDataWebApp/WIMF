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
			<h1>돌봄 동물 등록</h1><hr>
			<form action="/dog/insert.dog" method="POST" enctype="multipart/form-data">
            <select name="dogRegion" id="dogRegion" class="pl">
                <option value="seoul">서울</option>
                <option value="gyeonggi">경기</option>
                <option value="incheon">인천</option>                
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
	
    // 파일 선택 버튼 1에 이벤트 리스너 추가
    document.querySelector('#image1 input[type="file"]').addEventListener('change', function(event) {
        const selectedFile = event.target.files[0];
        const imageContainer = document.querySelector('#image_container1');

        // 이미지 파일인지 확인
        if (selectedFile && selectedFile.type.startsWith('image')) {
            const reader = new FileReader();

            reader.onload = function() {
                // 선택한 이미지를 미리보기로 표시
                const image = new Image();
                image.src = reader.result;
                imageContainer.innerHTML = ''; // 이미지를 초기화
                imageContainer.appendChild(image);
            };

            reader.readAsDataURL(selectedFile);
        } else {
            // 이미지 파일이 아닌 경우에 대한 처리
            imageContainer.innerHTML = '선택한 파일이 이미지가 아닙니다.';
        }
    });

    // 파일 선택 버튼 2, 3에 대해서도 동일하게 처리
    document.querySelector('#image2 input[type="file"]').addEventListener('change', function(event) {
        const selectedFile = event.target.files[0];
        const imageContainer = document.querySelector('#image_container2');

        // 이미지 파일인지 확인
        if (selectedFile && selectedFile.type.startsWith('image')) {
            const reader = new FileReader();

            reader.onload = function() {
                // 선택한 이미지를 미리보기로 표시
                const image = new Image();
                image.src = reader.result;
                imageContainer.innerHTML = ''; // 이미지를 초기화
                imageContainer.appendChild(image);
            };

            reader.readAsDataURL(selectedFile);
        } else {
            // 이미지 파일이 아닌 경우에 대한 처리
            imageContainer.innerHTML = '선택한 파일이 이미지가 아닙니다.';
        }
    });

    document.querySelector('#image3 input[type="file"]').addEventListener('change', function(event) {
        const selectedFile = event.target.files[0];
        const imageContainer = document.querySelector('#image_container3');

        // 이미지 파일인지 확인
        if (selectedFile && selectedFile.type.startsWith('image')) {
            const reader = new FileReader();

            reader.onload = function() {
                // 선택한 이미지를 미리보기로 표시
                const image = new Image();
                image.src = reader.result;
                imageContainer.innerHTML = ''; // 이미지를 초기화
                imageContainer.appendChild(image);
            };

            reader.readAsDataURL(selectedFile);
        } else {
            // 이미지 파일이 아닌 경우에 대한 처리
            imageContainer.innerHTML = '선택한 파일이 이미지가 아닙니다.';
        }
    });	
	</script>			
	</body>
</html>