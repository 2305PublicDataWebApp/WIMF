package com.dog.save.map.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogSet;
import com.dog.save.dog.service.DogService;

@Controller
@RequestMapping(value="/map")
public class MapController {
	
	@Autowired
	private DogService dService;
	
	// ==================== 지도 접속 ====================
	@GetMapping("/map.dog")
	public ModelAndView showMap(ModelAndView mv) {
		try {
			List<Dog> dList = dService.selectAllDogListMap();
			if(dList.size() > 0) {
				List<DogFile> dogFileList;
				dogFileList = dService.selectFirstDogFile(); // dogFileOrder가 1인 파일을 dogFileList에 저장 (썸네일용)
				List<DogSet> combinedList = new ArrayList<>();
				for (Dog dog : dList) {
					DogSet dogSet = new DogSet(); // 강아지 정보와 파일을 합쳐서 저장하기위해 생성
					dogSet.setDog(dog);
					// 각 Dog와 매칭되는 DogFile 찾기
					for (DogFile dogFile : dogFileList) {
						if (dog.getDogNo() == dogFile.getRefDogNo()) { // 강아지 연관번호로 매칭
							dogSet.setDogFile(dogFile);
							break;
						}
					}
					combinedList.add(dogSet);
				}		
				mv.addObject("dList", dList);
				mv.addObject("combinedList", combinedList);
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
