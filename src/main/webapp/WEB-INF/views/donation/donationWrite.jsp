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
  <title>후원 페이지</title>
  <link href="/css/donation/donationWrite.css" rel="stylesheet">
  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
		<h3 style="padding-bottom: 2%;">유기견 후원</h3>
		<div id="board">
			<div id="board-content">
				<div id="center-content">
				</div>
				<div id="left-content">
					<div id="dog-info" style="padding-top: 5%;">
						<input type="hidden" name="dogNo" id="donationDogNo" value=${dog.dogNo }>
						<div id="image_thumbnail" class="donation-dog-box">
							<img src="${dogFileList[0].dogFilePath }" alt="${dogFileList[0].dogFileName }" style="border-radius: 80px;">
						</div>
						<div id="donation-dog-name" class="donation-dog-box">
							<label for="donationDogName" style="margin-bottom: 5%">강아지 이름</label>
							<input type="text" name="dogName" value="${dog.dogName }" class="leftContent" id="dogName" readonly>
						</div>
						<div style="width: 65%; margin: 0 auto;">
							<label style="margin-bottom: 5%">${dog.dogName } 총 후원 금액</label><br/>
							<div id="donationAmount"></div>
						</div>
						<div class="progress" style="width: 65%; height: 35px; font-size: 15px; font-weight: bold; margin: 0 auto;">
							<div id="progress-bar" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="100" aria-valuemax="100" style="width: 100%;"></div>
						</div>
					</div>
				</div>
				<div id="right-content">
					<div id="user-info">
						<input type="hidden" name="donationUser" id="donationUser" value="${user.userId }">
						<div id="donation-user-info" class="donation-info-box">
							<label for="donationUserName" style="margin-bottom: 2%">후원자</label>
							<input type="text" name="userName" class="rightContent" value="${user.userName }" readonly>
						</div>
						<div id="donation-user-phone" class="donation-info-box">
							<label for="donationUserPhone" style="margin-bottom: 2%">전화번호</label>
							<input type="text" name="userPhone" class="rightContent" value="${user.userPhone }" readonly>
						</div>
						
						<form action="/donation/money.dog" method="get">
							<div id="donation-money" class="donation-info-box">
								<label for="donationMoney" style="margin-bottom: 2%">후원금액</label>
								<input type="text" id="total" value="" placeholder="원" class="rightContent" name="pay">
							</div>
							<div id="donation-money-btn" class="donation-info-box-money">
							    <label for="price1"></label>
							    <input type="button" name="price1" id="price1" value="+1만" style="width: 15%; margin-left: 2px">
							    <label for="price2"></label>
							    <input type="button" name="price2" id="price2" value="+3만" style="width: 15%">
							    <label for="price3"></label>
							    <input type="button" name="price3" id="price3" value="+5만" style="width: 15%">
							    <label for="reset"></label>
							    <input type="reset" name="reset" id="reset" value="reset" style="width: 15%">
							</div>
						</form>
						<div id="donation-option" class="donation-info-box-option">
							<label for="donationOption" style="margin-bottom: 2%">후원방식</label>
							<div class="form_toggle row-vh d-flex flex-row justify-content-between">
								<div class="form_radio_btn radio_kakaopay">
									<input id="check1" type="radio" name="payType" value="kakaopay" >
									<label for="check1">카카오페이</label>
								</div>
								<div class="form_radio_btn radio_uplus">
									<input id="check2" type="radio" name="payType" value="uplus">
									<label for="check2">신용카드</label>
								</div>
							</div>
						</div>
						</div>
						<div class="donation-info-box" id="donation-btn">
							<button id="donation-btn" onclick="requestPay()">후원하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</main>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="/vendor/glightbox/js/glightbox.min.js"></script>
		<script src="/vendor/purecounter/purecounter_vanilla.js"></script>
		<script src="/vendor/isotope-layout/isotope.pkgd.min.js"></script>
		<script src="/vendor/swiper/swiper-bundle.min.js"></script>
		<script src="/vendor/aos/aos.js"></script>
		<script src="/vendor/php-email-form/validate.js"></script>
		<!-- 결제를 위한 jQuery -->
 		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
 		
