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
    <title>돌봄, 입양신청서 상세</title>
    <link rel="stylesheet" href="/css/app/applicationStyle.css">
    
	<!-- css -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  	<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  	<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  	<link href="/vendor/aos/aos.css" rel="stylesheet">
  
</head>
    <body>
		<!-- header -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<!-- My Code -->
        <main>
            <div id="application">
                <h1>돌봄, 입양신청서 상세</h1>
                <table>
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 30%;">
                        <col style="width: 50%;">
                    </colgroup>
                    <tr>
                    	<td rowspan="5">
                    		<c:if test="${user.userFileRename ne null}">
								<img class="profile-img" alt="프로필사진" src="/resources/profileUploadFiles/${user.userFileRename }">
							</c:if>
							<c:if test="${user.userFileRename eq null}">
								<img class="profile-img" alt="프로필사진" src="/img/user/default-profile.png">
							</c:if>
                    	</td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td>${user.userName }</td>
                    </tr>
                    <tr>
                        <td>연락처</td>
                        <td>${user.userPhone }</td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>${user.userAddress }</td>
                    </tr>
                     <tr>
                        <td>이메일</td>
                        <td>${user.userEmail }</td>
                    </tr>
                </table>
                
                <table>
                    <colgroup>
                       <col style="width: 20%;">
                        <col style="width: 30%;">
                        <col style="width: 50%;">
                    </colgroup>
                    <tr>
                        <td rowspan="4"><img class="profile-img" src=${dogFileList[0].dogFilePath } alt=${dogFileList[0].dogFileName }></td>
                        <td>선택한 강아지 이름</td>
                        <td>${dog.dogName }</td>
                    </tr>
                    <tr>
                    	<td>강아지 나이</td>
                        <td>${dog.dogAge } 세</td>
                    </tr>
                    <tr>
                        <td>품종</td>
                        <td>${dog.dogKind }</td>
                    </tr>
                    <tr>
			            <td>안락사 예정일</td>
			            <td>${dog.dogDeathDate }</td>
			        </tr>
                </table>
                
				<b>- 돌봄/입양</b>
                <c:if test='${app.appDogAdopt.toString() eq "Y" }'>
	                <p>입양</p>
                </c:if>
                <c:if test='${app.appDogAdopt.toString() eq "N" }'>
	                <p>돌봄</p>
                </c:if>
                    
				<label for="app-start-date">- 돌봄/입양 희망 시작일</label>
				<p><fmt:formatDate value="${app.appStartDate}" pattern="yyyy-MM-dd" /></p>

    
				<label for="app-end-date">- 돌봄 희망 종료일</label>
				<c:if test='${empty app.appEndDate }'>
					<p>무기한</p>
				</c:if>
				<c:if test='${not empty app.appEndDate }'>
					<p><fmt:formatDate value="${app.appEndDate}" pattern="yyyy-MM-dd" /></p>
				</c:if>
				
				<b>- 강아지 보유여부</b>
				
				<c:if test='${app.appDogHad.toString() eq "Y" }'>
					<p>있음</p>
				</c:if>
				<c:if test='${app.appDogHad.toString() eq "N" }'>
					<p>없음</p>
				</c:if>
				
				<b>- 임시보호 경험 여부</b>
				<c:if test='${app.appExpHad.toString() eq "Y" }'>
					<p>있음</p>
				</c:if>
				<c:if test='${app.appExpHad.toString() eq "N" }'>
					<p>없음</p>
				</c:if>
				
				<label for="app-question-one">개 짖는 소리, 씹기, 파괴적인 행동, 실내 화장실 사고,
				    제멋대로의 행동과 같은 문제들을<br> 어떻게 다루실 건가요?</label>
				<p>${app.appQuestionOne}</p>
				
				<label for="app-question-two">강아지의 일상적인 산책과 운동을 어떻게 관리하실 건가요?</label>
				<div><p>${app.appQuestionTwo}</p></div>
				
				<label for="app-question-three">강아지를 기를 경제적인 여유가 있으신가요? </label>
				<div><p>${app.appQuestionThree}</p></div>
				
				<label for="app-content">자유롭게 하고 싶은 말이나 각오를 작성해주세요!</label>
				<div><p>${app.appContent}</p></div>
				
				<form id="application-form" action="/app/detail.dog" method="POST">
					<!-- 데이터를 넣기 위한 input hidden -->
					<input type="hidden" name="appNo" value="${app.appNo }">
					<input type="hidden" name="userId" value="${app.userId }">
					<input type="hidden" name="dogNo" value="${app.dogNo }">
					<input type="hidden" name="appStartDate" value="${app.appStartDate }">
					<input type="hidden" name="appEndDate" value="${app.appEndDate }">
					<input type="hidden" name="appDogAdopt" value="${app.appDogAdopt }">
					<div class="radio-group">
                        <input type="radio" id="app-reject" name="appStatus" value="N" <c:if test="${String(app.appStatus) eq 'N'}">checked</c:if>>
                        <label for="app-reject">반려</label>
                        <input type="radio" id="app-admit" name="appStatus" value="Y" <c:if test="${String(app.appStatus) eq 'Y'}">checked</c:if>>
                        <label for="app-admit">승인</label>
                        <input type="radio" id="app-pending" name="appStatus" value="W" <c:if test="${String(app.appStatus) eq 'W'}">checked</c:if>>
                        <label for="app-pending">보류</label>
                        <button type="submit">심사하기</button>
                    </div>
				</form>
            </div>
        </main>
        
        <!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />

    </body>
</html>