<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>WIMF - Where Is My Family?</title>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <!-- <link href="assets/img/favicon.png" rel="icon"> -->
  <!-- <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->

  <link href="/img/favicon.png" rel="icon">
  <link href="/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <!-- <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet"> -->

  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <!-- <link href="assets/css/main.css" rel="stylesheet"> -->

  <link href="/css/header.css" rel="stylesheet">
  <link href="/css/footer.css" rel="stylesheet">
  <link href="/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Append
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/append-bootstrap-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  <!-- 풀캘린더 -->
  <link href='/vendor/fullcalendar-5/lib/main.css' rel='stylesheet' />
    <script src='/vendor/fullcalendar-5/lib/main.js'></script>
    <script>
      document.addEventListener('DOMContentLoaded', function () {
        $(function getCalendar() {
          var request = $.ajax({
              url: "/calendar/list.dog",
              method: "GET"
          });

          request.done(function (data) {
            console.log(data); // log 로 데이터 찍어주기.

            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
              schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	// 고급 플러그인 무료
              initialView: 'dayGridMonth',		// 처음 캘린더 형식
              titleFormat: function (date) {	// 날짜 표시 형식
                year = date.date.year;
                month = date.date.month + 1;

                return year + "년 " + month + "월";
              },
              headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
              },
              editable: true,
              droppable: true, // this allows things to be dropped onto the calendar
              selectable: true,	// 날짜 선택
              drop: function (arg) {
                // is the "remove after drop" checkbox checked?
                if (document.getElementById('drop-remove').checked) {
                  // if so, remove the element from the "Draggable Events" list
                  arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                }
              },
              events: data.map(function(event) {
                return {
                  title: event.title,
                  start: event.start,
                  end: event.end,
                  backgroundColor: getColorByOption(event.option),	// 옵션값에 따라 배경색 동적 할당
                  borderColor: getColorByOption(event.option)
                }
              }),
                
              /**
               * 드래그로 이벤트 수정하기
               */
              eventDrop: function (info){
                if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){

                var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                var obj = new Object();

                obj.title = info.event._def.title;
                obj.start = info.event._instance.range.start;
                obj.end = info.event._instance.range.end;

                obj.oldTitle = info.oldEvent._def.title;
                obj.oldStart = info.oldEvent._instance.range.start;
                obj.oldEnd = info.oldEvent._instance.range.end;

                events.push(obj);

                console.log(events);
                } else {
                  updateFullCalendar();
                }
                $(function modifyData() {
                  $.ajax({
                    url: "/calendar/update.dog",
                    method: "POST",
                    data: JSON.stringify(events),
                    contentType: 'application/json',
                    success: function (response) {
                      if(response == "success"){
                        // 성공적으로 등록되면 부모 창의 함수를 호출하여 메인 페이지의 풀캘린더를 업데이트
                        getCalendar();
                        
                        // 등록 성공 알림
                        alert('일정 수정 성공');
                      }
                    },
                    error: function (error) {
                      console.log(error);
                      // 실패 시에 대한 처리 추가
                      
                      // 등록 실패 알림
                      alert('일정 수정 실패');
                    }
                  })
                })
              },
              eventResize: function (info){
                console.log(info);
                if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){

                var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                var obj = new Object();

                obj.title = info.event._def.title;
                obj.start = info.event._instance.range.start;
                obj.end = info.event._instance.range.end;

                obj.oldTitle = info.oldEvent._def.title;
                obj.oldStart = info.oldEvent._instance.range.start;
                obj.oldEnd = info.oldEvent._instance.range.end;

                events.push(obj);

                console.log(events);
                } else {
                  updateFullCalendar();
                }
                $(function modifyData() {
                  $.ajax({
                    url: "/calendar/update.dog",
                    method: "POST",
                    data: JSON.stringify(events),
                    contentType: 'application/json',
                    success: function (response) {
                      if(response == "success"){
                        // 성공적으로 등록되면 부모 창의 함수를 호출하여 메인 페이지의 풀캘린더를 업데이트
                        getCalendar();
                        
                        // 등록 성공 알림
                        alert('일정 수정 성공');
                      }
                    },
                    error: function (error) {
                      console.log(error);
                      // 실패 시에 대한 처리 추가
                      
                      // 등록 실패 알림
                      alert('일정 수정 실패');
                    }
                  })
                })
              },
          
              /**
               * 이벤트 선택해서 삭제하기
               */
              eventClick: function (info){
                if(confirm("'"+ info.event.title +"' 일정을 삭제하시겠습니까 ?")){
                  // 확인 클릭 시
                  info.event.remove();

                  console.log(info.event);
                  var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                  var obj = new Object();
                  obj.title = info.event._def.title;
                  obj.start = info.event._instance.range.start;
                  obj.end = info.event._instance.range.end;
                  obj.id = info.event._def.defId;
                  
                  events.push(obj);

                  console.log(events);
                }
                $(function deleteData(){
                  $.ajax({
                    url: "/calendar/delete.dog",
                    method: "POST",
                    data: JSON.stringify(events),
                    contentType: 'application/json',
                    success: function (response) {
                      if(response == "success"){
                        // 성공적으로 삭제시 메인 페이지의 풀캘린더를 업데이트
                        getCalendar();
                        
                        // 삭제 성공 알림
                        alert('일정 삭제 성공');
                      }
                    },
                    error: function (response) {
                      console.log(error);
                      // 실패 시에 대한 처리 추가
                      
                      // 삭제 실패 알림
                      alert('일정 삭제 실패');
                    }
                  })
                })
              },
              
              dateClick: function dateClick(info) {
                // 선택된 날짜 정보를 가져옵니다.
                var selectedDate = info.date;

                // 날짜를 "YYYY-MM-DD" 형식의 문자열로 변환합니다.
                var formattedDate = selectedDate.toISOString().split('T')[0];

                // Ajax 요청을 보낼 데이터를 준비합니다.
                var requestData = {
                  date: formattedDate
                };

                // Ajax 요청을 보냅니다.
                $.ajax({
                  url: '/calendar/getEventListByDate.dog',
                  method: 'GET',
                  data: requestData,
                  success: function(response) {
                    // 서버로부터 받은 데이터를 이용하여 이벤트 목록을 업데이트합니다.
                    getEventListByDate(response);
                  },
                  error: function(error) {
                    console.error('Ajax request failed:', error);
                  }
                });
              },
              locale: 'ko',
              // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
              //
              // },
              
              // url로 이동
              /* eventClick: function(info) {
                window.location.href(info.event.url);
              } */
            });
            calendar.render();
          });

          request.fail(function( jqXHR, textStatus ) {
            alert( "Request failed: " + textStatus );
          });
        });
      });
      
      /* 풀캘린더 리로드 */
      function updateFullCalendar() {
        var request = $.ajax({
          url: "/calendar/list.dog",
          method: "GET"
        });

        request.done(function (data) {
          console.log(data); // log 로 데이터 찍어주기.

          var calendarEl = document.getElementById('calendar');

          var calendar = new FullCalendar.Calendar(calendarEl, {
            schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	// 고급 플러그인 무료
            initialView: 'dayGridMonth',		// 처음 캘린더 형식
            titleFormat: function (date) {	// 날짜 표시 형식
              year = date.date.year;
              month = date.date.month + 1;

              return year + "년 " + month + "월";
            },
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
            },
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            selectable: true,	// 날짜 선택
            drop: function (arg) {
              // is the "remove after drop" checkbox checked?
              if (document.getElementById('drop-remove').checked) {
                // if so, remove the element from the "Draggable Events" list
                arg.draggedEl.parentNode.removeChild(arg.draggedEl);
              }
            },
            events: data.map(function(event) {
              return {
                title: event.title,
                start: event.start,
                end: event.end,
                backgroundColor: getColorByOption(event.option),	// 옵션값에 따라 배경색 동적 할당
                borderColor: getColorByOption(event.option)
              }
            }),
              
            /**
             * 드래그로 이벤트 수정하기
             */
            eventDrop: function (info){
              if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){

              var events = new Array(); // Json 데이터를 받기 위한 배열 선언
              var obj = new Object();

              obj.title = info.event._def.title;
              obj.start = info.event._instance.range.start;
              obj.end = info.event._instance.range.end;

              obj.oldTitle = info.oldEvent._def.title;
              obj.oldStart = info.oldEvent._instance.range.start;
              obj.oldEnd = info.oldEvent._instance.range.end;

              events.push(obj);

              console.log(events);
              } else {
                updateFullCalendar();
              }
              $(function modifyData() {
                $.ajax({
                  url: "/calendar/update.dog",
                  method: "POST",
                  data: JSON.stringify(events),
                  contentType: 'application/json',
                  success: function (response) {
                    if(response == "success"){
                      // 성공적으로 등록되면 부모 창의 함수를 호출하여 메인 페이지의 풀캘린더를 업데이트
                      getCalendar();
                      
                      // 등록 성공 알림
                      alert('일정 수정 성공');
                    }
                  },
                  error: function (error) {
                    console.log(error);
                    // 실패 시에 대한 처리 추가
                    
                    // 등록 실패 알림
                    alert('일정 수정 실패');
                  }
                })
              })
            },
            eventResize: function (info){
              console.log(info);
              if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){

              var events = new Array(); // Json 데이터를 받기 위한 배열 선언
              var obj = new Object();

              obj.title = info.event._def.title;
              obj.start = info.event._instance.range.start;
              obj.end = info.event._instance.range.end;

              obj.oldTitle = info.oldEvent._def.title;
              obj.oldStart = info.oldEvent._instance.range.start;
              obj.oldEnd = info.oldEvent._instance.range.end;

              events.push(obj);

              console.log(events);
              } else {
                updateFullCalendar();
              }
              $(function modifyData() {
                $.ajax({
                  url: "/calendar/update.dog",
                  method: "POST",
                  data: JSON.stringify(events),
                  contentType: 'application/json',
                  success: function (response) {
                    if(response == "success"){
                      // 성공적으로 등록되면 부모 창의 함수를 호출하여 메인 페이지의 풀캘린더를 업데이트
                      getCalendar();
                      
                      // 등록 성공 알림
                      alert('일정 수정 성공');
                    }
                  },
                  error: function (error) {
                    console.log(error);
                    // 실패 시에 대한 처리 추가
                    
                    // 등록 실패 알림
                    alert('일정 수정 실패');
                  }
                })
              })
            },
        
            /**
             * 이벤트 선택해서 삭제하기
             */
            eventClick: function (info){
              if(confirm("'"+ info.event.title +"' 일정을 삭제하시겠습니까 ?")){
                // 확인 클릭 시
                info.event.remove();

                console.log(info.event);
                var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                var obj = new Object();
                obj.title = info.event._def.title;
                obj.start = info.event._instance.range.start;
                obj.end = info.event._instance.range.end;
                obj.id = info.event._def.defId;
                
                events.push(obj);

                console.log(events);
              }
              $(function deleteData(){
                $.ajax({
                  url: "/calendar/delete.dog",
                  method: "POST",
                  data: JSON.stringify(events),
                  contentType: 'application/json',
                  success: function (response) {
                    if(response == "success"){
                      // 성공적으로 삭제시 메인 페이지의 풀캘린더를 업데이트
                      getCalendar();
                      
                      // 삭제 성공 알림
                      alert('일정 삭제 성공');
                    }
                  },
                  error: function (response) {
                    console.log(error);
                    // 실패 시에 대한 처리 추가
                    
                    // 삭제 실패 알림
                    alert('일정 삭제 실패');
                  }
                })
              })
            },
            
            dateClick: function dateClick(info) {
              // 선택된 날짜 정보를 가져옵니다.
              var selectedDate = info.date;

              // 날짜를 "YYYY-MM-DD" 형식의 문자열로 변환합니다.
              var formattedDate = selectedDate.toISOString().split('T')[0];

              // Ajax 요청을 보낼 데이터를 준비합니다.
              var requestData = {
                date: formattedDate
              };

              // Ajax 요청을 보냅니다.
              $.ajax({
                url: '/calendar/getEventListByDate.dog',
                method: 'GET',
                data: requestData,
                success: function(response) {
                  // 서버로부터 받은 데이터를 이용하여 이벤트 목록을 업데이트합니다.
                  getEventListByDate(response);
                },
                error: function(error) {
                  console.error('Ajax request failed:', error);
                }
              });
            },
            locale: 'ko',
            // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
            //
            // },
            
            // url로 이동
            /* eventClick: function(info) {
              window.location.href(info.event.url);
            } */
          });
          calendar.render();
        });

        request.fail(function( jqXHR, textStatus ) {
          alert( "Request failed: " + textStatus );
        });
      }
      
    </script>
	<link href="/css/index/fullCalendar.css" rel="stylesheet">
