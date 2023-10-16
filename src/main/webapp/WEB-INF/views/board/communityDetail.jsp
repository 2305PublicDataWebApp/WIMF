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
  <title>상세 페이지</title>
  <link href="/css/board/communityDetail.css" rel="stylesheet">

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
      <h3 style="padding-bottom: 2%;">글 상세</h3>
      <div id="board">
        <div id="board-content">
          <div id="borad-subject">
            <tr>
            	<th><a style="font-weight:bold">${board.boardTitle }</a></th>
            </tr>
          </div>
          <div id="borad-writer">
          	<tr>
          		<th><a style="font-weight:bold; color: tomato">작성자 : </a></th>
	      		<th>${userNickName }</th>
	      	</tr>
          </div>
          <div id="borad-create-date">
          	<tr>
          		<th><a style="font-weight:bold; color: tomato">작성일 : </a></th>
	      		<th>
	      			<fmt:formatDate pattern="yyyy-MM-dd a HH:mm:ss" value="${board.createDate }"/>
	      		</th>
	      	</tr>
          </div>
          <div id="borad-deep-content">
            <tr>
            	<th>${board.boardContent }</th>
            </tr>
          </div>
          <c:choose>
          	<c:when test="${board.boardWriter eq userId}">
	          <div>
	            <input id="submit-btn" type="submit" value="수정" onClick="location.href='/board/update.dog?boardNo=${board.boardNo}'">
	          </div>
	          <form action="/board/delete.dog" method="get">
	          <input type="hidden" name="boardNo" value="${board.boardNo }">
	          <input type="hidden" name="boardWriter" value="${board.boardWriter }">
			      <div>
			        <input id="reset-btn" type="submit" value="삭제" onClick="checkDelete(event)">
			      </div>
	          </form>
          	</c:when>
          	<c:when test="${userId == 'admin' }">
          		<form action="/board/delete.dog" method="get">
		            <input type="hidden" name="boardNo" value="${board.boardNo }">
		            <input type="hidden" name="boardWriter" value="${board.boardWriter }">
		            	<div>
			          		<input id="reset-btn" type="submit" value="삭제" onClick="checkDelete(event)">
		            	</div>
          		</form>
          	</c:when>
          </c:choose>
          <div>
            <input id="list-btn" type="submit" value="목록" onClick="location.href='/board/list.dog'">
          </div>
        </div>
          <!-- 댓글 등록 -->
          <div id="board-reply">
          	<h6 style="font-weight:bold; color: tomato; padding-top: 5%; border-top: 1px solid;">댓글</h6>
          	<form action="/reply/add.dog" method="post" onsubmit="return validateForm()">
          		<input type="hidden" name="replyBoardNo" value="${board.boardNo }">
          		<textarea id="summernote" name="replyBoardContent" placeholder="댓글을 작성해주세요"></textarea>
          		<input id="reply-btn" type="submit" value="등록">
          	</form>
          </div>
          <!-- 댓글 목록 -->
          <div id="board-reply-list">
          	<h6 style="font-weight:bold; color: tomato;">댓글목록</h6>
          	<table id="board-reply-list-table">
          		<colgroup>
	              <col width="40%" />
	              <col width="5%" />
	              <col width="10%" />
	              <col width="10%" />
	            </colgroup>
          		<tr>
          			<th style="color: tomato; padding-top: 1%; padding-left: 2%; padding-bottom:1%; border-bottom: 1px solid">내용</th>
          			<th style="color: tomato; padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid">작성자</th>
          			<th style="color: tomato; padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid">작성일</th>
          			<th style="color: tomato; padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid"></th>
          		</tr>
          		<c:forEach var="reply" items="${rList }">
		          	<tr>
		          		<td style="padding-top: 1%; padding-left: 2%; padding-bottom:1%; border-bottom: 1px solid darkgray">${reply.replyBoardContent }</td>
		          		
		          		<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray">${reply.replyBoardWriter }</td>
		          		<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray"><fmt:formatDate pattern="yyyy-MM-dd" value="${reply.replyCreateDate }"/></td>
		          		<c:choose>
		          			<c:when test="${reply.replyBoardWriter ne userId}">
		          				<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray"></td>
		          			</c:when>
		          			<c:when test="${reply.replyBoardWriter eq userId}">
		          				<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray">
				          			<a id="reply-update" href="javascript:void(0);" onclick="showModifyForm(this, '${reply.replyBoardContent}');">수정</a>
				          			<c:url var="delUrl" value="/reply/delete.dog">
										<c:param name="replyNo" value="${reply.replyNo }"></c:param>
										<!-- 자기 자신이 작성한 댓글만 지우도록 하기 위해 replyWriter를 추가함 -->
										<c:param name="repBoardWriter" value="${reply.replyBoardWriter }"></c:param>
										<!-- 성공하면 detail로 가기 위해 필요한 boardNo 세팅 -->
										<c:param name="repBoardNo" value="${reply.replyBoardNo }"></c:param>
									</c:url>
				          			<a id="reply-delete" href="javascript:void(0);" onclick="replyDeleteForm('${delUrl}');">삭제</a>
				          		</td>
		          			</c:when>
		          			<c:when test="${userId == 'admin' }">
		          				<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray">
				          			<c:url var="delUrl" value="/reply/delete.dog">
										<c:param name="replyNo" value="${reply.replyNo }"></c:param>
										<!-- 자기 자신이 작성한 댓글만 지우도록 하기 위해 replyWriter를 추가함 -->
										<c:param name="repBoardWriter" value="${reply.replyBoardWriter }"></c:param>
										<!-- 성공하면 detail로 가기 위해 필요한 boardNo 세팅 -->
										<c:param name="repBoardNo" value="${reply.replyBoardNo }"></c:param>
									</c:url>
				          			<a id="reply-delete" href="javascript:void(0);" onclick="replyDeleteForm('${delUrl}');">삭제</a>
				          		</td>
		          			</c:when>
		          		</c:choose>
		          	</tr>
		          	<tr	id="replyUpdate" style="display:none;">
				        <td colspan="3"><input id="replyBoardContent" type="text" size="50" name="replyBoardContent" value="${reply.replyBoardContent }"></td>
				        <td><input type="button" onclick="replyModify(this, '${reply.replyNo}','${reply.replyBoardNo }');" value="수정"></td>
			        </tr>
          		</c:forEach>
          	</table>
          </div>
      </div>
    </div>
  </main>
  <script>
  function validateForm(){
	  var content = document.getElementById("summernote").value;
	  
	  if(content.trim() == ""){
		  alert("내용을 입력해주세요");
		  return false;
	  }
	  return true;
  }
	function showModifyForm(obj, replyBoardContent){
//			HTML태그, display:none 사용하는 방법
//			document.querySelector("#replyModifyForm").style.display="";
		obj.parentElement.parentElement.nextElementSibling.style.display="";
	}
  </script>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	
</body>

</html>