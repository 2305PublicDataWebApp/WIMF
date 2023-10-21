<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
      <title>Document</title>
      <style>
         .box {
            border: 2px double skyblue;
            border-radius: 10px;
            padding: 30px;
            margin: 30px;
         }
         h1 {
            text-align: center;
         }
         ul {
            list-style-type: none;
         }
         ul li {
            margin: 10px 10px;
            padding: 5px;
         }
         button {
            margin: 5px;
         }
         textarea {
            width: 500px;
            height: 300px;
         }
         .buttons {
            display: flex;
            justify-content: center;
         }
      </style>
   </head>
   <body>
      <div class="box">
         <h1>일정 등록</h1>
         
         <form id="insertForm" action="/calendar/insert.dog" method="post">
         <input type="hidden" name="userId" value="userId">	<!-- 아이디 값 넣기 -->
            <ul>
               <li>시작일 : <input type="date" name="schStartDate" id="" required></li>
               <li>종료일 : <input type="date" name="schEndDate" id=""></li>
               <li>강아지 : 
                  <select name="dogNo" id="dogNo">
                     <c:forEach var="combinedList" items="${combinedList}">
                        <option value="${combinedList.dog.dogNo }">No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }</option>	<!-- forEach로 개 번호 이름으로 전환해서 넣기 -->
                     </c:forEach>
                  </select>
               </li>
               <li>옵션 : 
                  <select name="schOption" id="schOption">
                     <option value="임시보호">임시보호</option>
                     <option value="후원">후원</option>
                  </select>
               </li>
               <li>제목 : <input type="text" name="schTitle" id="" placeholder="제목을 입력해주세요." required></li>
               <li>내용 : <textarea name="schContent" id="" placeholder="내용을 입력해주세요." required></textarea></li>
            </ul>
            <div class="buttons">
               <button type="button" onclick="submitFormAndClose();">등록</button>
               <button onclick="popupClose();">닫기</button>
            </div>
         </form>
         
      </div>
      <!-- 팝업창 스크립트 -->
<script>
   function popupClose() {
      window.close();
   }

   function submitFormAndClose() {
      // 여기서 입력된 정보를 가지고 Ajax 요청을 보내 Controller로 보내기
      var formData = $('#insertForm').serialize();

      $.ajax({
         url: '/calendar/insert.dog',
         method: 'POST',
         data: formData,
         success: function (response) {
            // 팝업창 닫기
            window.close();
               
            // 등록 성공 알림
            alert('일정 등록 성공');
            
         	// 성공적으로 등록되면 부모 창의 함수를 호출하여 메인 페이지의 풀캘린더를 업데이트
            window.opener.updateFullCalendar();
         },
         error: function (error) {
            console.log(error);
            // 실패 시에 대한 처리 추가
               
            // 등록 실패 알림
            alert('일정 등록 실패');
         }
      });
   }

</script>

   </body>
</html>