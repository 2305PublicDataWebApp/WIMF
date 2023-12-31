package com.dog.save.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogSet;
import com.dog.save.dog.service.DogService;
import com.dog.save.main.domain.Calendar;
import com.dog.save.main.service.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	@Autowired
	private DogService dService;
	
	// ==================== 일정 리스트 가져오기 ====================
	@ResponseBody
	@RequestMapping(value="/list.dog", method=RequestMethod.GET)
	public List<Map<String, Object>> getEventList(HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		if (userId != null && !userId.equals("")) {
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr = new JSONArray();

			HashMap<String, Object> hash = new HashMap<>();

			List<Calendar> allEventList = cService.getAllEventList(userId);

			for (int i = 0; i < allEventList.size(); i++) {
				hash.put("title", allEventList.get(i).getSchTitle());
				hash.put("start", allEventList.get(i).getSchStartDate());
				Date endDate = allEventList.get(i).getSchEndDate();
				endDate.setTime(endDate.getTime() + TimeUnit.DAYS.toMillis(1));
				hash.put("end", endDate);
				hash.put("option", allEventList.get(i).getSchOption());

				jsonObj = new JSONObject(hash);
				jsonArr.add(jsonObj);
			}
			return jsonArr;
		} else {	    	
		return null;
		}
	}
	
	// ==================== 선택한 날짜 일정정보 가져오기 ====================
	@ResponseBody
	@GetMapping("/getEventListByDate.dog")
	public List<Map<String, Object>> getEventListByDate(@RequestParam("date") String date, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId != null && !userId.equals("")) {
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
						// Date endDatePlusOne = new Date(event.getSchEndDate().getTime() + TimeUnit.DAYS.toMillis(1));
						eventMap.put("end", outputDateFormat.format(event.getSchEndDate()));
						
						Dog dogOne = dService.selectDogByDogNo(event.getDogNo());
						eventMap.put("dogNo", event.getDogNo());
						eventMap.put("dogName", dogOne.getDogName());
						return eventMap;
					})
					.collect(Collectors.toList());

            } catch (ParseException e) {
				e.printStackTrace();
				// 예외 발생 시 처리
				// 예를 들어, 빈 목록이나 특별한 값을 반환하거나 예외 메시지를 로깅하는 등의 처리를 할 수 있습니다.
				return Collections.emptyList();
            }
		} else {
			return null;
		}

	}

	// ==================== 팝업창 띄우기 ====================
	@RequestMapping(value="/popup.dog", method=RequestMethod.GET)
	public ModelAndView showPopupForm(ModelAndView mv) {
		
		List<Dog> dList = dService.selectAllDogList();
		
		List<DogFile> dogFileList;
		dogFileList = dService.selectFirstDogFile();
		List<DogSet> combinedList = new ArrayList<>();
		for (Dog dog : dList) {
            DogSet dogSet = new DogSet();
            dogSet.setDog(dog);
            // 각 Dog와 매칭되는 DogFile 찾기
            for (DogFile dogFile : dogFileList) {
				if (dog.getDogNo() == dogFile.getRefDogNo()) {
					dogSet.setDogFile(dogFile);
					break;
				}
            }
            combinedList.add(dogSet);
		}		
		mv.addObject("combinedList", combinedList);
		mv.setViewName("main/calendarInsertPopUp");
		
		return mv;
	}
	
	// ==================== 일정 등록 ====================
	@PostMapping("/insert.dog")
	public ModelAndView insertEvent(ModelAndView mv
			, @ModelAttribute Calendar calendar
			, HttpSession session) {
		
		try {
			String userId = (String)session.getAttribute("userId");
			if(userId != null && !userId.equals("")) {
				
				calendar.setUserId(userId);
				
				// 중복된 title 처리
				List<Calendar> allEventList = cService.getAllEventList(userId);

				// 같은 이름이 이미 존재하면 새로운 title 찾기
				String newTitle = calendar.getSchTitle();
				int maxTitleCount = findMaxTitleCount(allEventList, newTitle);
				

				// 현재 존재하는 숫자 중에서 가장 큰 숫자에 1을 더함
				int titleCount = maxTitleCount + 1;

				// titleCount가 1이상인 경우에만 "(titleCount)"를 추가
//	            String titleSuffix = (titleCount > 0) ? "(" + titleCount + ")" : "";
				String titleSuffix = "";
				while (isTitleExists(allEventList, newTitle + titleSuffix)) {
					titleSuffix = "(" + titleCount + ")";
						titleCount++;
				}

				// 최종적인 title 설정
				calendar.setSchTitleCount(titleCount);
				calendar.setSchTitle(newTitle + titleSuffix);
				
				int result = cService.insertEvent(calendar);
				if(result > 0) {
					mv.setViewName("redirect:/");
				} else {
					mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
					mv.addObject("url", "/");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("msg", "로그인이 완료되지 않았습니다.");
				mv.addObject("url", "/user/login.dog");
				mv.setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			System.out.println("error 입니다.");
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 중복된 title 확인 메소드
	private boolean isTitleMatch(String existingTitle, String newTitle) {
		// 여기에 중복된 title 비교 로직을 추가해야 함
		return existingTitle.equals(newTitle);
	}

	// 이미 존재하는 title 중에서 가장 큰 숫자 찾기
	private int findMaxTitleCount(List<Calendar> allEventList, String baseTitle) {
		int maxCount = 0;
		for (Calendar existingEvent : allEventList) {
			if (isTitleMatch(existingEvent.getSchTitle(), baseTitle)) {
				// 중복된 title이 있으면 최대 숫자 갱신
				maxCount = Math.max(maxCount, extractTitleCount(existingEvent.getSchTitle()));
			}
		}
		return maxCount;
	}

	// 중복된 title이 이미 존재하면 true 반환
	private boolean isTitleExists(List<Calendar> allEventList, String newTitle) {
		for (Calendar existingEvent : allEventList) {
			if (existingEvent.getSchTitle().equals(newTitle)) {
				return true;
			}
		}
		return false;
	}

	// title에서 숫자 추출 메소드
	private int extractTitleCount(String title) {
	    // 여기에 title에서 숫자를 추출하는 로직을 추가해야 함
		int lastIndexOfOpenParen = title.lastIndexOf("(");
		int lastIndexOfCloseParen = title.lastIndexOf(")");
		
		if (lastIndexOfOpenParen != -1 && lastIndexOfCloseParen != -1 && lastIndexOfOpenParen < lastIndexOfCloseParen) {
			try {
				// 숫자를 추출
				String numberStr = title.substring(lastIndexOfOpenParen + 1, lastIndexOfCloseParen);
				return Integer.parseInt(numberStr.trim());
			} catch (NumberFormatException e) {
				// 숫자 변환에 실패하면 기본값으로 0 반환
				return 0;
			}
		}
		return 0;
	}

	
	// ==================== 일정 업데이트 ====================
	@GetMapping("/update.dog")
	@ResponseBody
	public List<Map<String, Object>> showAllEventInUpdate(HttpSession session) throws Exception {
	String userId = (String) session.getAttribute("userId");
		if (userId != null && !userId.equals("")) {
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr = new JSONArray();

			HashMap<String, Object> hash = new HashMap<>();

			List<Calendar> allEventList = cService.getAllEventList(userId);

			for (int i = 0; i < allEventList.size(); i++) {
				hash.put("title", allEventList.get(i).getSchTitle());
				hash.put("start", allEventList.get(i).getSchStartDate());
				Date endDate = allEventList.get(i).getSchEndDate();
				endDate.setTime(endDate.getTime() + TimeUnit.DAYS.toMillis(1));
				hash.put("end", endDate);
//	            hash.put("time", allEventList.get(i).getScheduleTime());

				jsonObj = new JSONObject(hash);
				jsonArr.add(jsonObj);
			}
			return jsonArr;
		} else {
		Map<String, String> errorResponse = new HashMap<>();
			errorResponse.put("error", "로그인이 완료되지 않았습니다.");
			return (List<Map<String, Object>>) errorResponse;
		}
	}
	
    // ==================== 일정 업데이트 ====================
	@PostMapping("/update.dog")
	@ResponseBody
	public String modifyEvent(@RequestBody List<Map<String, Object>> param, HttpSession session) {
	
		String userId = (String) session.getAttribute("userId");
			if (userId != null && !userId.equals("")) {
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
						params.put("userId", userId);
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
							newParams.put("userId", userId);
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
			} else {
				return null;
			}
		}
	
   // ==================== 일정 삭제 ====================
	@PostMapping("/delete.dog")
	@ResponseBody
	public String deleteEvent(@RequestBody List<Map<String, Object>> param, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		String response = "";

		if (userId != null && !userId.equals("")) {
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
					params.put("userId", userId);
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
		} else {
			return null;
		}
		return response;
	}
	
}