<script>
	$(document).ready(function(){
		removeNavClass();
	});
	// +1만 버튼 클릭
    document.getElementById("price1").addEventListener("click", function() {
        // 버튼을 클릭했을 때 실행되는 코드
        var totalInput = document.getElementById("total");
        // 현재 입력된 값이 있는 경우에만 수행
        if (totalInput.value !== "") {
            // 현재 입력된 값에서 1만을 더한 값을 totalInput의 새로운 값으로 설정
            totalInput.value = parseInt(totalInput.value) + 10000  + "원";
        } else {
            // 현재 입력된 값이 없는 경우에는 1만으로 설정
            totalInput.value = 10000  + "원";
        }
    });
 	// +3만 버튼 클릭
    document.getElementById("price2").addEventListener("click", function() {
        var totalInput = document.getElementById("total");
        if (totalInput.value !== "") {
            totalInput.value = parseInt(totalInput.value) + 30000  + "원";
        } else {
            totalInput.value = 30000 + "원";
        }
    });
 	// +5만 버튼 클릭
    document.getElementById("price3").addEventListener("click", function() {
        var totalInput = document.getElementById("total");
        if (totalInput.value !== "") {
            totalInput.value = parseInt(totalInput.value) + 50000  + "원";
        } else {
            totalInput.value = 50000 + "원";
        }
    });
    function removeNavClass() {
		$("#nav-home").removeClass("active");
		$("#nav-dolbom-list").removeClass("active").addClass("active");
		$("#nav-adopt").removeClass("active");
		$("#nav-dolbom-list-review").removeClass("active");
		$("#nav-adopt-review").removeClass("active");
		$("#nav-adopt-request").removeClass("active");
		$("#nav-board-list").removeClass("active");
		$("#nav-sevice").removeClass("active");
		$("#nav-about").removeClass("active");
		$("#nav-Contact").removeClass("active");
		$("#nav-Contact").removeClass("active");
		
	}
    function removeNavClass() {
		$("#nav-home").removeClass("active");
		$("#nav-dolbom-list").removeClass("active").addClass("active");
		$("#nav-adopt").removeClass("active");
		$("#nav-dolbom-list-review").removeClass("active");
		$("#nav-adopt-review").removeClass("active");
		$("#nav-adopt-request").removeClass("active");
		$("#nav-board-list").removeClass("active");
		$("#nav-sevice").removeClass("active");
		$("#nav-about").removeClass("active");
		$("#nav-Contact").removeClass("active");
		$("#nav-Contact").removeClass("active");
		
	}
    const userCode = "imp04886870";
    IMP.init(userCode);
    
    function requestPay() {
        var dogName = $("#dogName").val();                 // 강아지 이름
        var total = parseInt($("#total").val());           // 후원 금액
        var pg = $('input[name=payType]:checked').val();   // 결제 방식
        var userPhone = $('#userPhone').val();             // 후원자 전화번호
        var userName = $('#userName').val();               // 후원자 이름
        var donationDogNo = parseInt($('#donationDogNo').val(), 10);     // 강아지 번호
        var donationUser = $('#donationUser').val();       // 사용자 ID
        var donationMoney = parseInt($("#total").val());   // 후원 금액
        var dogNo = "${dog.dogNo}";

        IMP.request_pay({
            pg: pg,
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: dogName + " 후원하기",
            amount: total,
            buyer_name: userName,
            buyer_tel: userPhone,
        }, function(rsp) {
            if (rsp.success) {
            	// 결제 성공 시 인풋에 값 비우기
		        $("#dogName").val();
		        $("#total").val('');
		        $('input[name=payType]:checked').prop('checked', false);
		        $('#userPhone').val();
		        $('#userName').val();
		        $('#donationDogNo').val();
		        $('#donationUser').val();
		        
		        // 결제 성공시 알림창
		        alert("후원해주셔서 감사합니다.");
            	
                $.ajax({
                    url: "/donation/money.dog",
                    type: "POST",
                    data: {
                    	dogNo: dogNo,
                        donationDogNo: donationDogNo,
                        donationUser: donationUser,
                        donationMoney: donationMoney
                    },
                    success: function(response) {
                        // 성공적으로 요청이 처리된 후에 실행되는 코드
                        console.log(response); // 서버에서 받은 응답을 콘솔에 출력
                        location.reload(); // 페이지 리로드
                    },
                    error: function(error) {
                        // AJAX 요청이 실패한 경우 실행되는 코드
                        console.error(error); // 에러 메시지를 콘솔에 출력
                    }
                });
            } else {
            	// 결제 실패 시 인풋에 값 비우기
		        $("#dogName").val();
		        $("#total").val('');
		        $('input[name=payType]:checked').prop('checked', false);
		        $('#userPhone').val();
		        $('#userName').val();
		        $('#donationDogNo').val();
		        $('#donationUser').val();
		        
            	// 결제 실패시 알림창
            	alert("후원에 실패하였습니다. 다시 시도해주세요.");
            }
        });
    }
    
    function formatNumber(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
    var donationAmount = ${donationAmount};

    // 프로그레스 바 업데이트 함수
    function updateProgressBar(donationAmount) {
        var progressBar = document.getElementById("progress-bar");

     	// 프로그레스 바 내부에 퍼센트 표시
        progressBar.textContent = formatNumber(donationAmount) + "원";
    }

    // 프로그레스 바 업데이트 호출 (애니메이션 포함)
    updateProgressBar(donationAmount);
    
</script>

  <!-- footer -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>
</html>