</head>

<body class="index-page" data-bs-spy="scroll" data-bs-target="#navmenu">

	<!-- header -->
  <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>





















  <main id="main">

    <!-- Hero Section - Home Page -->
    <section id="hero" class="hero">

      <img src="/img/dog/main-dog.jpg" alt="메인 사진" data-aos="fade-in">

      <div class="container">
        <div class="row">
          <div class="col-lg-10">
            <h2 data-aos="fade-up" data-aos-delay="100">WIMF</h2>
            <p data-aos="fade-up" data-aos-delay="200">Where Is My Family?</p>
          </div>
          <div class="col-lg-5">
            <!-- <form action="#" class="sign-up-form d-flex" data-aos="fade-up" data-aos-delay="300">
              <input type="text" class="form-control" placeholder="Enter email address">
              <input type="submit" class="btn btn-primary" value="Sign up">
            </form> -->
          </div>
        </div>
      </div>

    </section><!-- End Hero Section -->

    <!-- Clients Section - Home Page -->
    <section id="clients" class="clients">

      <div class="container-fluid" data-aos="fade-up">

        <div class="row gy-4">

          <div class="col-xl-2 col-md-3 col-6 client-logo">
            <img src="/img/clients/client-1.png" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
            <img src="/img/clients/client-2.png" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
            <img src="/img/clients/client-3.png" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
            <img src="/img/clients/client-4.png" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
            <img src="/img/clients/client-5.png" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
            <img src="/img/clients/싱글벙글 댕댕이의 세계_.JPG" class="img-fluid" alt="">
          </div><!-- End Client Item -->

        </div>

      </div>

    </section><!-- End Clients Section -->

    <!-- Stats Section - Home Page -->
    <section id="stats" class="stats">

      <img src="/img/stats-bg.jpg" alt="" data-aos="fade-in">

      <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
              <p>돌봄 진행 수</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
              <p>입양 진행 수</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="1453" data-purecounter-duration="1" class="purecounter"></span>
              <p>보호 강아지 수</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="32" data-purecounter-duration="1" class="purecounter"></span>
              <p>안락사 수</p>
            </div>
          </div><!-- End Stats Item -->

        </div>

      </div>

    </section><!-- End Stats Section -->

    













    <!-- Pricing Section - Home Page -->
    <c:if test="${sessionScope.userId ne null}">
    
    <section id="pricing" class="pricing">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Calendar</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row g-4">

          <!-- <div class="col"> -->
            <!-- <div class="pricing-item">
              <h3>Free Plan</h3>
              <div class="icon">
                <i class="bi bi-box"></i>
              </div>
              <h4><sup>$</sup>0<span> / month</span></h4>
              <ul>
                <li><i class="bi bi-check"></i> <span>Quam adipiscing vitae proin</span></li>
                <li><i class="bi bi-check"></i> <span>Nec feugiat nisl pretium</span></li>
                <li><i class="bi bi-check"></i> <span>Nulla at volutpat diam uteera</span></li>
                <li class="na"><i class="bi bi-x"></i> <span>Pharetra massa massa ultricies</span></li>
                <li class="na"><i class="bi bi-x"></i> <span>Massa ultricies mi quis hendrerit</span></li>
              </ul>
              <div class="text-center"><a href="#" class="buy-btn">Buy Now</a></div>
            </div> -->
          <!-- </div> -->
          <!-- End Pricing Item -->

          <!-- <div class="col-lg-12"> -->
            <div class="pricing-item"> <!-- class="featured" -->
            <div id='calendar'></div>
            <!-- 날짜 누르면 표시되는 날짜에 대한 일정 가져오기 div -->
            <div class="calendarList" id="calendarList">
              <ul id="eventList">
                <li></li>
              </ul>
            </div>
            
            
              <!-- <h3>Business Plan</h3>
              <div class="icon">
                <i class="bi bi-rocket"></i>
              </div>

              <h4><sup>$</sup>29<span> / month</span></h4>
              <ul>
                <li><i class="bi bi-check"></i> <span>Quam adipiscing vitae proin</span></li>
                <li><i class="bi bi-check"></i> <span>Nec feugiat nisl pretium</span></li>
                <li><i class="bi bi-check"></i> <span>Nulla at volutpat diam uteera</span></li>
                <li><i class="bi bi-check"></i> <span>Pharetra massa massa ultricies</span></li>
                <li><i class="bi bi-check"></i> <span>Massa ultricies mi quis hendrerit</span></li>
              </ul> -->
              <div class="text-center">              
                <button type="button" onclick="openPopup1();" class="buy-btn text-center calendarPopupBtn">등록</button>
              </div>
            </div>
          <!-- </div> -->
          <!-- End Pricing Item -->

          <!-- <div class="col"> -->
            <!-- <div class="pricing-item">
              <h3>Developer Plan</h3>
              <div class="icon">
                <i class="bi bi-send"></i>
              </div>
              <h4><sup>$</sup>49<span> / month</span></h4>
              <ul>
                <li><i class="bi bi-check"></i> <span>Quam adipiscing vitae proin</span></li>
                <li><i class="bi bi-check"></i> <span>Nec feugiat nisl pretium</span></li>
                <li><i class="bi bi-check"></i> <span>Nulla at volutpat diam uteera</span></li>
                <li><i class="bi bi-check"></i> <span>Pharetra massa massa ultricies</span></li>
                <li><i class="bi bi-check"></i> <span>Massa ultricies mi quis hendrerit</span></li>
              </ul>
              <div class="text-center"><a href="#" class="buy-btn">Buy Now</a></div>
            </div> -->
          <!-- </div> -->
          <!-- End Pricing Item -->

        </div>

      </div>

    </section><!-- End Pricing Section -->
    
    </c:if>
















    

    <!-- Team Section - Home Page -->
    <section id="team dogSection" class="team">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>돌봄 대기리스트</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-5">

          <c:forEach var="combinedList" items="${combinedList}" varStatus="loop">
            <c:if test="${loop.index < 6}">
            <!-- Start Team Member -->
              <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="100">
                <div class="member-img">
                  <img src="${combinedList.dogFile.dogFilePath}" class="img-fluid" alt="${combinedList.dogFile.dogFileName}">
                  <div class="social" onclick="showDogDetail(${combinedList.dog.dogNo})">
                    <a href="/dog/detail.dog?dogNo=${combinedList.dog.dogNo }">보러가기</a>
                    <!-- <a href="#"><i class="bi bi-twitter"></i></a>
                    <a href="#"><i class="bi bi-facebook"></i></a>
                    <a href="#"><i class="bi bi-instagram"></i></a>
                    <a href="#"><i class="bi bi-linkedin"></i></a> -->
                  </div>
                </div>
                <div class="member-info text-center">
                  <h4>${combinedList.dog.dogName }</h4>
                  <span>${combinedList.dog.dogWeight }kg, ${combinedList.dog.dogAge }살</span>
                  <p>${combinedList.dog.dogInfo }</p>
                </div>
              </div>
            <!-- End Team Member -->
            </c:if>
          </c:forEach>

          <!-- <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="200">
            <div class="member-img">
              <img src="/img/team/team-2.jpg" class="img-fluid" alt="">
              <div class="social">
                <a href="#"><i class="bi bi-twitter"></i></a>
                <a href="#"><i class="bi bi-facebook"></i></a>
                <a href="#"><i class="bi bi-instagram"></i></a>
                <a href="#"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
            <div class="member-info text-center">
              <h4>Sarah Jhonson</h4>
              <span>Product Manager</span>
              <p>Labore ipsam sit consequatur exercitationem rerum laboriosam laudantium aut quod dolores exercitationem ut</p>
            </div>
          </div>End Team Member

          <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="300">
            <div class="member-img">
              <img src="/img/team/team-3.jpg" class="img-fluid" alt="">
              <div class="social">
                <a href="#"><i class="bi bi-twitter"></i></a>
                <a href="#"><i class="bi bi-facebook"></i></a>
                <a href="#"><i class="bi bi-instagram"></i></a>
                <a href="#"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
            <div class="member-info text-center">
              <h4>William Anderson</h4>
              <span>CTO</span>
              <p>Illum minima ea autem doloremque ipsum quidem quas aspernatur modi ut praesentium vel tque sed facilis at qui</p>
            </div>
          </div>End Team Member

          <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="400">
            <div class="member-img">
              <img src="/img/team/team-4.jpg" class="img-fluid" alt="">
              <div class="social">
                <a href="#"><i class="bi bi-twitter"></i></a>
                <a href="#"><i class="bi bi-facebook"></i></a>
                <a href="#"><i class="bi bi-instagram"></i></a>
                <a href="#"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
            <div class="member-info text-center">
              <h4>Amanda Jepson</h4>
              <span>Accountant</span>
              <p>Magni voluptatem accusamus assumenda cum nisi aut qui dolorem voluptate sed et veniam quasi quam consectetur</p>
            </div>
          </div>End Team Member

          <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="500">
            <div class="member-img">
              <img src="/img/team/team-5.jpg" class="img-fluid" alt="">
              <div class="social">
                <a href="#"><i class="bi bi-twitter"></i></a>
                <a href="#"><i class="bi bi-facebook"></i></a>
                <a href="#"><i class="bi bi-instagram"></i></a>
                <a href="#"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
            <div class="member-info text-center">
              <h4>Brian Doe</h4>
              <span>Marketing</span>
              <p>Qui consequuntur quos accusamus magnam quo est molestiae eius laboriosam sunt doloribus quia impedit laborum velit</p>
            </div>
          </div>End Team Member

          <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="600">
            <div class="member-img">
              <img src="/img/team/team-6.jpg" class="img-fluid" alt="">
              <div class="social">
                <a href="#"><i class="bi bi-twitter"></i></a>
                <a href="#"><i class="bi bi-facebook"></i></a>
                <a href="#"><i class="bi bi-instagram"></i></a>
                <a href="#"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
            <div class="member-info text-center">
              <h4>Josepha Palas</h4>
              <span>Operation</span>
              <p>Sint sint eveniet explicabo amet consequatur nesciunt error enim rerum earum et omnis fugit eligendi cupiditate vel</p>
            </div>
          </div>End Team Member

        </div>

      </div>

    </section>End Team Section -->

    <!-- Call-to-action Section - Home Page -->
    <section id="call-to-action" class="call-to-action">

      <img src="/img/cta-bg.jpg" alt="">

      <div class="container">
        <div class="row justify-content-center" data-aos="zoom-in" data-aos-delay="100">
          <div class="col-xl-10">
            <div class="text-center">
              <h3>후원을 기다립니다</h3>
              <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <a class="cta-btn" href="#">후원하기</a>
            </div>
          </div>
        </div>
      </div>

    </section><!-- End Call-to-action Section -->

    <!-- Testimonials Section - Home Page -->
    <section id="testimonials" class="testimonials">

      <div class="container">

        <div class="row align-items-center">

          <div class="col-lg-5 info" data-aos="fade-up" data-aos-delay="100">
            <h3>돌봄 후기</h3>
            <p>
              돌봄으로 나눈 마음을 공유해주세요!
            </p>
          </div>

          <div class="col-lg-7" data-aos="fade-up" data-aos-delay="200">

            <div class="swiper">
              <template class="swiper-config">
                {
                "loop": true,
                "speed" : 600,
                "autoplay": {
                "delay": 3000
                },
                "slidesPerView": "auto",
                "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
                }
                }
              </template>
              <div class="swiper-wrapper">

                <!-- Start testimonial item -->
                <div class="swiper-slide">
                  <div class="testimonial-item">
                    <div class="d-flex">
                      <img src="/img/testimonials/testimonials-1.jpg" class="testimonial-img flex-shrink-0" alt="">
                      <div>
                        <h3>Saul Goodman</h3>
                        <h4>Ceo & Founder</h4>
                        <div class="stars">
                          <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                      </div>
                    </div>
                    <p>
                      <i class="bi bi-quote quote-icon-left"></i>
                      <span>정말 행복한 경험이었어요.</span>
                      <i class="bi bi-quote quote-icon-right"></i>
                    </p>
                  </div>
                </div>
                <!-- End testimonial item -->

                <div class="swiper-slide">
                  <div class="testimonial-item">
                    <div class="d-flex">
                      <img src="/img/testimonials/testimonials-2.jpg" class="testimonial-img flex-shrink-0" alt="">
                      <div>
                        <h3>Sara Wilsson</h3>
                        <h4>Designer</h4>
                        <div class="stars">
                          <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                      </div>
                    </div>
                    <p>
                      <i class="bi bi-quote quote-icon-left"></i>
                      <span>Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.</span>
                      <i class="bi bi-quote quote-icon-right"></i>
                    </p>
                  </div>
                </div><!-- End testimonial item -->

                <div class="swiper-slide">
                  <div class="testimonial-item">
                    <div class="d-flex">
                      <img src="/img/testimonials/testimonials-3.jpg" class="testimonial-img flex-shrink-0" alt="">
                      <div>
                        <h3>Jena Karlis</h3>
                        <h4>Store Owner</h4>
                        <div class="stars">
                          <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                      </div>
                    </div>
                    <p>
                      <i class="bi bi-quote quote-icon-left"></i>
                      <span>Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.</span>
                      <i class="bi bi-quote quote-icon-right"></i>
                    </p>
                  </div>
                </div><!-- End testimonial item -->

                <div class="swiper-slide">
                  <div class="testimonial-item">
                    <div class="d-flex">
                      <img src="/img/testimonials/testimonials-4.jpg" class="testimonial-img flex-shrink-0" alt="">
                      <div>
                        <h3>Matt Brandon</h3>
                        <h4>Freelancer</h4>
                        <div class="stars">
                          <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                      </div>
                    </div>
                    <p>
                      <i class="bi bi-quote quote-icon-left"></i>
                      <span>Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.</span>
                      <i class="bi bi-quote quote-icon-right"></i>
                    </p>
                  </div>
                </div><!-- End testimonial item -->

                <div class="swiper-slide">
                  <div class="testimonial-item">
                    <div class="d-flex">
                      <img src="/img/testimonials/testimonials-5.jpg" class="testimonial-img flex-shrink-0" alt="">
                      <div>
                        <h3>John Larson</h3>
                        <h4>Entrepreneur</h4>
                        <div class="stars">
                          <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                        </div>
                      </div>
                    </div>
                    <p>
                      <i class="bi bi-quote quote-icon-left"></i>
                      <span>Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.</span>
                      <i class="bi bi-quote quote-icon-right"></i>
                    </p>
                  </div>
                </div>
                <!-- End testimonial item -->

              </div>
              <div class="swiper-pagination"></div>
            </div>

          </div>

        </div>

      </div>

    </section><!-- End Testimonials Section -->

    <!-- Recent-posts Section - Home Page -->
    <section id="recent-posts boardSection" class="recent-posts">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>소통 게시판</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">


			<!-- Start post list item -->
          <!-- <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <article>

              <div class="post-img">
                <img src="/img/blog/blog-1.jpg" alt="" class="img-fluid">
              </div>

              <p class="post-category">Politics</p>

              <h2 class="title">
                <a href="blog-details.html">Dolorum optio tempore voluptas dignissimos</a>
              </h2>

              <div class="d-flex align-items-center">
                <img src="/img/blog/blog-author.jpg" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author">Maria Doe</p>
                  <p class="post-date">
                    <time datetime="2022-01-01">Jan 1, 2022</time>
                  </p>
                </div>
              </div>

            </article>
          </div> -->
          <!-- End post list item -->
          
          
          <c:forEach var="board" items="${bList}" varStatus="loop">
            <c:if test="${loop.index < 9}">
              <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                <article>
    
                  <!-- <div class="post-img">
                    <img src="/img/blog/blog-2.jpg" alt="" class="img-fluid">
                  </div> -->
    
                  <p class="post-category">조회수 : ${board.viewCount }</p>
                  <c:url var="detailUrl" value="/board/detail.dog">
                    <c:param name="boardNo" value="${board.boardNo }"></c:param>
                  </c:url>
                  <h2 class="title">
                    <a href="${detailUrl }">${board.boardTitle }</a>
                  </h2>
    
                  <div class="d-flex align-items-center">
                    <img src = "${board.userProfile }"alt="프로필사진" class="img-fluid post-author-img flex-shrink-0">
                    <div class="post-meta">
                      <p class="post-author">${board.userNickName }</p>
                      <p class="post-date">
                        <fmt:formatDate value="${board.createDate }" pattern="yyyy-MM-dd"/>
                      </p>
                    </div>
                  </div>
    
                </article>
              </div><!-- End post list item -->
            </c:if>
          </c:forEach>
			
          

			<!-- Start post list item -->
          <!-- <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <article>

              <div class="post-img">
                <img src="/img/blog/blog-3.jpg" alt="" class="img-fluid">
              </div>

              <p class="post-category">Entertainment</p>

              <h2 class="title">
                <a href="blog-details.html">Possimus soluta ut id suscipit ea ut in quo quia et soluta</a>
              </h2>

              <div class="d-flex align-items-center">
                <img src="/img/blog/blog-author-3.jpg" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author">Mark Dower</p>
                  <p class="post-date">
                    <time datetime="2022-01-01">Jun 22, 2022</time>
                  </p>
                </div>
              </div>

            </article>
          </div> -->
          <!-- End post list item -->

        </div><!-- End recent posts list -->

      </div>

    </section><!-- End Recent-posts Section -->

    

    




















    <!-- Portfolio Section - Home Page -->
    <section id="portfolio" class="portfolio">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Portfolio</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">

          <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-app">App</li>
            <li data-filter=".filter-product">Card</li>
            <li data-filter=".filter-branding">Web</li>
          </ul><!-- End Portfolio Filters -->

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <img src="/img/masonry-portfolio/masonry-portfolio-1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>App 1</h4>
                <p>Lorem ipsum, dolor sit</p>
                <a href="/img/masonry-portfolio/masonry-portfolio-1.jpg" title="App 1" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
              <img src="/img/masonry-portfolio/masonry-portfolio-2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Product 1</h4>
                <p>Lorem ipsum, dolor sit</p>
                <a href="/img/masonry-portfolio/masonry-portfolio-2.jpg" title="Product 1" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
              <img src="/img/masonry-portfolio/masonry-portfolio-3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Branding 1</h4>
                <p>Lorem ipsum, dolor sit</p>
                <a href="/img/masonry-portfolio/masonry-portfolio-3.jpg" title="Branding 1" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <img src="/img/masonry-portfolio/masonry-portfolio-4.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>App 2</h4>
                <p>Lorem ipsum, dolor sit</p>
                <a href="/img/masonry-portfolio/masonry-portfolio-4.jpg" title="App 2" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
              <img src="/img/masonry-portfolio/masonry-portfolio-5.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Product 2</h4>
                <p>Lorem ipsum, dolor sit</p>
                <a href="/img/masonry-portfolio/masonry-portfolio-5.jpg" title="Product 2" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
              <img src="/img/masonry-portfolio/masonry-portfolio-6.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Branding 2</h4>
                <p>Lorem ipsum, dolor sit</p>
                <a href="/img/masonry-portfolio/masonry-portfolio-6.jpg" title="Branding 2" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <img src="/img/masonry-portfolio/masonry-portfolio-7.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>App 3</h4>
                <p>Lorem ipsum, dolor sit</p>
                <a href="/img/masonry-portfolio/masonry-portfolio-7.jpg" title="App 3" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
              <img src="/img/masonry-portfolio/masonry-portfolio-8.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Product 3</h4>
                <p>Lorem ipsum, dolor sit</p>
                <a href="/img/masonry-portfolio/masonry-portfolio-8.jpg" title="Product 3" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
              <img src="/img/masonry-portfolio/masonry-portfolio-9.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>Branding 3</h4>
                <p>Lorem ipsum, dolor sit</p>
                <a href="/img/masonry-portfolio/masonry-portfolio-9.jpg" title="Branding 2" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="portfolio-details.html" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

          </div><!-- End Portfolio Container -->

        </div>

      </div>

    </section><!-- End Portfolio Section -->

    

    

    <!-- Features Section - Home Page -->
    <section id="features" class="features">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Features</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4 align-items-center features-item">
          <div class="col-lg-5 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
            <h3>Corporis temporibus maiores provident</h3>
            <p>
              Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
              velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.
            </p>
            <a href="#" class="btn btn-get-started">Get Started</a>
          </div>
          <div class="col-lg-7 order-1 order-lg-2 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="100">
            <div class="image-stack">
              <img src="/img/features-light-1.jpg" alt="" class="stack-front">
              <img src="/img/features-light-2.jpg" alt="" class="stack-back">
            </div>
          </div>
        </div><!-- Features Item -->

        <div class="row gy-4 align-items-stretch justify-content-between features-item ">
          <div class="col-lg-6 d-flex align-items-center features-img-bg" data-aos="zoom-out">
            <img src="/img/features-light-3.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-5 d-flex justify-content-center flex-column" data-aos="fade-up">
            <h3>Sunt consequatur ad ut est nulla</h3>
            <p>Cupiditate placeat cupiditate placeat est ipsam culpa. Delectus quia minima quod. Sunt saepe odit aut quia voluptatem hic voluptas dolor doloremque.</p>
            <ul>
              <li><i class="bi bi-check"></i> <span>Ullamco laboris nisi ut aliquip ex ea commodo consequat.</span></li>
              <li><i class="bi bi-check"></i><span> Duis aute irure dolor in reprehenderit in voluptate velit.</span></li>
              <li><i class="bi bi-check"></i> <span>Facilis ut et voluptatem aperiam. Autem soluta ad fugiat</span>.</li>
            </ul>
            <a href="#" class="btn btn-get-started align-self-start">Get Started</a>
          </div>
        </div><!-- Features Item -->

      </div>

    </section><!-- End Features Section -->






























    <!-- Services Section - Home Page -->
    <section id="services" class="services">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>'임시보호' 란?</h2>
        <p>What is fostering?</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="100">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-briefcase"></i></div>
              <div>
                <h4 class="title"><a href="services-details.html" class="stretched-link">Lorem Ipsum</a></h4>
                <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
              </div>
            </div>
          </div>
          <!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="200">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-card-checklist"></i></div>
              <div>
                <h4 class="title"><a href="services-details.html" class="stretched-link">Dolor Sitema</a></h4>
                <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="300">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-bar-chart"></i></div>
              <div>
                <h4 class="title"><a href="services-details.html" class="stretched-link">Sed ut perspiciatis</a></h4>
                <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="400">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-binoculars"></i></div>
              <div>
                <h4 class="title"><a href="services-details.html" class="stretched-link">Magni Dolores</a></h4>
                <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="500">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-brightness-high"></i></div>
              <div>
                <h4 class="title"><a href="services-details.html" class="stretched-link">Nemo Enim</a></h4>
                <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="600">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-calendar4-week"></i></div>
              <div>
                <h4 class="title"><a href="services-details.html" class="stretched-link">Eiusmod Tempor</a></h4>
                <p class="description">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi</p>
              </div>
            </div>
          </div><!-- End Service Item -->

        </div>

      </div>

    </section><!-- End Services Section -->

    <!-- Faq Section - Home Page -->
    <section id="faq" class="faq">

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="content px-xl-5">
              <h3><span>Frequently Asked </span><strong>Questions</strong></h3>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit
              </p>
            </div>
          </div>

          <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">

            <div class="faq-container">
              <div class="faq-item faq-active">
                <h3><span class="num">1.</span> <span>Non consectetur a erat nam at lectus urna duis?</span></h3>
                <div class="faq-content">
                  <p>Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3><span class="num">2.</span> <span>Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque?</span></h3>
                <div class="faq-content">
                  <p>Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3><span class="num">3.</span> <span>Dolor sit amet consectetur adipiscing elit pellentesque?</span></h3>
                <div class="faq-content">
                  <p>Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3><span class="num">4.</span> <span>Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla?</span></h3>
                <div class="faq-content">
                  <p>Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3><span class="num">5.</span> <span>Tempus quam pellentesque nec nam aliquam sem et tortor consequat?</span></h3>
                <div class="faq-content">
                  <p>Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

            </div>

          </div>
        </div>

      </div>

    </section><!-- End Faq Section -->
    

    <!-- About Section - Home Page -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <div class="row align-items-xl-center gy-5">

          <div class="col-xl-5 content">
            <h3>About Us</h3>
            <h2>Team WIMF</h2>
            <p>
              Where Is My Family?
              <br>
              벽이 높은 임시보호에 부담을 덜어드립니다.
            </p>
            <a href="#" class="read-more"><span>Read More</span><i class="bi bi-arrow-right"></i></a>
          </div>

          <div class="col-xl-7">
            <div class="row gy-4 icon-boxes">

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                <div class="icon-box">
                  <i class="bi bi-buildings"></i>
                  <h3>믿을 수 있는 규모</h3>
                  <p>Magni repellendus vel ullam hic officia accusantium ipsa dolor omnis dolor voluptatem</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="300">
                <div class="icon-box">
                  <i class="bi bi-clipboard-pulse"></i>
                  <h3>확실한 체계</h3>
                  <p>Autem saepe animi et aut aspernatur culpa facere. Rerum saepe rerum voluptates quia</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="400">
                <div class="icon-box">
                  <i class="bi bi-command"></i>
                  <h3>소통의 장</h3>
                  <p>Omnis perferendis molestias culpa sed. Recusandae quas possimus. Quod consequatur corrupti</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="500">
                <div class="icon-box">
                  <i class="bi bi-graph-up-arrow"></i>
                  <h3>높은 입양률</h3>
                  <p>Sint et dolor voluptas minus possimus nostrum. Reiciendis commodi eligendi omnis quideme lorenda</p>
                </div>
              </div> <!-- End Icon Box -->

            </div>
          </div>

        </div>
      </div>

    </section><!-- End About Section -->

    <!-- Contact Section - Home Page -->
    <section id="contact" class="contact">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Contact</h2>
        <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-6">

            <div class="row gy-4">
              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="200">
                  <i class="bi bi-geo-alt"></i>
                  <h3>Address</h3>
                  <p>A108 Adam Street</p>
                  <p>New York, NY 535022</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="300">
                  <i class="bi bi-telephone"></i>
                  <h3>Call Us</h3>
                  <p>+1 5589 55488 55</p>
                  <p>+1 6678 254445 41</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="400">
                  <i class="bi bi-envelope"></i>
                  <h3>Email Us</h3>
                  <p>info@example.com</p>
                  <p>contact@example.com</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="500">
                  <i class="bi bi-clock"></i>
                  <h3>Open Hours</h3>
                  <p>Monday - Friday</p>
                  <p>9:00AM - 05:00PM</p>
                </div>
              </div><!-- End Info Item -->

            </div>

          </div>

          <div class="col-lg-6">
            <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="200">
              <div class="row gy-4">

                <div class="col-md-6">
                  <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                </div>

                <div class="col-md-6 ">
                  <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                </div>

                <div class="col-md-12">
                  <input type="text" class="form-control" name="subject" placeholder="Subject" required>
                </div>

                <div class="col-md-12">
                  <textarea class="form-control" name="message" rows="6" placeholder="Message" required></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>

                  <button type="submit">Send Message</button>
                </div>

              </div>
            </form>
          </div><!-- End Contact Form -->

        </div>

      </div>

    </section><!-- End Contact Section -->

  </main>







