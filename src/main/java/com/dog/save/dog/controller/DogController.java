package com.dog.save.dog.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogSet;
import com.dog.save.dog.service.DogService;



@Controller
@RequestMapping(value="/dog")
public class DogController {
	
	@Autowired
	private DogService dService;
	
	
	@GetMapping("/insert.dog")
	public ModelAndView showInsertForm(ModelAndView mv) {
		mv.setViewName("dog/dogInsert");
		return mv;
	}

	@GetMapping("/list.dog")
	public ModelAndView showDogList(ModelAndView mv			
			,@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage
		    ,@RequestParam(value = "region", required = false, defaultValue = "all") String region
	        ,@RequestParam(value = "sort", required = false, defaultValue = "latest") String sort
	        ,@RequestParam(value = "searchInput", required = false) String searchInput
	        ,HttpSession session) {
		try {
			Integer totalCount;
	        if (searchInput != null && !searchInput.isEmpty()) {
	            // 검색어를 사용한 검색을 수행
	            totalCount = dService.getListCountBySearch(searchInput); // 검색어를 사용하여 강아지 수를 가져옴
	        } else if (!region.equals("all")) {
	            totalCount = dService.getListCountByRegion(region);
	        } else {
	            totalCount = dService.getListCount();
	        }			
			
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount,6);								
			List<Dog> dogList;
			// "region"이 "all"이 아닌 경우에만 필터링 적용
	        if (searchInput != null && !searchInput.isEmpty()) {
	            // 검색어를 사용한 검색을 수행
	            dogList = dService.selectDogsBySearch(searchInput, pInfo); // 검색어를 사용하여 강아지 목록을 가져옴
	        } else if (!region.equals("all")) {
	            dogList = dService.selectDogsByRegion(region, pInfo);
	        } else {
	            dogList = dService.selectAllDog(pInfo);
	        }

	        // "sort" 값에 따라 정렬
	        if (sort.equals("euthanasia")) {
	            // "안락사 순" 정렬
	            Collections.sort(dogList, new Comparator<Dog>() {
	                @Override
	                public int compare(Dog dog1, Dog dog2) {
	                    // 비교 로직 구현 (안락사 순으로 정렬)
	                    return dog1.getDogDeathDate().compareTo(dog2.getDogDeathDate());
	                }
	            });
	        } else {
	            // "최신 순" 정렬이 기본값이므로 추가 정렬 로직이 필요하지 않음
	        }			
			List<DogFile> dogFileList;
			dogFileList = dService.selectFirstDogFile();
			List<DogSet> combinedList = new ArrayList<>();
			for (Dog dog : dogList) {
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
			mv.addObject("pInfo", pInfo);
			mv.setViewName("dog/dogList");
		} catch (Exception e) {
			mv.addObject("msg", "돌봄 강아지 조회 에러");
			mv.addObject("error", e.getMessage());
			mv.setViewName("common/error");			
		}
		return mv;
	}	

	@GetMapping("/detail.dog")
	public ModelAndView showDogDetail(ModelAndView mv
			,@RequestParam(value="dogNo") int dogNo
			,@ModelAttribute Dog dog) {
		try {
			dog = dService.selectDogByDogNo(dogNo);
			List<DogFile> dogFileList = dService.selectDogFileByDogNo(dogNo);
			if(dog != null && dogFileList.size()!=0) {
				mv.addObject("dog", dog);
				mv.addObject("dogFileList", dogFileList);
				mv.setViewName("dog/dogDetail");
			}else {
				mv.addObject("msg", "돌봄 강아지 조회가 완료되지 않았습니다");
				mv.addObject("error", "돌봄 강아지 조회 실패");
				mv.setViewName("common/error");						
			}			
		} catch (Exception e) {
			mv.addObject("msg", "돌봄 강아지 조회 에러");
			mv.addObject("error", e.getMessage());
			mv.setViewName("common/error");			
		}		
		return mv;
	}
	
	@PostMapping("/insert.dog")
	public ModelAndView insertDog(
			ModelAndView mv
			, @ModelAttribute Dog dog
			,@RequestParam(value="uploadFiles", required=false) MultipartFile[] uploadFiles
			,HttpServletRequest request) {
		try {			
			int result = dService.insertDog(dog,uploadFiles,request);
			if(result > 0) {
				mv.setViewName("redirect:/dog/list.dog");
			}else {
				mv.addObject("msg", "돌봄 강아지 등록이 완료되지 않았습니다");
				mv.addObject("error", "돌봄 강아지 등록 실패");
				mv.setViewName("common/error");				
			}
		} catch (Exception e) {
			mv.addObject("msg", "돌봄 강아지 등록 에러");
			mv.addObject("error", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	//페이징처리 메소드
	public PageInfo getPageInfo(Integer currentPage, Integer totalCount,int recordCountPerPage) {
		// 한페이지당 네비갯수
		int naviCountPerPage = 5;
		// 네비 전체 수
		int naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		// 시작 네비
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		// 끝 네비
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo pInfo = new PageInfo(totalCount, currentPage, recordCountPerPage,  naviCountPerPage, naviTotalCount,  startNavi, endNavi);
		
		return pInfo;
	}
}
