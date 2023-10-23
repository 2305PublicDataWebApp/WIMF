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

  <link href="/img/favicon.png" rel="icon">
  <link href="/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">

  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="/vendor/aos/aos.css" rel="stylesheet">

  <link href="/css/header.css" rel="stylesheet">
  <link href="/css/footer.css" rel="stylesheet">
  <link href="/css/main.css" rel="stylesheet">
  
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
              /* headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
              }, */
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
            /* headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
            }, */
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
	<link href="/css/index/index.css" rel="stylesheet">
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
        </div>
      </div>

    </section><!-- End Hero Section -->

    <!-- Clients Section - Home Page -->
    <section id="clients" class="clients">

      <div class="container-fluid" data-aos="fade-up">

        <div class="row gy-4">

          <div class="col-xl-2 col-md-3 col-6 client-logo">
          	<img src="/img/main/동물권행동카라2.jpg" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
            <img src="/img/main/유엄빠1.jpeg" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
            <img src="/img/main/동물자유연대1.png" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
          	<img src="/img/main/도로시지켜줄개.png" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
            <img src="/img/main/한국유기동물보호협회1.jpg" class="img-fluid" alt="">
          </div><!-- End Client Item -->

          <div class="col-xl-2 col-md-3 col-6 client-logo">
          	<img src="/img/main/동물보호연대1.jpg" class="img-fluid" alt="">
          </div><!-- End Client Item -->

        </div>

      </div>

    </section><!-- End Clients Section -->

    <!-- Stats Section - Home Page -->
    <section id="stats" class="stats">

      <img src="/img/main/카운트.jpg" alt="" data-aos="fade-in">

      <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="${noneCount }" data-purecounter-duration="1" class="purecounter"></span>
              <p>대기 강아지 수</p>
            </div>
          </div>
          
          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="${careCount }" data-purecounter-duration="1" class="purecounter"></span>
              <p>돌봄 진행 수</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="${adoptCount }" data-purecounter-duration="1" class="purecounter"></span>
              <p>입양 진행 수</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="${allDogCount }" data-purecounter-duration="1" class="purecounter"></span>
              <p>'WIMF'를 거쳐간 강아지들</p>
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
        <p>일정을 관리할 수 있습니다. 일정을 등록하고, 옮기고, 눌러보세요!</p>
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
    <section id="team" class="team">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>돌봄 대기리스트</h2>
        <p>돌봄을 기다리고 있는 친구들 입니다. 따뜻한 손길을 내어주세요!</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-5">

          <c:set var="count" value="0" />
          
          <c:forEach var="noneDogList" items="${noneDogList}" varStatus="loop">
           	<c:if test="${loop.index < 6 }">
	            <!-- Start Team Member -->
	              <div class="col-lg-4 col-md-6 member" data-aos="fade-up" data-aos-delay="100">
	                <div class="member-img">
	                  <img src="${noneDogList.dogFile.dogFilePath}" class="img-fluid" alt="${noneDogList.dogFile.dogFileName}">
	                  <div class="social" onclick="showDogDetail(${noneDogList.dog.dogNo})">
	                    <a href="/dog/detail.dog?dogNo=${noneDogList.dog.dogNo }">보러가기</a>
	                  </div>
	                </div>
	                <div class="member-info text-center">
	                  <h4>${noneDogList.dog.dogName }</h4>
	                  <span>${noneDogList.dog.dogAge }살, ${noneDogList.dog.dogWeight }kg, ${noneDogList.dog.dogHealth }</span>
	                  <p>${noneDogList.dog.dogInfo }</p>
	                </div>
	              </div>
	            <!-- End Team Member -->
            </c:if>
		    
          </c:forEach>
          
        </div>
         
      </div>
         
    </section>

    <!-- Call-to-action Section - Home Page -->
    <section id="call-to-action" class="call-to-action">

      <img src="/img/main/후원.jpg" alt="">

      <div class="container">
        <div class="row justify-content-center" data-aos="zoom-in" data-aos-delay="100">
          <div class="col-xl-10">
            <div class="text-center">
              <h3>후원을 기다립니다</h3>
              <p>도움을 우선하는 친구들을 볼 수 있습니다.</p>
              <a class="cta-btn" href="/dog/list.dog?region=all&sort=euthanasia">후원하기</a>
            </div>
          </div>
        </div>
      </div>

    </section><!-- End Call-to-action Section -->

    <!-- Testimonials Section - Home Page -->
    <section id="testimonials" class="testimonials">

      <div class="container">

        <div class="row align-items-center">

          <div class="col-lg-4 info" data-aos="fade-up" data-aos-delay="100">
            <h3>소통 게시판</h3>
            <p>
              돌봄으로 나눈 마음을 공유해주세요!
            </p>
          </div>

          <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">

            <div class="swiper">
              <template class="swiper-config">
                {
                "loop": true,
                "speed" : 600,
                "autoplay": {
                "delay": 3500
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

				  <c:forEach var="bList" items="${bList}" varStatus="loop">
		           	  <c:if test="${loop.index < 5}">
		                <!-- Start testimonial item -->
		                <div class="swiper-slide">
		                  <div class="testimonial-item">
		                    <div class="d-flex">
			                  <c:if test="${bList.userProfile == null}">
		                        <img src="/img/user/default-profile.png" class="testimonial-img flex-shrink-0" alt="">
			                  </c:if>
			                  <c:if test="${bList.userProfile != null}">
		                        <img src="${bList.userProfile }" class="testimonial-img flex-shrink-0" alt="">
			                  </c:if>
		                      <div>
		                        <h3>${bList.boardTitle }</h3>
		                        <h4>${bList.userNickName }</h4>
		                        <!-- <div class="stars">
		                          <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
		                        </div> -->
		                      </div>
		                    </div>
		                    <div style="overflow-y: scroll; height: 350px;">
			                    <p>
			                      <i class="bi bi-quote quote-icon-left"></i>
			                      <span>${bList.boardContent }</span>
			                      <i class="bi bi-quote quote-icon-right"></i>
			                    </p>
		                    </div>
		                  </div>
		                </div>
		                <!-- End testimonial item -->
		              </c:if>
	              </c:forEach>

              </div>
              <div class="swiper-pagination"></div>
            </div>

          </div>

        </div>

      </div>

    </section><!-- End Testimonials Section -->

    <!-- Recent-posts Section - Home Page -->
    <section id="recent-posts" class="recent-posts">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>후기 게시판</h2>
        <p>'돌봄' 그리고 '입양'으로 행복한 시간을 보내고 있는 친구들의 글을 읽을 수 있어요!</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">
          
          <c:forEach var="aList" items="${aList}" varStatus="loop">
            <c:if test="${loop.index < 6}">
              <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                <article>
    
                  <div class="post-img">
                  	<c:if test="${aList.adoptFilePath == null}">
                  		<a href="/adopt/detail.dog?adoptNo=${aList.adoptNo}">
                  			<img src="/img/user/default-profile.png" alt="후기게시판사진" class="img-fluid">
                  		</a>
                  	</c:if>
                  	<c:if test="${aList.adoptFilePath != null}">
	                  	<a href="/adopt/detail.dog?adoptNo=${aList.adoptNo}">
	               			<img src="${aList.adoptFilePath }" alt="후기게시판사진" class="img-fluid">
	               		</a>
                  	</c:if>
                  </div>
    
    			  <c:if test="${aList.adoptType == 'care'}">
    			  	<p class="post-category">돌봄 후기</p>
    			  </c:if>
    			  <c:if test="${aList.adoptType == 'adopt'}">
    			  	<p class="post-category">입양 후기</p>
    			  </c:if>
                  <c:url var="detailUrl" value="/adopt/detail.dog">
                    <c:param name="adoptNo" value="${aList.adoptNo }"></c:param>
                  </c:url>
                  <h2 class="title">
                    <a href="${detailUrl }">${aList.adoptTitle }</a>
                  </h2>
    
                  <div class="d-flex align-items-center">
                    <img src = "${aList.userProfile }"alt="프로필사진" class="img-fluid post-author-img flex-shrink-0">
                    <div class="post-meta">
                      <p class="post-author">${aList.userNickName }</p>
                      <p class="post-date">
                      	<fmt:formatDate value="${aList.adoptDate }" pattern="yyyy-MM-dd"/>~
                        <fmt:formatDate value="${aList.giveUpDate }" pattern="yyyy-MM-dd"/>
                      </p>
                    </div>
                  </div>
    
                </article>
              </div><!-- End post list item -->
            </c:if>
          </c:forEach>
			
        </div><!-- End recent posts list -->

      </div>

    </section><!-- End Recent-posts Section -->

    <!-- Portfolio Section - Home Page -->
    <section id="portfolio" class="portfolio">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>'WIMF'를 거쳐간 친구들</h2>
        <!-- <p>.</p> -->
      </div><!-- End Section Title -->

      <div class="container">

        <!-- <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order"> -->
        <div class="isotope-layout" data-default-filter=".filter-all" data-layout="masonry" data-sort="original-order">

          <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
            <!-- <li data-filter="*" class="filter-active">전체</li> -->
            <li data-filter=".filter-all" class="filter-active">전체</li>
            <li data-filter=".filter-app">돌봄</li>
            <li data-filter=".filter-product">입양</li>
            <li data-filter=".filter-branding">대기</li>
          </ul><!-- End Portfolio Filters -->

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">
          
          		<!-- 전체 -->
          		<c:forEach var="combinedList" items="${combinedList}" varStatus="loop">
          			<c:if test="${loop.index < 10}">
          			
          			<!-- 돌봄 -->
			            <c:if test="${String(combinedList.dog.dogAdopt) eq 'N' && combinedList.dog.dogPStartDate ne null}">
				            <!-- Start Portfolio Item -->
				            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-all">
				              <img src="${combinedList.dogFile.dogFilePath}" class="img-fluid" alt="${combinedList.dogFile.dogFileName}">
				              <div class="portfolio-info">
				                <h4>No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }</h4>
				                <p>${combinedList.dog.dogPStartDate } ~ ${combinedList.dog.dogPEndDate }</p>
				                <a href="${combinedList.dogFile.dogFilePath}" title="No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
				                <a href="/dog/detail.dog?dogNo=${combinedList.dog.dogNo }" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
				              </div>
				            </div>
				            <!-- End Portfolio Item -->
			            </c:if>
		          
			            <!-- 입양 -->
			            <c:if test="${String(combinedList.dog.dogAdopt) eq 'Y'}">
				            <!-- Start Portfolio Item -->
				            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-all">
				              <img src="${combinedList.dogFile.dogFilePath}" class="img-fluid" alt="${combinedList.dogFile.dogFileName}">
				              <div class="portfolio-info">
				                <h4>No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }</h4>
				                <p>입양 완료</p>
				                <a href="${combinedList.dogFile.dogFilePath}" title="No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
				                <a href="/dog/detail.dog?dogNo=${combinedList.dog.dogNo }" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
				              </div>
				            </div>
				            <!-- End Portfolio Item -->
			            </c:if>
			            
			            <!-- 대기 -->
			            <c:if test="${String(combinedList.dog.dogAdopt) eq 'N' && combinedList.dog.dogPStartDate eq null}">
				            <!-- Start Portfolio Item -->
					        <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-all">
				              <img src="${combinedList.dogFile.dogFilePath}" class="img-fluid" alt="${combinedList.dogFile.dogFileName}">
				              <div class="portfolio-info">
				                <h4>No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }</h4>
				                <p>${combinedList.dog.dogAge }살, ${combinedList.dog.dogWeight }kg, ${combinedList.dog.dogHealth }, ${combinedList.dog.dogInfo }</p>
				                <a href="${combinedList.dogFile.dogFilePath}" title="No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
				                <a href="/dog/detail.dog?dogNo=${combinedList.dog.dogNo }" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
				              </div>
				            </div>
				            <!-- End Portfolio Item -->
			            </c:if>
		            </c:if>
	            </c:forEach>
          
          		<!-- 돌봄 -->
          		<c:forEach var="careDogList" items="${careDogList}" varStatus="loop">
          			<c:if test="${loop.index < 10}">
		            <!-- Start Portfolio Item -->
			            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
			              <img src="${careDogList.dogFile.dogFilePath}" class="img-fluid" alt="${careDogList.dogFile.dogFileName}">
			              <div class="portfolio-info">
			                <h4>No.${careDogList.dog.dogNo } ${careDogList.dog.dogName }</h4>
			                <p>${careDogList.dog.dogPStartDate } ~ ${careDogList.dog.dogPEndDate }</p>
			                <a href="${careDogList.dogFile.dogFilePath}" title="No.${careDogList.dog.dogNo } ${careDogList.dog.dogName }" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
			                <a href="/dog/detail.dog?dogNo=${careDogList.dog.dogNo }" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
			              </div>
			            </div>
		            <!-- End Portfolio Item -->
		            </c:if>
	            </c:forEach>
          
	            <!-- 입양 -->
	            <c:forEach var="adoptDogList" items="${adoptDogList}" varStatus="loop">
          			<c:if test="${loop.index < 10}">
		            <!-- Start Portfolio Item -->
		            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
		              <img src="${adoptDogList.dogFile.dogFilePath}" class="img-fluid" alt="${adoptDogList.dogFile.dogFileName}">
		              <div class="portfolio-info">
		                <h4>No.${adoptDogList.dog.dogNo } ${adoptDogList.dog.dogName }</h4>
		                <p>입양 완료</p>
		                <a href="${adoptDogList.dogFile.dogFilePath}" title="No.${adoptDogList.dog.dogNo } ${adoptDogList.dog.dogName }" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
		                <a href="/dog/detail.dog?dogNo=${adoptDogList.dog.dogNo }" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
		              </div>
		            </div>
		            <!-- End Portfolio Item -->
	                </c:if>
	            </c:forEach>
	            
	            <!-- 대기 -->
	            <c:forEach var="noneDogList" items="${noneDogList}" varStatus="loop">
          			<c:if test="${loop.index < 10}">
		            <!-- Start Portfolio Item -->
			        <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
		              <img src="${noneDogList.dogFile.dogFilePath}" class="img-fluid" alt="${noneDogList.dogFile.dogFileName}">
		              <div class="portfolio-info">
		                <h4>No.${noneDogList.dog.dogNo } ${noneDogList.dog.dogName }</h4>
		                <p>${noneDogList.dog.dogAge }살, ${noneDogList.dog.dogWeight }kg, ${noneDogList.dog.dogHealth }, ${noneDogList.dog.dogInfo }</p>
		                <a href="${noneDogList.dogFile.dogFilePath}" title="No.${noneDogList.dog.dogNo } ${noneDogList.dog.dogName }" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
		                <a href="/dog/detail.dog?dogNo=${noneDogList.dog.dogNo }" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
		              </div>
		            </div>
		            <!-- End Portfolio Item -->
	                </c:if>
	            </c:forEach>
	            
           <%-- <c:forEach var="combinedList" items="${combinedList}" varStatus="loop">
          	<c:if test="${loop.index < 10}">
          	
          		<!-- 돌봄 -->
	            <c:if test="${String(combinedList.dog.dogAdopt) eq 'N' && combinedList.dog.dogPStartDate ne null}">
		            <!-- Start Portfolio Item -->
		            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
		              <img src="${combinedList.dogFile.dogFilePath}" class="img-fluid" alt="${combinedList.dogFile.dogFileName}">
		              <div class="portfolio-info">
		                <h4>No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }</h4>
		                <p>${combinedList.dog.dogPStartDate } ~ ${combinedList.dog.dogPEndDate }</p>
		                <a href="${combinedList.dogFile.dogFilePath}" title="No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
		                <a href="/dog/detail.dog?dogNo=${combinedList.dog.dogNo }" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
		              </div>
		            </div>
		            <!-- End Portfolio Item -->
	            </c:if>
          
	            <!-- 입양 -->
	            <c:if test="${String(combinedList.dog.dogAdopt) eq 'Y'}">
		            <!-- Start Portfolio Item -->
		            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
		              <img src="${combinedList.dogFile.dogFilePath}" class="img-fluid" alt="${combinedList.dogFile.dogFileName}">
		              <div class="portfolio-info">
		                <h4>No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }</h4>
		                <p>입양 완료</p>
		                <p>${combinedList.dog.dogPStartDate }~</p>
		                <a href="${combinedList.dogFile.dogFilePath}" title="No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
		                <a href="/dog/detail.dog?dogNo=${combinedList.dog.dogNo }" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
		              </div>
		            </div>
		            <!-- End Portfolio Item -->
	            </c:if>
	            
	            <!-- 대기 -->
	            <c:if test="${String(combinedList.dog.dogAdopt) eq 'N' && combinedList.dog.dogPStartDate eq null}">
		            <!-- Start Portfolio Item -->
			        <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
		              <img src="${combinedList.dogFile.dogFilePath}" class="img-fluid" alt="${combinedList.dogFile.dogFileName}">
		              <div class="portfolio-info">
		                <h4>No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }</h4>
		                <p>${combinedList.dog.dogAge }살, ${combinedList.dog.dogWeight }kg, ${combinedList.dog.dogHealth }, ${combinedList.dog.dogInfo }</p>
		                <a href="${combinedList.dogFile.dogFilePath}" title="No.${combinedList.dog.dogNo } ${combinedList.dog.dogName }" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
		                <a href="/dog/detail.dog?dogNo=${combinedList.dog.dogNo }" title="More Details" class="details-link"><i class="bi bi-link-45deg"></i></a>
		              </div>
		            </div>
		            <!-- End Portfolio Item -->
	            </c:if>
	            
            </c:if>
          </c:forEach> --%>

          </div><!-- End Portfolio Container -->

        </div>

      </div>

    </section><!-- End Portfolio Section -->

    <!-- Services Section - Home Page -->
    <section id="services" class="services">

      <!--  Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>'임시보호' 란?</h2>
        <p>What is 'Fostering' ?</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="100">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-binoculars"></i></div>
              <div>
                <h4 class="title">#1 임보가 뭘까?</h4>
                <p class="description">
                	임보란 '임시 보호'의 줄임말이에요. 구조된 강아지들이 새로운 삶을 찾게 될 때까지, 통상적으로 '구조-임시 보호-입양'의 3단계를 거치게 되는데요. <br>
					구조되자마자 바로 입양을 갈 수 있다면 좋겠지만, 통상적으로 평생 함께할 가족을 찾는 데는 시간이 걸리기 때문에 그 중간을 이어주는 임보 과정이 필요하답니다.
                </p>
              </div>
            </div>
          </div>
          <!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="200">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-bar-chart"></i></div>
              <div>
                <h4 class="title">#2 임보가 왜 필요할까?</h4>
                <p class="description">
                	안타깝게도 현재 국내 유기견 관리 시스템상으로는 인력도 자원도 턱없이 부족해 대다수 보호소에서 안락사를 시행할 수밖에 없는 실정이에요. <br>
					따라서 임시 보호는 한 생명을 구하는 가장 효과적이고 확실한 방법입니다. 임보가 없다면 한 생명의 미래도 없어진다는 것, 'WIMF'가 임보의 중요성을 널리 알리고자 하는 이유입니다.
                </p>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="300">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-calendar4-week"></i></div>
              <div>
                <h4 class="title">#3 임보자는 뭘 해야 할까?</h4>
                <p class="description">
                	• 유기견이 지낼 수 있는 안전한 공간 제공 <br>
					• 밥과 물 챙겨주기, 배변 처리하기 <br>
					• 인간을 다시 믿을 수 있도록 사랑 듬뿍 주기 <br>
					• 입양 홍보를 위해 예쁜 사진과 영상 많이 찍어주기 <br>
					• 가능하다면 SNS 등을 통해 입양 홍보 돕기
                </p>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="400">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-brightness-high"></i></div>
              <div>
                <h4 class="title">#4 나도 임보를 할 수 있을까?</h4>
                <p class="description">
                	• 집에서 강아지을 키우는 것이 문제 되지 않는다<br>
					• 털 알레르기가 없거나 심하지 않다<br>
					• 반려동물을 키워봤거나 대하는 데 능숙하다<br>
					• 다른 생명체를 챙겨줄 정도의 시간적 여유가 있다 <br>
					• 안정적인 경제력을 갖추고 있는 성인이다
                </p>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="500">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-briefcase"></i></div>
              <div>
                <h4 class="title">#5 이런 분들께 추천해요</h4>
                <p class="description">
                	• 입양을 결정하기 전에 먼저 경험해 보고 싶어요<br>
					• 오래 키운 아이를 보내서 한동안 입양은 못 할 것 같아요<br>
					• 상황이 유동적이라 당장 입양은 어렵지만 몇 개월은 가능해요<br>
					• 혼자서는 우울하고 무서운데 집에 귀여운 룸메이트가 있으면 좋을 것 같아요<br>
					• 자녀들이 독립하니 집이 적적하고 허전해요
                </p>
              </div>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-6 " data-aos="fade-up" data-aos-delay="600">
            <div class="service-item d-flex">
              <div class="icon flex-shrink-0"><i class="bi bi-card-checklist"></i></div>
              <div>
                <h4 class="title">#6 이런 점은 미리 말씀드려요</h4>
                <p class="description">
                	• 강아지과 함께하는 삶이 예상보다 힘들 수 있어요<br>
					• 임보 기간이 생각보다 짧거나 길어질 수 있어요<br>
					• 정이 많이 들면 입양 보낼 때 마음이 아플 수 있어요<br>
					• 상처가 많다면 마음을 여는 데 오래 걸릴 수 있어요<br>
					'WIMF'는 임시보호 과정에서 일어날 수 있는 다양한 문제를 최소화하고, 쉽고 안전한 임보 문화가 정착될 수 있도록 최선을 다할 거에요.
                </p>
              </div>
            </div>
          </div><!-- End Service Item -->

        </div>

      </div>

    </section><!-- End Services Section -->

    <!-- Faq Section - Home Page -->
    <!-- <section id="faq" class="faq">

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
              </div>End Faq item

              <div class="faq-item">
                <h3><span class="num">2.</span> <span>Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque?</span></h3>
                <div class="faq-content">
                  <p>Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div>End Faq item

              <div class="faq-item">
                <h3><span class="num">3.</span> <span>Dolor sit amet consectetur adipiscing elit pellentesque?</span></h3>
                <div class="faq-content">
                  <p>Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div>End Faq item

              <div class="faq-item">
                <h3><span class="num">4.</span> <span>Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla?</span></h3>
                <div class="faq-content">
                  <p>Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div>End Faq item

              <div class="faq-item">
                <h3><span class="num">5.</span> <span>Tempus quam pellentesque nec nam aliquam sem et tortor consequat?</span></h3>
                <div class="faq-content">
                  <p>Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div>End Faq item

            </div>

          </div>
        </div>

      </div>

    </section> -->
    <!-- End Faq Section -->

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
              임시보호에 부담을 덜어드릴게요!
            </p>
            <!-- <a href="#" class="read-more"><span>Read More</span><i class="bi bi-arrow-right"></i></a> -->
          </div>

          <div class="col-xl-7">
            <div class="row gy-4 icon-boxes">

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                <div class="icon-box">
                  <i class="bi bi-buildings"></i>
                  <h3>믿을 수 있는 규모</h3>
                  <p>'WIMF'는 검증된 구조자와 임보자가 안전하게 연결될 수 있는 임시보호 플랫폼을 제공해요.</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="300">
                <div class="icon-box">
                  <i class="bi bi-clipboard-pulse"></i>
                  <h3>확실한 체계</h3>
                  <p>'WIMF'는 후원시스템을 통해 임시보호자의 직접적인 부담을 덜어주고, 더 나아가 직접 유기견들을 보호합니다.</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="400">
                <div class="icon-box">
                  <i class="bi bi-command"></i>
                  <h3>소통의 장</h3>
                  <p>'WIMF'는 유기견에 대한 인식을 개선하고 올바른 구조-임시보호-입양 절차에 대해 널리 알려요.</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="500">
                <div class="icon-box">
                  <i class="bi bi-graph-up-arrow"></i>
                  <h3>높은 입양률</h3>
                  <p>'WIMF'는 유기견 사망률을 낮추기 위해 임시보호 시스템의 체계화 및 대중화에 앞장서요.</p>
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
        <p>건의사항이나 궁금한 점이 있다면 언제든 메일을 보내주세요!</p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-6">

            <div class="row gy-4">
              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="200">
                  <i class="bi bi-geo-alt"></i>
                  <h3>Address</h3>
                  <p>서울 중구 남대문로 120</p>
                  <p>대일빌딩 2층, 3층</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="300">
                  <i class="bi bi-telephone"></i>
                  <h3>Call Us</h3>
                  <p>02 5321 2312</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="400">
                  <i class="bi bi-envelope"></i>
                  <h3>Email Us</h3>
                  <p>teamWIMF@wimf.com</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item" data-aos="fade" data-aos-delay="500">
                  <i class="bi bi-clock"></i>
                  <h3>Open Hours</h3>
                  <p>Monday - Friday</p>
                  <p>09:00 AM - 18:00 PM</p>
                </div>
              </div><!-- End Info Item -->

            </div>

          </div>

          <div class="col-lg-6">
            <form action="/sendMail.dog" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="200">
           	  <input type="hidden" id="user-ck-email">
              <div class="row gy-4">

                <div class="col-md-6">
                  <input type="text" class="form-control" name="user-name" id="user-name" placeholder="Your Name" required>
                </div>

                <div class="col-md-6 ">
                  <input type="email" class="form-control" name="user-email" id="user-email" placeholder="Your Email" required>
                  <span id="email-msg" class="dupl-msg" style="display: none;"></span>
                </div>

                <div class="col-md-12">
                  <input type="text" class="form-control" name="user-email-subject" id="user-email-subject" placeholder="Subject" required>
                </div>

                <div class="col-md-12">
                  <textarea class="form-control" name="user-email-content" id="user-email-content" rows="6" placeholder="Message" required></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <div class="loading" id="email-send-loading">Loading</div>
                  <!-- <div class="error-message" id="email-send-loading">Your message has been sent. Thank you!</div> -->
                  <div class="sent-message" id="email-send-msg">Your message has been sent. Thank you!</div>

                  <button type="submit" id="sendEmail-btn">Send Message</button>
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
	          + '&emsp;&emsp;&emsp; • 기간 : ' + event.start + ' ~ ' + event.end
	          + '&emsp;&emsp;&emsp; • 내용 : ' + event.content);
	
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
 	
 	// 이메일 정규식 유효성 ajax
	$(document).ready(function() {
		var userEmailTag = $("#user-email");
		userEmailTag.on("change", function() {
			var userEmail = userEmailTag.val();
			
			$.ajax({
				url : "/checkDuplUserEmail.dog",
				type : "POST",
				data : { userEmail : userEmail },
				success : function(data) {
					var msg = "";
    				var emailMsg = $("#email-msg");
    				
    				if(data == "false1") {
    					emailMsg.removeClass("success").addClass("error");
    					$("#user-ck-email").attr("value","false");
    					msg = "이메일 형식만 가능합니다.";
    					
    				} else if(data == "false2") {
    					emailMsg.removeClass("error").addClass("success");
    					$("#user-ck-email").attr("value","true");
        				msg = "사용 가능한 이메일 입니다.";
        				
    				} else {
        				alert("오류");
    				}
    				
    				emailMsg.text(msg).show();
				},
				error : function() {
					alert("Ajax 오류, 관리자에게 문의바랍니다.");
				}
			});
		});
	});
 	
 	// 이메일 보내기 ajax
 	$(document).ready(function() {
		$("#sendEmail-btn").on("click",function(){
			var emailVal = $("#user-email").val();
			if (emailVal == null || emailVal == ""){
				alert("이메일을 먼저 입력해주세요.");
				return;
			}
			if ($("#user-ck-email").val() === "false"){
				alert("사용할 수 없는 이메일입니다.");
				return;
			} else {
				$.ajax({
					url : "/sendMail.dog",
					type : "POST",
					data : {
						userName : $("#user-name").val()
						, userEmail : $("#user-email").val()
						, userEmailSubject : $("#user-email-subject").val()
						, userEmailContent : $("#user-email-content").val()
					},
					success : function() {
						$("#email-send-loading").removeClass('d-block');
						$("#email-send-msg").addClass('d-block');
						/* $("#email-send-msg").text("Your message has been sent. Thank you!").show(); */
					},
					error : function() {
						alert("ajax 오류, 관리자에게 문의 바랍니다.");
					},
					complete : function() {
						
					}
				});
			}
		});
	});
 	
  </script>

</body>

</html>