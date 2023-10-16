package com.dog.save.dog.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
		    ,HttpSession session) {
		try {
			Integer totalCount;
			totalCount = dService.getListCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount,6);								
			List<Dog> dogList;
			dogList = dService.selectAllDog(pInfo);
			List<DogFile> dogFileList;
			dogFileList = dService.selectFirstDogFile();
			
			
		} catch (Exception e) {
			// TODO: handle exception
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
		PageInfo pInfo = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		
		return pInfo;
	}
}
