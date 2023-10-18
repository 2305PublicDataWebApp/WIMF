package com.dog.save.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.dog.controller.DogController;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.service.DogService;
import com.dog.save.main.domain.Calendar;
import com.dog.save.main.service.CalendarService;
import com.dog.save.user.service.UserService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	@Autowired
	private UserService uService;
	@Autowired
	private DogController dController;
	@Autowired
	private DogService dService;
	
	@ResponseBody
	@RequestMapping(value="/list.dog", method=RequestMethod.GET)
	public List<Map<String, Object>> getEventList() {
        
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
 
        HashMap<String, Object> hash = new HashMap<>();
 
        List<Calendar> AllEventList = cService.getAllEventList();

        for (int i = 0; i < AllEventList.size(); i++) {
            hash.put("title", AllEventList.get(i).getSchTitle());
            hash.put("start", AllEventList.get(i).getSchStartDate());
            Date endDate = AllEventList.get(i).getSchEndDate();
            endDate.setTime(endDate.getTime() + TimeUnit.DAYS.toMillis(1));
            hash.put("end", endDate);
            hash.put("option", AllEventList.get(i).getSchOption());
//            hash.put("time", AllEventList.get(i).getScheduleTime());
 
            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
        }
        return jsonArr;
    }
	
	
	
	
	@ResponseBody
	@GetMapping("/getEventListByDate.dog")
	public List<Map<String, Object>> getEventListByDate(@RequestParam("date") String date, HttpSession session) {
	    String userId = (String) session.getAttribute("userId");
//	    if (userId != null && !userId.equals("")) {
	    	try {
	    		SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	            Date selectedDate = inputDateFormat.parse(date);
	            
	            System.out.println("=================================");
                System.out.println("date = " + date);
                
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                calendar.setTime(selectedDate);
                calendar.add(java.util.Calendar.DAY_OF_MONTH, 1);
                Date datePlusOne = calendar.getTime();
                
                System.out.println("=================================");
                System.out.println("datePlusOne = " + datePlusOne);

	            // 사용자 아이디와 날짜를 Map에 담아 서비스로 전달
                Map<String, Object> dateRange = new HashMap<>();
                dateRange.put("date", datePlusOne);
                dateRange.put("userId", userId);

                List<Calendar> eventList = cService.getEventListByDate(dateRange);


		        // 이벤트 목록을 Map 형태로 변환하여 반환
		        return eventList.stream()
		                .map(event -> {
		                    Map<String, Object> eventMap = new HashMap<>();
		                    eventMap.put("title", event.getSchTitle());
		                    eventMap.put("content", event.getSchContent());
		                 // 시작 날짜 포맷 변경
		                    SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		                    eventMap.put("start", outputDateFormat.format(event.getSchStartDate()));

		                    // 종료 날짜는 하루를 더해줘야 합니다.
//		                    Date endDatePlusOne = new Date(event.getSchEndDate().getTime() + TimeUnit.DAYS.toMillis(1));
		                    eventMap.put("end", outputDateFormat.format(event.getSchEndDate()));
		                    return eventMap;
		                })
		                .collect(Collectors.toList());
		    } catch (ParseException e) {
		        e.printStackTrace();
		        // 예외 발생 시 처리
		        // 예를 들어, 빈 목록이나 특별한 값을 반환하거나 예외 메시지를 로깅하는 등의 처리를 할 수 있습니다.
		        return Collections.emptyList();
		    }
//	    } else {
//			mv.addObject("msg", "로그인이 완료되지 않았습니다.");
//			mv.addObject("url", "/user/login.dog");
//			mv.setViewName("common/errorPage");
//		}
	    
	}





	
	
	
	
	
	@RequestMapping(value="/popup.dog", method=RequestMethod.GET)
	public ModelAndView showPopupForm(ModelAndView mv) {
		
//		List<Dog> dogList = dService.selectAllDog();
		
		mv.setViewName("main/calendarInsertPopUp");
		
		return mv;
	}
	
	@PostMapping("/insert.dog")
	public ModelAndView insertEvent(ModelAndView mv
			, @ModelAttribute Calendar calendar
			, HttpSession session) {
		
		try {
//			String writer = (String)session.getAttribute("userId");
//			if(writer != null && !writer.equals("")) {
				
//				calendar.setUserId(writer);
				
				int result = cService.insertEvent(calendar);
				if(result > 0) {
					mv.setViewName("redirect:/");
				} else {
					mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
					mv.addObject("url", "/");
					mv.setViewName("common/errorPage");
				}
//			} else {
//				mv.addObject("msg", "로그인이 완료되지 않았습니다.");
//				mv.addObject("url", "/user/login.dog");
//				mv.setViewName("common/errorPage");
//			}
			
		} catch (Exception e) {
			System.out.println("error 입니다.");
//			mv.addObject("msg", "관리자에게 문의하세요.");
//			mv.addObject("url", "/index.jsp");
//			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
     * calendar-admin-update 페이지 조회
     */
    @GetMapping("/update.dog")
    @ResponseBody
    public List<Map<String, Object>> showAllEventInUpdate() throws Exception {
 
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
 
        HashMap<String, Object> hash = new HashMap<>();
 
        List<Calendar> AllEventList = cService.getAllEventList();
 
        for (int i = 0; i < AllEventList.size(); i++) {
            hash.put("title", AllEventList.get(i).getSchTitle());
            hash.put("start", AllEventList.get(i).getSchStartDate());
            Date endDate = AllEventList.get(i).getSchEndDate();
            endDate.setTime(endDate.getTime() + TimeUnit.DAYS.toMillis(1));
            hash.put("end", endDate);
//            hash.put("time", AllEventList.get(i).getScheduleTime());
 
            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
        }
        return jsonArr;
    }
    
    /**
     * calendar-admin-update 페이지 이벤트 생성
     */
    @PostMapping("/update.dog")
    @ResponseBody
    public String modifyEvent(@RequestBody List<Map<String, Object>> param) {
    	String response = "";
 
    	SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
 
    	try {
    		for (Map<String, Object> list : param) {
    			 
                String eventName = (String) list.get("title"); // 이름 받아오기
                String startDateString = (String) list.get("start");
                String endDateString = (String) list.get("end");
     
                String oldTitle = (String) list.get("oldTitle");
                String oldStartString = (String) list.get("oldStart");
                String oldEndString = (String) list.get("oldEnd");
     
                Date modifiedStartDate = inputDateFormat.parse(startDateString);
                Date modifiedEndDate = inputDateFormat.parse(endDateString);
                Date oldStartDate = inputDateFormat.parse(oldStartString);
                Date oldEndDate = inputDateFormat.parse(oldEndString);
     
                System.out.println("=====================================");
                System.out.println("modifiedStartDate = " + modifiedStartDate);
                System.out.println("modifiedEndDate = " + modifiedEndDate);
                System.out.println("oldTitle = " + oldTitle);
                System.out.println("oldStart = " + oldStartDate);
                System.out.println("oldEnd = " + oldEndDate);
     
//                Calendar calendar = cService.findByScheduleDateTimeStartAndScheduleDateTimeEnd(oldStart, oldEnd).get();
//                Integer scheduleId = schedule.getId();
    // 
    // 
//                System.out.println("=====================================");
//                System.out.println("scheduleId = " + scheduleId);
//                if (scheduleId != null) {
    // 
//                    ScheduleDto scheduleDto = ScheduleDto.builder()
//                            .scheduleDateTimeStart(modifiedStartDate)
//                            .scheduleDateTimeEnd(modifiedEndDate)
//                            .build();
    // 
//                    scheduleService.update(scheduleId, scheduleDto);
//                }
                
                // endDate에서 하루를 뺀다.
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                calendar.setTime(oldEndDate);
                calendar.add(java.util.Calendar.DAY_OF_MONTH, -1);
                oldEndDate = calendar.getTime();
                
                calendar.setTime(modifiedEndDate);
                calendar.add(java.util.Calendar.DAY_OF_MONTH, -1);
                modifiedEndDate = calendar.getTime();
                
                System.out.println("endDate = " + oldEndDate);
                
                // 해당 이벤트 정보로 일정 조회
                Map<String, Object> params = new HashMap<>();
                params.put("userId", "khuser01");
                params.put("title", oldTitle);
                params.put("startDate", oldStartDate);
                params.put("endDate", oldEndDate);

                Optional<Calendar> calendarOptional = cService.findEventByUserIdAndTitleAndStartDateAndEndDate(params);
                
                System.out.println("=================================");
                System.out.println("calendarOptional = " + calendarOptional);

                if (calendarOptional.isPresent()) {
                	Calendar eventOne = calendarOptional.get();
                	
                	System.out.println("=================================");
                    System.out.println("eventOne.getSchNo() = " + eventOne.getSchNo());
                    
                    int schNo = eventOne.getSchNo();
                    
                    Map<String, Object> newParams = new HashMap<>();
                    newParams.put("userId", "khuser01");
                    newParams.put("title", eventName);
                    newParams.put("startDate", modifiedStartDate);
                    newParams.put("endDate", modifiedEndDate);
                    newParams.put("schNo", schNo);
                    
                    int result = cService.updateEvent(newParams);
                    response = (result > 0) ? "success" : "error";
                    
                    System.out.println("=================================");
                    System.out.println("response = " + response);
                }
            }
		} catch (Exception e) {
			e.printStackTrace();
            System.out.println("=================================");
            System.out.println("날짜 파싱 예외 오류");
            response = "error";
		}
        return response;
    }
	
	@PostMapping("/delete.dog")
    @ResponseBody
    public String deleteEvent(@RequestBody List<Map<String, Object>> param, HttpSession session) {
//        String userId = (String) session.getAttribute("userId");
        String response = "";

//        if (userId != null && !userId.equals("")) {
            for (Map<String, Object> map : param) {
                String title = (String) map.get("title");
                String startDateString = (String) map.get("start");
                String endDateString = (String) map.get("end");
                
                System.out.println("endDateString = " + endDateString);
                
                SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);

                try {
                	Date startDate = inputDateFormat.parse(startDateString);
                    Date endDate = inputDateFormat.parse(endDateString);
                    
                    System.out.println("endDate = " + endDate);
                    
                    // endDate에서 하루를 뺀다.
                    java.util.Calendar calendar = java.util.Calendar.getInstance();
                    calendar.setTime(endDate);
                    calendar.add(java.util.Calendar.DAY_OF_MONTH, -1);
                    endDate = calendar.getTime();
                    
                    System.out.println("endDate = " + endDate);
                    
                    // 해당 이벤트 정보로 일정 조회
                    Map<String, Object> params = new HashMap<>();
                    params.put("userId", "khuser01");
                    params.put("title", title);
                    params.put("startDate", startDate);
                    params.put("endDate", endDate);

                    Optional<Calendar> calendarOptional = cService.findEventByUserIdAndTitleAndStartDateAndEndDate(params);
                    
                    System.out.println("=================================");
                    System.out.println("calendarOptional = " + calendarOptional);

                    if (calendarOptional.isPresent()) {
                    	Calendar eventOne = calendarOptional.get();
                    	
                    	System.out.println("=================================");
                        System.out.println("eventOne.getSchNo() = " + eventOne.getSchNo());
                        
                        int result = cService.deleteEvent(eventOne.getSchNo());
                        response = (result > 0) ? "success" : "error";
                        
                        System.out.println("=================================");
                        System.out.println("response = " + response);
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                    System.out.println("=================================");
                    System.out.println("날짜 파싱 예외 오류");
                    response = "error";
                }
            }
//        } else {
//			mv.addObject("msg", "로그인이 완료되지 않았습니다.");
//			mv.addObject("url", "/user/login.dog");
//			mv.setViewName("common/errorPage");
//		}
        return response;
    }
	
}
