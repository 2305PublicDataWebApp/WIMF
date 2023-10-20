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
		<title>돌봄, 입양 후기 작성</title>
		<link href="/css/adopt/communityInsert.css" rel="stylesheet">
		
		<!-- css -->
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
		<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
		<link href="/vendor/aos/aos.css" rel="stylesheet">
			
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	</head>
	
	<body data-bs-spy="scroll" data-bs-target="#navmenu">
	
		<!-- ======= Header ======= -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<main id="main">
			<div id="container">
				<h3 style="padding-bottom: 2%;">돌봄, 입양 후기 작성</h3>
				<div id="board">
					<form action="/adopt/write.dog" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
						<div id="board-content">
							<div id="board-subject">
								<input id="board-subject-value" type="text" name="adoptTitle" placeholder="제목">
							</div><br>
		                    <div class="radio-group" >
								<b style="display:inline; width: 100%"> 돌봄/입양 : </b>
		                        <input type="radio" id="dog-care" name="adoptType" value="care" >
		                        <label for="dog-care">돌봄</label>
		                        <input type="radio" id="dog-adopt" name="adoptType" value="adopt">
		                        <label for="dog-adopt">입양</label>
		                    </div><br>
							<div id="adopt-date-section" style="display:inline; width: 100%">
						        <label for="adopt-date" style="display:inline">데려온 날 : </label><input id="adopt-date" type="date" name="adoptDate" >
							    <div id="care-date-section"style="display:none; width: 100%">
							        <label for="giveup-date" style="display:inline"> ~ 돌봄 종료일 : </label><input id="giveup-date" type="date" name="giveUpDate">
							    </div>
						    </div>
						    <br><br>
						    <div style="width: 100%">
	    						<b style="display:inline">첨부파일 : </b>
								<!-- String으로 받을 수 없고 변환 작업이 필요 -->
								<input type="file" name="uploadFile" style="display:inline">
						    </div><br>
							<textarea id="summernote" name="adoptContent"></textarea>
							<div>
								<input id="submit-btn" type="submit" value="등록">
							</div>
							<div>
								<input id="reset-btn" type="reset" value="취소" onClick="location.href='/adopt/list.dog'">
							</div>
						</div>
					</form>
				</div>
			</div>
		</main>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		
		<script>
			const careDateSection = document.getElementById("care-date-section");
			const careRadio = document.getElementById("dog-care");
			const adoptRadio = document.getElementById("dog-adopt");
			
			// 돌봄 선택시
            careRadio.addEventListener("change", function() {
            	careDateSection.style.display = "inline";
            });
			
         	// 입양 선택시
            adoptRadio.addEventListener("change", function() {
            	careDateSection.style.display = "none";
            	 document.getElementById("giveup-date").value = "";
            });
			
			
            function validateForm() {
                const title = document.getElementById("board-subject-value").value;
                const adoptDate = document.getElementById("adopt-date").value;
                const content = document.getElementById("summernote").value;
                const adoptType = document.getElementsByName("adoptType");
                const giveupDate = document.getElementById("giveup-date").value;
                const currentDate = new Date();

                if (!adoptType[0].checked && !adoptType[1].checked) {
                    alert("돌봄/입양 유형을 선택해주세요!");
                    return false;
                } else if (title.trim() === "" || content.trim() === "") {
                    alert("제목과 내용을 모두 입력해주세요");
                    return false;
                } else if (adoptType[0].checked) {
                    if (!adoptDate || !giveupDate) {
                        alert("돌봄 시작일과 돌봄 종료일을 모두 입력해주세요");
                        return false;
                    } else if (currentDate <= new Date(adoptDate) || currentDate <= new Date(giveupDate)) {
                        alert("돌봄 시작일과 돌봄 종료일은 과거 날짜만 입력할 수 있습니다.");
                        return false;
                    } else if (new Date(giveupDate) <= new Date(adoptDate)) {
                        alert("돌봄 시작일이 돌봄 종료일 보다 과거날짜여야 합니다.");
                        return false;
                    } else {
    	                return true;
                    }
                } else if (adoptType[1].checked) {
                    if (!adoptDate) {
                        alert("입양일을 입력해주세요");
                        return false;
                    } else if (currentDate <= new Date(adoptDate)) {
                        alert("입양일은 과거날짜만 입력할 수 있습니다.");
                        return false;
                    } else {
    	                return true;
                    }
                }
            }

			
			$('#summernote').summernote({
				toolbar: [
				    // [groupName, [list of button]]
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']]
				  ],
				height: 400,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
		    	placeholder: "내용을 입력하세요",
				lang: "ko-KR",				 // 한글 설정
				
			});
		</script>
	</body>

</html>