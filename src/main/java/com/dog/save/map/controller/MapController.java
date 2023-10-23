package com.dog.save.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.service.DogService;

@Controller
@RequestMapping(value="/map")
public class MapController {
	
	@Autowired
	private DogService dService;
	
	// ==================== 게시글 작성 페이지 ====================
	@GetMapping("/map.dog")
	public ModelAndView showMap(ModelAndView mv) {
		try {
			List<Dog> dList = dService.selectAllDogListMap();
			if(dList.size() > 0) {
				mv.addObject("dList", dList);
				mv.setViewName("map/map");
			} else {
				mv.addObject("msg", "[서비스실패] 목록을 조회할 수 없습니다.");
				mv.setViewName("common/errorPage");
			}	
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("error", e.getMessage());
			mv.addObject("msg", "[서비스실패] 관리자에 문의바랍니다.");
			mv.setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	
}
