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
         <form action="/calendar/insert.dog" method="post" enctype="multipart/form-data">
	     	<input type="hidden" name="userId" value="userId">	<!-- 아이디 값 넣기 -->
	         <ul>
	            <li>시작일 : <input type="date" name="schStartDate" id=""></li>
	            <li>종료일 : <input type="date" name="schEndDate" id=""></li>
	            <li>강아지 : 
	            	<select name="dogNo" id="dogNo">
		               <option value="dogNo">이름</option>	<!-- forEach로 개 번호 이름으로 전환해서 넣기 -->
		            </select>
	            </li>
	            <li>옵션 : 
	            	<select name="schOption" id="schOption">
		               <option value="임시보호">임시보호</option>
		               <option value="후원">후원</option>
		            </select>
	            </li>
	            <li>제목 : <input type="text" name="schTitle" id="" placeholder="제목을 입력해주세요."></li>
	            <li>내용 : <textarea name="schContent" id="" placeholder="내용을 입력해주세요."></textarea></li>
	         </ul>
	         <div class="buttons">
	         	<button type="submit">등록</button>
	         	<button onclick="popupClose();">닫기</button>
	         </div>
         </form>
      </div>
      <script>
         function popupClose() {
            window.close();
         }
      </script>
   </body>
</html>