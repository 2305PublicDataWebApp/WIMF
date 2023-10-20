package com.dog.save.app.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.app.domain.App;
import com.dog.save.app.service.AppService;
import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.service.DogService;
import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;

@Controller
@RequestMapping(value="/app")
public class AppController {

	@Autowired
	private AppService aService;
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private DogService dService;
	
	@GetMapping("/insert.dog")
	public ModelAndView showInsertForm(ModelAndView mv, HttpSession session
			, @RequestParam(value="dogNo") int dogNo) {
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			mv.addObject("msg", "로그인 후에 신청서를 작성할 수 있습니다");
			mv.addObject("url", "/user/login.dog");
			mv.setViewName("common/error");
		}else {
			Dog dog = dService.selectDogByDogNo(dogNo);
			List<DogFile> dogFileList = dService.selectDogFileByDogNo(dogNo);
			User user = uService.selectOneById(userId);
			if(dog != null && dogFileList.size()!=0) {
				mv.addObject("user", user);
				mv.addObject("dog", dog);
				mv.addObject("dogFileList", dogFileList);
				mv.setViewName("app/write");
			}else {
				mv.addObject("msg", "돌봄 강아지 조회가 완료되지 않았습니다");
				mv.addObject("url", "/");
				mv.setViewName("common/error");						
			}
		}
		return mv;
	}
	
	@PostMapping("/insert.dog")
	public ModelAndView insertApplication(ModelAndView mv
			, @ModelAttribute App app) {
		int result = aService.insertApplication(app);
		try {
			if(result > 0) {
				mv.addObject("app", app);
				mv.setViewName("/index");
			} else {
				mv.addObject("msg", "[서비스실패] 문의를 조회할 수 없습니다.");
				mv.setViewName("common/error");
			}	
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "[서비스실패] 관리자에 문의바랍니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// Fix String null to Date
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	
	@GetMapping("/list.dog")
	public ModelAndView showAllList(
			ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {
			int totalCount = aService.getTotalCount();
			PageInfo pageInfo = getPageInfo(currentPage, totalCount);
			List<App> aList = aService.appAllList(pageInfo);
			if(aList.size() > 0) {
				mv.addObject("pageInfo", pageInfo);
				mv.addObject("totalCount", totalCount);
				mv.addObject("aList", aList);
				mv.setViewName("app/list");
			} else {
				mv.addObject("msg", "[서비스실패] 목록을 조회할 수 없습니다.");
				mv.addObject("url", "/");
				mv.setViewName("common/error");
			}	
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "[서비스실패] 관리자에 문의바랍니다.");
			mv.addObject("url", "/");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@GetMapping("/detail.dog")
	public ModelAndView applicationDetail (
			ModelAndView mv
			, @RequestParam(value="appNo") int appNo) {
		try {
			App app = aService.selectAppByNo(appNo);
			if(app != null) {
				mv.addObject("app", app);
				mv.setViewName("app/detail");
			} else {
				mv.addObject("msg", "[서비스실패] 신청서를 조회할 수 없습니다..");
				mv.addObject("url", "/app/list.dog");
				mv.setViewName("common/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	
	
	private PageInfo getPageInfo(Integer currentPage, int totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo pageInfo = new PageInfo(naviTotalCount, currentPage, recordCountPerPage, naviCountPerPage, naviTotalCount, startNavi, endNavi);
		return pageInfo;
	}
}