<!-- footer -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>


  <!-- Preloader -->
  <div id="preloader">
    <div></div>
    <div></div>
    <div></div>
    <div></div>
  </div>

  <!-- Vendor JS Files -->
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/vendor/aos/aos.js"></script>
  <script src="/vendor/php-email-form/validate.js"></script>
  
  <script>
  	// 팝업창 열기
    function openPopup1() {
      var width = 800;
      var height = 800;
      var left = (window.innerWidth - width) / 2;
      var top = (window.innerHeight - height) / 2;
      var noticeWin = window.open("/calendar/popup.dog", "Popup", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
      if (!noticeWin) {
        alert("팝업이 차단되었습니다. 팝업차단을 해제해주세요.");
      }
    }
  	
    /* 캘린더 업데이트 되면 캘린더 리로드 */
    window.addEventListener('updateCalendarEvent', function () {
        getCalendar();
      });
    
    /* 날짜에 따른 캘린더 정보 가져오기 */
    function getEventListByDate(events) {
    	
   	  $('#calendarList').css('display', 'none');
      
  	  console.log("Function called");
  	  console.log(events);

	  // id가 'eventList'인 UL 엘리먼트를 가져옵니다.
      var ulElement = $('#eventList');
        console.log(ulElement);

	    // 기존 콘텐츠를 지웁니다.
      	ulElement.empty();

	    // 받아온 이벤트 목록을 순회하면서 li 엘리먼트를 생성하고 추가합니다.
      	events.forEach(function(event, index) {
	        // 각 li 엘리먼트에 고유한 id를 만듭니다.
	        var liId = 'eventItem_' + index;
	
	        // 해당 li 엘리먼트를 만듭니다.
	        var liElement = $('<li>').attr('id', liId);
	
	        // 이벤트 정보를 li 엘리먼트에 추가합니다.
	        liElement.html('• 제목 : ' + event.title
	          + '&emsp;&emsp;&emsp; • 강아지 번호 : ' + event.dogNo
	          + '&emsp;&emsp;&emsp; • 강아지 : ' + event.dogName
	          + '&emsp;&emsp;&emsp; • 기간 : ' + event.start + ' ~ ' + event.end);
	          + '&emsp;&emsp;&emsp; • 내용 : ' + event.content
	
	        // ul에 li 엘리먼트를 추가합니다.
	        ulElement.append(liElement);
          
            if (ulElement.children().length > 0) {
       	      $('#calendarList').css('display', 'block');
       	    } else {
       	      $('#calendarList').css('display', 'none');
       	    }
      });
    }
    
 	/* 옵션값에 따른 배경색을 동적으로 할당 */
    function getColorByOption(option) {
      switch (option) {
        case '후원':
          return '#e84545';
        case '임시보호':
          return '#3788d8';
        default:
          return '#3788d8'; // 기본 값
      }
    }
    
 	/* 강아지 번호로 dogDetail 페이지로 이동 */
    function showDogDetail(dogNo) {    	    	    	       	       
      var url = "/dog/detail.dog?dogNo=" + dogNo;
      window.location.href = url;	    	    
    }	
 	
    
  </script>

</body>

</html>