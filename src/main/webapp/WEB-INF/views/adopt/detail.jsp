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
		<title>입양 후기 상세 페이지</title>
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
			    <h3 style="padding-bottom: 2%;">입양 후기 상세</h3>
				<div id="board">
					<div id="board-content">
						<div id="borad-subject">
							<a style="font-weight:bold">${adopt.adoptTitle }</a>
						</div>
						<div id="borad-writer">
							<a style="font-weight:bold; color: tomato">작성자 : </a>
							${userNickName }
						</div>
						<div id="borad-create-date">
							<a style="font-weight:bold; color: tomato">작성일 : </a>
							<fmt:formatDate pattern="yyyy-MM-dd a HH:mm:ss" value="${adopt.adoptCreateDate }"/>
						</div>
						<div>
							<a style="font-weight:bold; color: tomato">입양일 : </a>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${adopt.adoptDate }"/>
						</div>
						<div id="borad-deep-content">
							${adopt.adoptContent }
						</div>
						<c:choose>
							<c:when test="${adopt.userId eq userId}">
								<div>
									<input id="submit-btn" type="submit" value="수정" onClick="location.href='/adopt/update.dog?adoptNo=${adopt.adoptNo}'">
								</div>
								<form action="/adopt/delete.dog" method="get" onsubmit="return confirmDelete()">
									<input type="hidden" name="adoptNo" value="${adopt.adoptNo }">
									<input type="hidden" name="userId" value="${adopt.userId }">
									<div>
										<input id="reset-btn" type="submit" value="삭제">
									</div>
								</form>	
							</c:when>
							<c:when test="${userId eq 'admin' }">
								<form action="/adopt/delete.dog" method="get" onsubmit="return confirmDelete()">
									<input type="hidden" name="adoptNo" value="${adopt.adoptNo }">
									<input type="hidden" name="userId" value="${adopt.userId }">
									<div>
										<input id="reset-btn" type="submit" value="삭제">
									</div>
								</form>
							</c:when>
						</c:choose>
						<div>
							<input id="list-btn" type="submit" value="목록" onClick="location.href='/adopt/list.dog'">
						</div>
					</div>
				
					<!-- 댓글 등록 -->
					<div id="board-reply">
						<h6 style="font-weight:bold; color: tomato; padding-top: 5%; border-top: 1px solid;">댓글</h6>
						<form action="/adoptreply/add.dog" method="post" onsubmit="return validateForm()">
							<input type="hidden" name="adoptNo" value="${adopt.adoptNo }">
							<textarea id="summernote" name="adoptReplyContent" placeholder="댓글을 작성해주세요"></textarea>
							<input id="reply-btn" type="submit" value="등록">
						</form>
					</div>
				
				<!-- 댓글 목록 -->
				<div id="board-reply-list">
					<h6 style="font-weight:bold; color: tomato;">댓글목록</h6>
						<table id="board-reply-list-table">
							<colgroup>
							<col width="40%" />
							<col width="10%" />
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
									<td style="padding-top: 1%; padding-left: 2%; padding-bottom:1%; border-bottom: 1px solid darkgray">${reply.adoptReplyContent }</td>
									
									<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray">${reply.userNickName }</td>
									<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray"><fmt:formatDate pattern="yyyy-MM-dd" value="${reply.adoptReplyCreateDate }"/></td>
									<c:choose>
										<c:when test="${reply.userId eq userId}">
											<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray">
												<a id="reply-update" href="javascript:void(0);" onclick="showModifyForm(this, '${reply.adoptReplyContent}');">수정</a>
												<c:url var="delUrl" value="/adoptreply/delete.dog">
													<c:param name="adoptReplyNo" value="${reply.adoptReplyNo }"></c:param>
													<!-- 자기 자신이 작성한 댓글만 지우도록 하기 위해 replyWriter를 추가함 -->
													<c:param name="userId" value="${reply.userId }"></c:param>
													<!-- 성공하면 detail로 가기 위해 필요한 adoptNo 세팅 -->
													<c:param name="adoptNo" value="${reply.adoptNo }"></c:param>
												</c:url>
												<a id="reply-delete" href="javascript:void(0);" onclick="replyDeleteForm('${delUrl}');">삭제</a>
											</td>
										</c:when>
											<c:when test="${userId == 'admin' }">
												<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray">
													<a id="reply-update-bean"></a>
													<c:url var="delUrl" value="/adoptreply/delete.dog">
														<c:param name="adoptReplyNo" value="${reply.adoptReplyNo }"></c:param>
														<!-- 자기 자신이 작성한 댓글만 지우도록 하기 위해 replyWriter를 추가함 -->
														<c:param name="userId" value="${reply.userId }"></c:param>
														<!-- 성공하면 detail로 가기 위해 필요한 adoptNo 세팅 -->
														<c:param name="adoptReplyNo" value="${reply.adoptReplyNo }"></c:param>
													</c:url>
													<a id="reply-delete" href="javascript:void(0);" onclick="replyDeleteForm('${delUrl}');">삭제</a>
												</td>
											</c:when>
										<c:when test="${reply.userId ne userId}">
											<td style="padding-top: 1%; padding-bottom:1%; text-align: center; border-bottom: 1px solid darkgray"></td>
										</c:when>
									</c:choose>
								</tr>
								<tr	class="replyUpdate" style="display:none;">
									<td colspan="3"><input id="adoptReplyContent" type="text" size="50" name="adoptReplyContent" value="${reply.adoptReplyContent }"></td>
									<td>
										<input id="reply-update-btn" type="button" onclick="replyModify(this, '${reply.adoptReplyNo}','${reply.adoptNo }');" value="수정">
										<input id="update-close-btn" type="reset" value="취소" onClick="closeReplyUpdate()">
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
				</div>
			</div>
		</main>
		<script>
		 	function confirmDelete() {
		        const confirmed = confirm("정말 삭제하시겠습니까?");
		        return confirmed;
		    }
		
			function replyDeleteForm(delUrl){
				const confirmed = confirm("정말 삭제하시겠습니까?");
					
				if(confirmed){
					location.href = delUrl;
					location.reload();
					return true;
				}else{
					return false;
				}
			}
			
			function validateForm(){
				const content = document.getElementById("summernote").value;
				  
				if(content.trim() == ""){
					alert("내용을 입력해주세요");
					return false;
				}
				return true;
			}
			
			function showModifyForm(obj, adoptReplyContent){
				obj.parentElement.parentElement.nextElementSibling.style.display="";
			}
			
			function closeReplyUpdate(){
				const updateElements = document.getElementsByClassName('replyUpdate');
				for (var i = 0; i < updateElements.length; i++){
					updateElements[i].style.display = 'none';
				}
			}
			
			function replyModify(obj, adoptReplyNo, adoptNo){
				// DOM프로그래밍을 이용하는 방법
				const form = document.createElement("form");
				form.action = "/adoptreply/update.dog";
				form.method = "post";
				
				const input = document.createElement("input");
				input.type = "hidden";
				input.value = adoptReplyNo;
				input.name = "adoptReplyNo";
				
				const input2 = document.createElement("input");
				input2.type = "hidden";
				input2.value = adoptNo;
				input2.name = "adoptNo";
				
				const input3 = document.createElement("input");
				input3.type = "text";
				input3.value = obj.parentElement.previousElementSibling.childNodes[0].value;
				input3.name = "adoptReplyContent";
				
				form.appendChild(input);
				form.appendChild(input2);
				form.appendChild(input3);
				
				document.body.appendChild(form);
				form.submit();
			}
		</script>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		
	</body>

</html>