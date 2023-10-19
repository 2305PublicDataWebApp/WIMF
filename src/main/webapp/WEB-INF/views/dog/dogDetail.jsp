<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>돌봄 동물 상세</title>
		<!-- css -->
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
		<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
		<link href="/vendor/aos/aos.css" rel="stylesheet">
		<link rel="stylesheet" href="/css/common/reset.css">
		<link rel="stylesheet" href="/css/dog/dogDetail.css">
		<style>
		</style>
	</head>
	<body>
		<!-- header -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
		<!-- My Code -->
		<main>			
			<br>
			<h1>강아지 상세정보</h1>
			<br>
			<hr>
			<br>	
				<div>
					<p>${dog.dogRegion }</p>
					<p>${dog.dogKind }</p>
					<h3>${dog.dogName }</h3>
				</div>
		<div id="detail-container">
			<div id="dog_image_container">
				<br><br><br>
				<div>
					<img src=${dogFileList[0].dogFilePath } alt=${dogFileList[0].dogFileName }>
				</div>
				<div>
					<button>좋아요</button>
				</div>
			</div>
			<div id="dog_info_container">
			    <table>
			        <tr>
			            <td style="width: 30%;">품종</td>
			            <td style="width: 70%;">${dog.dogKind }</td>
			        </tr>
			        <tr>
			            <td>보호소</td>
			            <td>${dog.dogAgency }</td>
			        </tr>
			        <tr>
			            <td>나이</td>
			            <td>${dog.dogAge }</td>
			        </tr>
			        <tr>
			            <td>성별</td>
			            <td>${dog.dogGender }</td>
			        </tr>
			        <tr>
			            <td>구조장소</td>
			            <td>${dog.dogRLocation }</td>
			        </tr>
			        <tr>
			            <td>몸무게</td>
			            <td>${dog.dogWeight }</td>
			        </tr>
			        <tr>
			            <td>성격</td>
			            <td>${dog.dogPersonality }</td>
			        </tr>
			        <tr>
			            <td>건강상태</td>
			            <td>${dog.dogHealth }</td>
			        </tr>
			        <tr>
			            <td>발견일시</td>
			            <td>${dog.dogRDate }</td>
			        </tr>
			        <tr>
			            <td>참고사항</td>
			            <td>${dog.dogInfo }</td>
			        </tr>
			        <tr>
			            <td>안락사 예정일</td>
			            <td>${dog.dogDeathDate }</td>
			        </tr>
			    </table>
			    <br><br><br><br><br><br><br><br>
			    <div id="btn-area">
				    <button onclick="location.href='/app/insert.dog?dogNo=${dog.dogNo}';" style="cursor: pointer;">돌봄(입양)신청서로 이동</button>		    
				    <button>후원하기</button>				    
			    </div>
			</div>
		</div>
		<br><hr>
        <div class="review-input">
                 <div class="input_box">
                      <div class="input_title">
                          <label>작성란</label>	                          
                      </div>
                 	<input type="text" name="dogReplyContent" placeholder="댓글을 작성해주세요!" style="width: 500px;">&nbsp&nbsp
				    <button id="rSubmit" class="custom-btn btn-11">제출</button>		
				</div>
		</div>	
		<table align="center" width="500" border="1" id="replyTable">
			<tbody></tbody>
		</table>					
		</main>
	
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		
		<script>
		$("#rSubmit").on("click", function() {
			const dogReplyContent = $("#dogReplyContent").val();
			const refDogNo = ${dog.dogNo };
			$.ajax({
				url : "/reply/add.dog",
				data : { dogReplyContent : dogReplyContent, refDogNo : refDogNo},
				type : "POST",
				success : function (result) {
					if(result == "success"){
						alert("댓글 등록 성공!!");
						getReplyList();
						$("#dogReplyContent").val("");
					}else{
						alert("댓글 등록 실패!!");
					}
				},
				error : function() {
					alert("관리자에게 문의 바랍니다.");
				}
			});
		});	
		
		const getReplyList = () => {
			const refDogNo = ${dog.dogNo };
			$.ajax({
				url : "/dog/detail.dog",
				data : { refDogNo : refDogNo },
				type : "GET",
				success : function(data) {
					console.log(data);
					const tableBody = $("#replyTable tbody");
					let tr;
					let dogReplyWriter;
					let dogReplyContent;
					let dogReplyCreateDate;
					let btnArea;
					
					if(data.length > 0) {
						for(let i in data) {
							tr = $("<tr>");				// <tr></tr>
							replyWriter = $("<td>").text(data[i].replyWriter);	// <td>khuser01</td>
							replyContent = $("<td>").text(data[i].replyContent);	// <td>댓글내용</td>
							replyCreateDate = $("<td width='100'>").text(data[i].rCreateDate);	// <td>2023/09/26</td>
							btnArea = $("<td width='150'>")
											.append("<a href='javascript:void(0)' onclick='modifyView(this," + data[i].replyNo + ", \""+data[i].replyContent+"\");'>수정하기</a>&nbsp;&nbsp;")
											.append("<a href='javascript:void(0)' onclick='removeReply("+data[i].replyNo+");'>삭제하기</a>");
							tr.append(replyWriter);
							tr.append(replyContent);
							tr.append(replyCreateDate);	// <tr><td></td></td>...?</tr>
							tr.append(btnArea);
							tableBody.append(tr);		// <tbody><tr><td></td>...</tr></tbody>
							
						}
					}
				},
				error : function() {
					alert("Ajax 오류! 관리자에게 문의바랍니다.");
				}
			});
		}		
		</script>
	</body>
</html>