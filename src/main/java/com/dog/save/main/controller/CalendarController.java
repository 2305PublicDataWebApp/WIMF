package com.dog.save.main.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.main.service.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
//	@Autowired
//	private CalendarService cService;
	
	@RequestMapping(value="/list.dog", method=RequestMethod.GET)
	public List<Map<String, Object>> getEventList() {
        Map<String, Object> event = new HashMap<String, Object>();
        List<Map<String, Object>> eventList = new ArrayList<Map<String, Object>>();
        event.put("title", "더 많은 필드 참고");
        event.put("start", "2023-10-5");
        event.put("end",LocalDate.now());
        eventList.add(event);
        
        event = new HashMap<String, Object>();
        event.put("title", "뚜껑 닫기");
        event.put("start", LocalDate.now().plusDays(3));
        event.put("allday",	false);
        eventList.add(event);
        return eventList;
    }
	
	@RequestMapping(value="/popup.dog", method=RequestMethod.GET)
	public ModelAndView showPopupForm(ModelAndView mv) {
		
		mv.setViewName("main/calendarInsertPopUp");
		
//		try {
//			String encodedCategory = URLEncoder.encode(refCategoryName, "UTF-8");
//			String url = "hobby/board/detail.do?category=" + encodedCategory + "&hBoardNo=" + hBoardNo;
//			
//			Board boardOne = bService.selectBoardByNo(hBoardNo);
//			if(boardOne != null) {
//				mv.addObject("board", boardOne);
//				mv.setViewName("hobby/groupPopupForm");
//			} else {
//				mv.addObject("msg", "소모임 일정 조회가 완료되지 않았습니다.");
//				mv.addObject("url", url);
//				mv.setViewName("common/errorPage");
//			}
//		} catch (Exception e) {
//			mv.addObject("msg", "소모임 일정 조회가 완료되지 않았습니다.");
//			mv.addObject("url", "/hobby/board/list.do?category="+refCategoryName);
//			mv.setViewName("common/errorPage");
//		}
		return mv;
	}
	
	
//	@GetMapping("/calendar-admin")
//    @ResponseBody
//    public List<Map<String, Object>> monthPlan() {
//        List<Schedule> listAll = scheduleService.findAll();
// 
//        JSONObject jsonObj = new JSONObject();
//        JSONArray jsonArr = new JSONArray();
// 
//        HashMap<String, Object> hash = new HashMap<>();
// 
//        for (int i = 0; i < listAll.size(); i++) {
//            hash.put("title", listAll.get(i).getId());
//            hash.put("start", listAll.get(i).getScheduleDate());
////            hash.put("time", listAll.get(i).getScheduleTime());
// 
//            jsonObj = new JSONObject(hash);
//            jsonArr.add(jsonObj);
//        }
//        log.info("jsonArrCheck: {}", jsonArr);
//        return jsonArr;
//    }

//	@ResponseBody
//	@GetMapping("/event") //ajax 데이터 전송 URL
//	public List<Map<String, Object>> getEventList() {
//        Map<String, Object> event = new HashMap<String, Object>();
//        List<Map<String, Object>> eventList = new ArrayList<Map<String, Object>>();
//        
//        event.put("title", "test");
//        event.put("start", LocalDate.now());
//        event.put("end",LocalDate.now());
//        eventList.add(event);
//        
//        event = new HashMap<String, Object>();
//        event.put("title", "test2");
//        event.put("start", LocalDate.now().plusDays(3));
//        event.put("end",LocalDate.now().plusDays(4));
//        eventList.add(event);
//        return eventList;
//    }
}
