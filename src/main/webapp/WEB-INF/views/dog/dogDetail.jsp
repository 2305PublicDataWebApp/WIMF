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
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
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
					<c:if test="${adminCheck eq 'Y' }">					
						<button onclick="location.href='/dog/modify.dog?dogNo=${dog.dogNo}';" style="cursor: pointer;">수정하기</button>
						<button onclick="location.href='/dog/delete.dog?dogNo=${dog.dogNo}';" style="cursor: pointer;">삭제하기</button>
					</c:if>
					<p>${dog.dogRegion }</p>
					<p>${dog.dogKind }</p>
					<h3>${dog.dogName }</h3>
				</div>
		<div id="detail-container">
			<div id="dog_image_container">
				<br><br><br>
				<div>
				    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				        <div class="carousel-indicators">
				          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				        </div>
				        <div class="carousel-inner">
				          <div class="carousel-item active">
				            <img src=${dogFileList[0].dogFilePath } alt=${dogFileList[0].dogFileName }>
				          </div>
				          <div class="carousel-item">
				            <img src=${dogFileList[1].dogFilePath } alt=${dogFileList[1].dogFileName }>
				          </div>
				          <div class="carousel-item">
				            <img src=${dogFileList[2].dogFilePath } alt=${dogFileList[2].dogFileName }>
				          </div>
				        </div>
				        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				          <span class="visually-hidden">Previous</span>
				        </button>
				        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				          <span class="carousel-control-next-icon" aria-hidden="true"></span>
				          <span class="visually-hidden">Next</span>
				        </button>
				      </div>					
				</div>
				<div>
					<c:if test ="${userId ne null }">
						<button id="likeSubmit">좋아요</button>
					</c:if>
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
			            <td>${dog.dogAge }살</td>
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
			            <td>${dog.dogWeight }kg</td>
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
				    <button onclick="location.href='/donation/money.dog?dogNo=${dog.dogNo}';" style="cursor: pointer;">후원하러 가기</button>				    
			    </div>
			</div>
		</div>
		<br><hr>
		<h1>강아지 구조 위치</h1>
		<div id="dogMap">
		</div>
		<hr>
		<h1>댓글</h1>
		
		
		
		
        <div class="review-input">
                 <div class="input_box">
                      <div class="input_title">
                          <label>작성란</label>	                          
                      </div>
					<c:choose>
					    <c:when test="${not empty userId}">
					        <!-- 사용자가 로그인한 경우 -->
					        <input type="text" name="dogReplyContent" id="dogReplyContent" placeholder="댓글을 작성해주세요!" style="width: 500px;">&nbsp&nbsp
					        <button id="rSubmit" class="custom-btn btn-11">제출</button>
					    </c:when>
					    <c:otherwise>
					        <!-- 사용자가 로그인하지 않은 경우 -->
					        <input type="text" name="dogReplyContent" id="dogReplyContent" placeholder="댓글 작성은 로그인 후 가능합니다" style="width: 500px;" disabled>&nbsp&nbsp
					    </c:otherwise>
					</c:choose>				    
				</div>
		</div>	
		<table align="center" width="500" border="1" id="replyTable">
			<tbody></tbody>
		</table>					
		</main>
	
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		
		<script>
		
		
		 // 좋아요 버튼 클릭 이벤트 처리
		$(document).ready(function() {
		  // 페이지 로딩 시 "좋아요" 상태 가져오기
		  checkLikeStatus();
		  
		  // 좋아요 버튼 클릭 이벤트 처리
		  $("#likeSubmit").on("click", function() {
		    toggleLikeStatus();
		  });
		});
		
		let isLiked = false; // "좋아요" 상태를 전역 변수로 선언
		
		function checkLikeStatus() {
		  // 동물 번호를 이용하여 서버로부터 "좋아요" 상태를 가져오는 AJAX 요청
		  const refDogNo = ${dog.dogNo};
		  $.ajax({
		    url: "/dog/checkLikeStatus.dog", // "좋아요" 상태를 확인하는 URL
		    type: "GET",
		    data: { "refDogNo": refDogNo },
		    success: function (result) {
		      if (result == "liked") {
		        isLiked = true; // 이미 "좋아요"한 상태임을 설정
		        // 버튼을 빨간색으로 변경
		        $("#likeSubmit").css("background-color", "red");
		      }
		    },
		    error: function() {
		      alert("좋아요 상태 가져오기 실패");
		    }
		  });
		}
		
		function toggleLikeStatus() {
			  // 동물 번호와 현재 "좋아요" 상태를 서버로 전송하는 AJAX 요청
			  const refDogNo = ${dog.dogNo};
			  let dogLike = isLiked ? 'N' : 'Y'; // isLiked가 true일 때 'N', false일 때 'Y' 초기값 false 'Y'
			  $.ajax({
			    url: "/dog/updateLikeStatus.dog", // "좋아요" 상태를 토글하는 URL
			    type: "POST",
			    data: { "refDogNo": refDogNo, "dogLike": dogLike },
			    success: function (result) {
			      if (result == "success") {
			        if (dogLike == 'Y') {
			          isLiked = true; // "좋아요" 상태로 변경
			          // 버튼을 빨간색으로 변경
			          $("#likeSubmit").css("background-color", "red");
			          alert("좋아요 성공!!");
			        } else {
			          isLiked = false; // "좋아요" 취소 상태로 변경
			          // 버튼 색상 제거
			          $("#likeSubmit").css("background-color", "");
			          alert("좋아요 취소 성공!!");
			        }
			      } else {
			        alert("좋아요 업데이트 실패!!");
			      }
			    },
			    error: function() {
			      alert("관리자에게 문의 바랍니다.");
			    }
			  });
			}




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
		    headerRow.append("<th width='60%'>댓글 내용</th>");		    
		    headerRow.append("<th width='20%'>작성일(수정일)</th>");
		    headerRow.append("<th width='10%'>수정/삭제</th>");
		    tableBody.append(headerRow);
		    if (data.length > 0) {
		        for (let i in data) {
		            const tr = $("<tr>");
		            const dogReplyWriter = $("<td>").text(data[i].dogReplyWriter);
		            const dogReplyContent = $("<td>").text(data[i].dogReplyContent).attr("id", "content-input");
		            const dogReplyCreateDate = new Date(data[i].dogReplyCreateDate);
		            const formattedDate = dogReplyCreateDate.toLocaleString('ko-KR', { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', hour12: true });
		            const dogReplyUpdateDate = new Date(data[i].dogReplyUpdateDate);
		            let formattedDate2 = dogReplyUpdateDate.toLocaleString('ko-KR', { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', hour12: true });
		            if (formattedDate !== formattedDate2) {
		                formattedDate2 += " (수정됨)";
		            }
		            
		            
		            const btnArea = $("<td>")		            	
		                .append("<a href='javascript:void(0)' onclick='modifyView(this, " + data[i].dogReplyNo + ", \"" + data[i].dogReplyContent + "\");'>수정</a>&nbsp;&nbsp;")
		                .append("<a href='javascript:void(0)' onclick='removeReply(" + data[i].dogReplyNo + ");'>삭제</a>");
		            const dateCell = $("<td>").text(formattedDate2).attr("id", "date-cell");		            
		            tr.append(dogReplyWriter);
		            tr.append(dogReplyContent);		        		            		            
		            tr.append(dateCell);
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