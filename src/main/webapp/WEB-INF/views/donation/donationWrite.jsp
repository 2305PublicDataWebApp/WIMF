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
  <!-- 결제를 위한 jQuery -->
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
  <script>
    const userCode = "imp04886870";
    IMP.init(userCode);
    
  function requestPay() {
// 	  var dogNo = $("#test").val();
// 	  var dogname = $("#test").val();
// 	  var userName = $("#test").val();
// 	  var userTel = $("#test").val();
// 	  var payMethod = $('input[name=payType]:checked').val();

	  var pg = $('input[name=payType]:checked').val();
	  var pay = parseInt($('input[name=pay]:checked').val());
	  if(payMethod == "card"){
		  pg = "html5_inicis";
	  }else{
		  pg = "kakaopay"
	  }
	  var random = Math.random().toString(25).substr(2, 12);
	  
	  IMP.request_pay({
	    pg: pg, // html5_inicis, kakaopay
	    pay_method: "card", 
	    merchant_uid: random,
	    name: dogname + " 후원하기",
	    amount: pay,
	    buyer_name: userName,
	    buyer_tel: userTel,
	  }, function (rsp) {
		  console.log(rsp);
		  
		  if(rsp.success == true){ // 결제성공
			  
			  $.ajax({
			      url:"/donation/money.dog",
			      type:"POST",
			      data:{
			    	   		dogNo : dogNo,
			    	   		donationDogNo : dogName,
			    	   		dogNm : dogName
			      		},
			      contentType: "application/json",
			      success: function(data) {
			          if (data.result == true) {
			              alert("후원이 완료되었습니다.");
			              //location.href = ;
			          } else {
			              alert("관리자에게 문의를 부탁드립ㄴ디ㅏ.");
			          }
			      },
			      error: function() {
			          alert("에러 발생");
			      }
			  })
			  
		  }
		  
	  }
	  
	  );
}
  
  </script>
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
				<div id="left-content">
					<div id="dog-info">
						<input type="hidden" name="dogNo">
						<input type="image" name="dogImage"><br/>
						유기견 이름 : <input type="text" name="dogName">
					</div>
				</div>
				<div id="right-content">
					<div id="user-info">
						<input type="hidden" name="userId">
						후원자 : <input type="text" name="userName"><br/><br/>
						전화번호 : <input type="text" name="userPhone"><br/><br/>
						주소 : <input type="text" name="userAddress"><br/><br/>
					</div>
					<div id="donation-info">
						후원금액 : <input type="text" id="total" value="0" placeholder="직접입력"><br/><br/>
							<tr>
					            <td><label for="price1"></label></td>
					            <td><input type="button" name="price1" id="price1" value="+1만"></td>
					        </tr>
					        <tr>
					            <td><label for="price2"></label></td>
					            <td><input type="button" name="price2" id="price2" value="+3만"></td>
					        </tr>
					        <tr>
					            <td><label for="price3"></label></td>
					            <td><input type="button" name="price3" id="price3" value="+5만"></td>
					        </tr><br/><br/>
						후원 방식 : 
						<label for="check1"><input id="check1" type="radio" name="payType" value="kakaopay"> 카카오페이 </label> &nbsp
						<label for="check2"><input id="check2" type="radio" name="payType" value="html5_inicis"> 신용카드 </label>
					</div><br/>
					<div>
						<button onclick="requestPay()">후원하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</main>

  <!-- footer -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>
</html>