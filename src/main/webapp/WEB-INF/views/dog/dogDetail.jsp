<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
					<button onclick="location.href='/dog/modify.dog?dogNo=${dog.dogNo}';" style="cursor: pointer;">수정하기</button>
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
				    <button onclick="location.href='/donation/money.dog?dogNo=${dog.dogNo}';" style="cursor: pointer;">${dog.dogName } 후원하러 가기</button>				    
			    </div>
			</div>
		</div>
		<br><hr>
        <div class="review-input">
                 <div class="input_box">
                      <div class="input_title">
                          <label>작성란</label>	                          
                      </div>
                 	<input type="text" name="dogReplyContent" id="dogReplyContent" placeholder="댓글을 작성해주세요!" style="width: 500px;">&nbsp&nbsp
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
		

		// "제출" 버튼 클릭 시 호출되는 부분
		$("#rSubmit").on("click", function() {
		    const dogReplyContent = $("#dogReplyContent").val();
		    const refDogNo = ${dog.dogNo };
		    $.ajax({
		        url: "/dog/addReply.dog",
		        data: { "dogReplyContent": dogReplyContent, "refDogNo": refDogNo },
		        type: "POST",
		        success: function (result) {
		            if (result == "success") {
		                alert("댓글 등록 성공!!");
		                // 댓글이 추가된 후에도 댓글 목록을 업데이트
		                $("#dogReplyContent").val("");
		                getReplyList();
		            } else {
		                alert("댓글 등록 실패!!");
		            }
		        },
		        error: function() {
		            alert("관리자에게 문의 바랍니다.");
		        }
		    });
		});

		// 다음의 코드를 추가하여 댓글 목록을 업데이트
		const updateReplyTable = (data) => {
		    const tableBody = $("#replyTable tbody");
		    tableBody.empty(); // 기존 내용을 지우고 새로운 댓글 목록을 추가
		    const headerRow = $("<tr>");
		    headerRow.append("<th width='10%'>작성자</th>");
		    headerRow.append("<th width='40%'>댓글 내용</th>");
		    headerRow.append("<th width='30%'>작성일(수정일)</th>");
		    headerRow.append("<th width='5%'>추천수</th>");
		    headerRow.append("<th width='15%'>수정/삭제</th>");
		    tableBody.append(headerRow);
		    if (data.length > 0) {
		        for (let i in data) {
		            const tr = $("<tr>");
		            const dogReplyWriter = $("<td width= 10%;>").text(data[i].dogReplyWriter);
		            const dogReplyContent = $("<td  width= 40%;>").text(data[i].dogReplyContent);
		            const dogReplyCreateDate = new Date(data[i].dogReplyCreateDate);
		            const formattedDate = dogReplyCreateDate.toLocaleString('ko-KR', { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', hour12: true });
		            const dogReplyUpdateDate = new Date(data[i].dogReplyUpdateDate);
		            let formattedDate2 = dogReplyUpdateDate.toLocaleString('ko-KR', { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', hour12: true });
		            if (formattedDate !== formattedDate2) {
		                formattedDate2 += " (수정됨)";
		            }
		            const dogReplyRecommend = $("<td  width= 5%;>").text(data[i].dogReplyRecommend);
		            const btnArea = $("<td width= 15%;>")
		                .append("<a href='javascript:void(0)' onclick='modifyView(this, " + data[i].dogReplyNo + ", \"" + data[i].dogReplyContent + "\");'>수정하기</a>&nbsp;&nbsp;")
		                .append("<a href='javascript:void(0)' onclick='removeReply(" + data[i].dogReplyNo + ");'>삭제하기</a");
		            tr.append(dogReplyWriter);
		            tr.append(dogReplyContent);		            
		            tr.append($("<td width= 30%;>").text(formattedDate2));
		            tr.append(dogReplyRecommend);
		            tr.append(btnArea);
		            tableBody.append(tr);
		            

		        }
		    }
		}

		const getReplyList = () => {
		    const dogNo = ${dog.dogNo};
		    $.ajax({
		        url: "/dog/replyList.dog",
		        data: { "dogNo": dogNo },
		        type: "GET",
		        success: function (data) {
		            console.log(data);
		            updateReplyTable(data); // 업데이트 함수를 호출하여 테이블을 업데이트
		        },
		        error: function () {
		            alert("Ajax 오류! 관리자에게 문의바랍니다.");
		        }
		    });
		}
		
		
		const modifyView = (obj, dogReplyNo, dogReplyContent) => {
		    // 이미 있는 수정 입력 행이 있는지 확인하고 제거
		    let existingEditRow = $("tr.edit-row");
		    if (existingEditRow.length > 0) {
		        existingEditRow.remove();
		    } else {
		        // 새로운 수정 입력 행 생성
		        let tr = $("<tr class='edit-row'>");
		        tr.append("<td colspan='3'><input type='text' size='50' value='" + dogReplyContent + "'></td>");
		        tr.append("<td colspan='2'><button onclick='modifyReply(" + dogReplyNo + ", this)'>수정</button></td>");
		        $(obj).parent().parent().after(tr);
		    }
		}
		
		const modifyReply = (dogReplyNo, obj) => {
			// <input type='text' size='50'>
			const inputTag = $(obj).parent().prev().children();
			const dogReplyContent = inputTag.val();
			$.ajax({
				url : "/dog/replyUpdate.dog",
				data : {dogReplyNo : dogReplyNo, dogReplyContent : dogReplyContent},
				type : "POST",
				success : function(data) {
					if(data == "success"){
						alert("댓글 수정 성공!");
						getReplyList();
					}else{
						alert("댓글 수정 실패!");
					}
				},
				error : function() {
					alert("관리자에게 문의 바랍니다.");
				}
			});
		}
		
		const removeReply = (dogReplyNo) => {
			$.ajax({
				url:"/dog/replyDelete.dog",
				data:{"dogReplyNo" : dogReplyNo},
				type:"POST",
				success: function(data){
					if(data == "success"){
						alert("댓글 삭제 성공!");
						getReplyList();						
					}else{
						alert("댓글 삭제 실패!");
					}
				},
				error : function(){
					alert("Ajax 호출 실패!, 관리자에게 문의 바랍니다.");
				}
			})
		}	
		// getReplyList 함수를 페이지 로딩 시에 호출하도록 이동
		getReplyList();		
		</script>
	</body>
</html>