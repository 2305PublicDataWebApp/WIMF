<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>돌봄, 입양신청서</title>
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
                <h1>돌봄, 입양신청서</h1>
                <table>
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 30%;">
                        <col style="width: 50%;">
                    </colgroup>
                    <tr>
                    	<td rowspan="4">
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
                        <td colspan="3">위 내용은 마이페이지에서 변경해주세요!</td>
                    </tr>
                </table>
                
                <table>
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tr>
                        <td rowspan="2"><img style="width: 100px;" src=${dogFileList[0].dogFilePath } alt=${dogFileList[0].dogFileName }></td>
                        <td>${dog.dogName }</td>
                    </tr>
                    <tr>
                        <td>${dog.dogAge } 세</td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>서울시 남대문로 120 그레이츠 청계</td>
                    </tr>
                    <tr>
                        <td colspan="2">선택한 강아지가 맞는지 확인해주세요!</td>
                    </tr>
                </table>
                
                
                <form id="application-form" action="#" method="POST">

                    <b>- 돌봄/입양</b>
                    <div class="radio-group">
                        <input type="radio" id="dog-temp-adopt" name="appDogAdopt" value="temp" >
                        <label for="dog-temp-adopt">돌봄</label>
                        <input type="radio" id="dog-temp-indefinite-adopt" name="appDogAdopt" value="indefinite">
                        <label for="dog-temp-indefinite-adopt">무기한 돌봄</label>
                        <input type="radio" id="dog-adopt" name="appDogAdopt" value="adopt">
                        <label for="dog-adopt">입양</label>
                    </div>
                    
                    <label for="app-start-date">- 돌봄/입양 희망 시작일</label>
                    <div>
                        <input type="date" id="app-start-date" name="appStartDate" >
                        <b id="start-warning" class="red" style="display: none;">시작일은 다음날부터 입력 가능</b>
                    </div>

                    <div id="care-dates" style="display: none;">
                        <label for="app-date">- 돌봄 희망일 수</label>
                        <input type="number" id="app-date" name="appDate">
                        <b id="warning" class="red" style="display: none;">시작일로부터 최소 14일 이후를 입력</b>
    
                        <label for="app-end-date">- 돌봄 희망 종료일</label>
                        <input type="date" id="app-end-date" name="appEndDate">
                    </div>
                    
                    <b>- 강아지 보유여부</b>
                    <div class="radio-group">
                        <input type="radio" id="app-dog-had-yes" name="appDogHad" value="Y" >
                        <label for="app-dog-had-yes">있음</label>
                        <input type="radio" id="app-dog-had-no" name="appDogHad" value="N">
                        <label for="app-dog-had-no">없음</label>
                    </div>

                    <b>- 임시보호 경험 여부</b>
                    <div class="radio-group">
                        <input type="radio" id="app-exp-had-yes" name="appExpHad" value="Y" >
                        <label for="app-exp-had-yes">있음</label>
                        <input type="radio" id="app-exp-had-no" name="appExpHad" value="N">
                        <label for="app-exp-had-no">없음</label>
                    </div>
                    <div class="warn-form">
                        <b class="red">아래 질문은 자유롭게 작성해주세요!</b>
                    </div>
                    <label for="app-question-one">개 짖는 소리, 씹기, 파괴적인 행동, 실내 화장실 사고,
                        제멋대로의 행동과 같은 문제들을<br> 어떻게 다루실 건가요?</label>
                    <textarea name="appQuestionOne" id="app-question-one" cols="30" rows="10" placeholder="내용을 입력해주세요" ></textarea>

                    <label for="app-question-two">강아지의 일상적인 산책과 운동을 어떻게 관리하실 건가요?</label>
                    <textarea name="appQuestionTwo" id="app-question-two" cols="30" rows="10" placeholder="내용을 입력해주세요" ></textarea>
                
                    <label for="app-question-three">강아지를 기를 경제적인 여유가 있으신가요? </label>
                    <textarea name="appQuestionThree" id="app-question-three" cols="30" rows="10" placeholder="내용을 입력해주세요" ></textarea>
                    
                    <label for="app-content">자유롭게 하고 싶은 말이나 각오를 작성해주세요!</label>
                    <textarea name="appContent" id="app-content" cols="30" rows="10" placeholder="내용을 입력해주세요" ></textarea>
                    
                    <div class="warn-form">
                        <b class="red">모든 항목은 필수로 모두 작성하셔야 합니다.</b><br>
                    </div>
                    <div class="warn-form">
                        <b class="red">제출 시 수정 불가능합니다!!!</b>
                    </div>
                    
                    <button type="submit">제출하기</button>
                </form>
            </div>

        </main>
        
        <!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />

        <script>
            const careDatesDiv = document.getElementById("care-dates");
            const careRadio = document.getElementById("dog-temp-adopt");
            const indefiniteRadio = document.getElementById("dog-temp-indefinite-adopt");
            const adoptRadio = document.getElementById("dog-adopt");
        
            const appStartDateInput = document.getElementById("app-start-date");
            const appDateInput = document.getElementById("app-date");
            const appEndDateInput = document.getElementById("app-end-date");
            const currentDate = new Date();
            const tomorrow = new Date();
            tomorrow.setDate(currentDate.getDate() + 1);
        
            // 페이지 로드 시 다음 날짜로 초기화
            appStartDateInput.value = tomorrow.toISOString().split("T")[0];
        
            // 돌봄 희망일수 종료일 초기화
            function clearCareFields() {
                appDateInput.value = "";
                appEndDateInput.value = "";
            }
        
            // 돌봄 선택시
            careRadio.addEventListener("change", function() {
                careDatesDiv.style.display = "block";
                appStartDateInput.value = tomorrow.toISOString().split("T")[0];
                document.getElementById("start-warning").style.display = "none";
            });
        
            // 무기한 돌봄 선택 시
            indefiniteRadio.addEventListener("change", function() {
                careDatesDiv.style.display = "none";
                appStartDateInput.value = tomorrow.toISOString().split("T")[0];
                document.getElementById("start-warning").style.display = "none";
                document.getElementById("warning").style.display = "none";
                clearCareFields();
            });
        
            // 입양 선택 시
            adoptRadio.addEventListener("change", function() {
                careDatesDiv.style.display = "none";
                appStartDateInput.value = tomorrow.toISOString().split("T")[0];
                document.getElementById("start-warning").style.display = "none";
                document.getElementById("warning").style.display = "none";
                clearCareFields();
            });
        
            // 돌봄, 입영 희망 시작일 입력 시
            appStartDateInput.addEventListener("input", function () {
                const appStartDate = new Date(appStartDateInput.value);
                if (appStartDate <= currentDate) {
                    document.getElementById("start-warning").style.display = "inline";
                } else {
                    document.getElementById("start-warning").style.display = "none";
                    clearCareFields();
                }
            });
        
            // 돌봄 희망일 수 입력 시
            appDateInput.addEventListener("input", function () {
                const appDate = parseInt(appDateInput.value, 10);
                const appStartDate = new Date(appStartDateInput.value);
        
                if (!isNaN(appDate)) {
                    const appEndDate = new Date(appStartDate);
                    appEndDate.setDate(appStartDate.getDate() + appDate);
        
                    if (appDate < 14) {
                        document.getElementById("warning").style.display = "inline";
                        appEndDateInput.value = "";
                    } else {
                        document.getElementById("warning").style.display = "none";
                        appEndDateInput.value = appEndDate.toISOString().split("T")[0];
                    }
        
                } else {
                    appEndDateInput.value = "";
                    document.getElementById("warning").style.display = "none";
                }
            });

        
           // 돌봄 희망 종료일 수 입력시
            appEndDateInput.addEventListener("input", function () {
                const appStartDate = new Date(appStartDateInput.value);
                const selectedEndDate = new Date(appEndDateInput.value);
        
                if (!isNaN(selectedEndDate)) {
                    const timeDiff = selectedEndDate.getTime() - appStartDate.getTime();
                    const daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));
        
                    if (daysDiff >= 14) {
                        appDateInput.value = daysDiff;
                        document.getElementById("warning").style.display = "none";
                    } else {
                        document.getElementById("warning").style.display = "inline";
                    }
                }
            });
        
            //제출 시 이벤트
            document.getElementById("application-form").addEventListener("submit", function (event) {
                const appStartDate = new Date(appStartDateInput.value);
                const selectedEndDate = new Date(appEndDateInput.value);
        
                const appQuestionOne = document.getElementById("app-question-one");
                const appQuestionTwo = document.getElementById("app-question-two");
                const appQuestionThree = document.getElementById("app-question-three");
                const appContent = document.getElementById("app-content");
                const appDogAdopt = document.getElementsByName("appDogAdopt");
                const appDogHad = document.getElementsByName("appDogHad");
                const appExpHad = document.getElementsByName("appExpHad");

                if (!appDogAdopt[0].checked && !appDogAdopt[1].checked && !appDogAdopt[2].checked) {
                    alert("돌봄/입양 유형을 선택해주세요!");
                    event.preventDefault();
                } else if (!appDogHad[0].checked && !appDogHad[1].checked) {
                    alert("강아지 보유 여부를 선택해주세요!");
                    event.preventDefault();
                } else if (!appExpHad[0].checked && !appExpHad[1].checked) {
                    alert("임시보호 경험 여부를 선택해주세요!");
                    event.preventDefault();
                }else if (!appStartDateInput.value || !appQuestionOne.value || !appQuestionTwo.value || !appQuestionThree.value || !appContent.value) {
                    alert("모든 항목을 입력해주세요!");
                    event.preventDefault();
                } else if (appStartDate < currentDate) {
                    // 시작날짜를 현재 날짜보다 과거로 입력하면 제출 못 함
                    alert("시작일은 오늘 날짜 및 과거 날짜를 선택할 수 없습니다.");
                    event.preventDefault();
                } else if (!isNaN(selectedEndDate)) {
                    // 종료날짜 입력 시
                    const dateAfter14Days = new Date(appStartDate);
                    dateAfter14Days.setDate(appStartDate.getDate() + 13);
        
                    if (selectedEndDate < dateAfter14Days) {
                        // 시작일과 종료일은 14일 차이가 나야 함
                        alert("종료일은 시작일로부터 14일 이후여야 합니다.");
                        event.preventDefault();
                    }else{
                        const confirmResult = confirm("제출하시면 수정할 수 없습니다. 정말로 제출하시겠습니까?");
                        if (!confirmResult) {
                            event.preventDefault();
                        }
                    }
                } else {
                    if (careRadio.checked) {
                        alert("돌봄 선택 시 기한을 입력하셔야 됩니다!")
                        event.preventDefault();
                    }else {
                        const confirmResult = confirm("제출하시면 수정할 수 없습니다. 정말로 제출하시겠습니까?");
                        if (!confirmResult) {
                            event.preventDefault();
                        }
                    }
                }
            });
            

        </script>  
    </body>
</html>