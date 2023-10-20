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
  <title>소통 게시판</title>
  <link href="/css/board/communityList.css" rel="stylesheet">

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
      <h3 style="padding-bottom: 2%;">소통 게시판</h3>
      <div id="board">
        <div id="board-content">
          <table class="table">
            <div id="board-top-content">
              	<form action="/board/search.dog" method="get">
	              <div id="select">
	                <select name="searchCondition">
	                  <option value="all" <c:if test="${searchCondition == 'all' }">selected</c:if>>전체</option>
	                  <option value="writer" <c:if test="${searchCondition == 'writer' }">selected</c:if>>작성자</option>
	                  <option value="title" <c:if test="${searchCondition == 'title' }">selected</c:if>>제목</option>
	                  <option value="content" <c:if test="${searchCondition == 'content' }">selected</c:if>>내용</option>
	                </select>
	          </div>
	              <div id="search">
	                <input id="search-value" type="text" name="searchKeyword" placeholder="Search" value="${searchKeyword }">
	              </div>
	              <div id="search-btn">
	                <input id="search-btn" type="submit" value="검색">
	              </div>
              	</form>
            </div>
            <colgroup>
              <col width="5%" />
              <col width="35%" />
              <col width="10%" />
              <col width="10%" />
              <col width="5%" />
            </colgroup>
            <tr>
              <th id="number-value">번호</th>
              <th>글 제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th id="number-value">조회수</th>
            </tr>
            <c:forEach var="board" items="${bList }">
	            <tr>
	              <td id="number-value">${board.boardNo }</td>
	              <c:url var="detailUrl" value="/board/detail.dog">
	              	<c:param name="boardNo" value="${board.boardNo }"></c:param>
	              </c:url>
	              <td><a href="${detailUrl }">${board.boardTitle }</a></td>
	              <td>${board.userNickName }</td>
	              <td>
	              	<fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd"/>
	              </td>
	              <td id="number-value">${board.viewCount }</td>
	            </tr>
            </c:forEach>
            </table>
            <div id="paging">
	        	<tr align="center">
	          	<td colspan="5">
	          		<c:if test="${bpInfo.startNavi != 1}">
	          			<c:url var="prevUrl" value="/board/search.dog?searchCondition=${searchCondition }&searchKeyword=${searchKeyword }">
	          				<c:param name="page" value="${bpInfo.startNavi - 1 }"></c:param>
	          			</c:url>
	          			<a href="${prevUrl }">◀</a>
	          		</c:if>
	          		<c:forEach begin="${bpInfo.startNavi }" end="${bpInfo.endNavi }" var="p">
	          			<c:url var="pageUrl" value="/board/search.dog?searchCondition=${searchCondition }&searchKeyword=${searchKeyword }">
	          				<c:param name="page" value="${p }"></c:param>
	          			</c:url>
	          			<a href="${pageUrl }">${p }</a>&nbsp;
	          		</c:forEach>
	          		<c:if test="${bpInfo.endNavi != bpInfo.naviTotalCount}">
						<c:url var="nextUrl" value="/board/search.dog?searchCondition=${searchCondition }&searchKeyword=${searchKeyword }">
							<c:param name="page" value="${bpInfo.endNavi + 1 }"></c:param>
						</c:url>          		
	          			<a href="${nextUrl }">▶</a>
	          		</c:if>
	          	</td>
	          </tr>
            </div>
          <div id="create-btn">
            <input id="create-btn" type="button" value="글 작성" onClick="checkLogin()">
          </div>
        </div>
      </div>
    </div>
  </main>
  <script>
  function checkLogin(){
	  var sessionId = "${sessionScope.userId}";
	  
	  if(sessionId === null || sessionId === ""){
		  alert("글작성을 하려면 로그인이 필요합니다");
		  window.location.href="/user/login.dog";
	  }else{
		  window.location.href="/board/write.dog";
	  }
  }
  </script>
  
  <!-- footer -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

</body>
</html>