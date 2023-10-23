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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogLike;
import com.dog.save.dog.domain.DogReply;
import com.dog.save.dog.domain.DogSet;
import com.dog.save.dog.service.DogService;
import com.google.gson.Gson;



@Controller
@RequestMapping(value="/dog")
public class DogController {
	
	@Autowired
	private DogService dService;
	
	// ==================== 돌봄 강아지 등록폼으로 이동 ====================
	@GetMapping("/insert.dog")
	public ModelAndView showInsertForm(ModelAndView mv) {
		mv.setViewName("dog/dogInsert");
		return mv;
	}

	// ==================== 돌봄 강아지 등록 ====================
	@PostMapping("/insert.dog")
	public ModelAndView insertDog(
			ModelAndView mv
			, @ModelAttribute Dog dog
			,@RequestParam(value="uploadFiles", required=false) MultipartFile[] uploadFiles
			,HttpServletRequest request) {
		try {			
			int result = dService.insertDog(dog,uploadFiles,request); // 강아지 정보+파일 등록
			if(result > 0) {
				mv.setViewName("redirect:/dog/list.dog"); // 전체 리스트로 이동
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

	// ==================== 돌봄 강아지 수정폼으로 이동 ====================
	@GetMapping("/modify.dog")
	public ModelAndView showModifyForm(ModelAndView mv
			,@RequestParam(value="dogNo") int dogNo) {
		try {
			Dog dog = dService.selectDogByDogNo(dogNo); // 강아지 번호로 정보 가져오기
			List<DogFile> dogFileList = dService.selectDogFileByDogNo(dog.getDogNo()); // 강아지 번호로 파일 가져오기
			mv.addObject("dog", dog);
			mv.addObject("dogFileList", dogFileList);
			mv.setViewName("dog/dogModify"); // 강아지 수정폼으로 이동
		} catch (Exception e) {
			mv.addObject("msg", "돌봄 강아지 조회 에러");
			mv.addObject("error", e.getMessage());
			mv.setViewName("common/error");				 
		}		
		return mv;
	}

	// ==================== 돌봄 강아지 수정 ====================
	@PostMapping("/modify.dog")
	public ModelAndView modifyDog(ModelAndView mv
			,@ModelAttribute Dog dog
			,@RequestParam(value="uploadFiles", required=false) MultipartFile[] uploadFiles
			,@RequestParam(value="noChangeFileOrder", required=false) List<Integer> noChangeFileOrder
			,HttpServletRequest request) {
		try {			
			int result = dService.modifyDog(dog,uploadFiles,noChangeFileOrder,request); // 선택된 파일(배열), 강아지 정보, 수정 되지않을 파일의 순서 매개변수로 사용
			int dogNo = dog.getDogNo();
			if(result>0) {
				mv.setViewName("redirect:/dog/detail.dog?dogNo=" + dogNo); // 수정 후 해당 강아지 상세페이지로 이동
			}else {
				mv.addObject("msg", "돌봄 강아지 수정이 완료되지 않았습니다");
				mv.addObject("error", "돌봄 강아지 수정 실패");
				mv.setViewName("common/error");	
			}
		} catch (Exception e) {
			mv.addObject("msg", "돌봄 강아지 수정 에러");
			mv.addObject("error", e.getMessage());
			mv.setViewName("common/error");				
		}
		
		return mv;
	}

	// ==================== 돌봄 강아지 삭제 ====================
	@GetMapping("/delete.dog")
	public ModelAndView deleteDog(ModelAndView mv
			,@RequestParam(value="dogNo") int dogNo) {
		try {
			int result = dService.deleteDog(dogNo); // 강아지 번호로 돌봄 강아지 삭제			
			if(result>0) {
				mv.setViewName("redirect:/dog/list.dog"); // 돌봄 강아지 전체 리스트로 이동
			}else {
				mv.addObject("msg", "돌봄 강아지 삭제가 완료되지 않았습니다");
				mv.addObject("error", "돌봄 강아지 삭제 실패");
				mv.setViewName("common/error");				
			}			
		} catch (Exception e) {
			mv.addObject("msg", "돌봄 강아지 삭제 에러");
			mv.addObject("error", e.getMessage());
			mv.setViewName("common/error");				
		}
		return mv;
	}

	// ==================== 돌봄 강아지 리스트 조회(전체,지역별,날짜순,검색) ====================
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
	            totalCount = dService.getListCountBySearch(searchInput); // 검색어를 사용하여 강아지 수 카운트
	        } else if (!region.equals("all")) {
	            totalCount = dService.getListCountByRegion(region); // 지역을 사용하여 강아지 수 카운트
	        } else {
	            totalCount = dService.getListCount(); // 강아지 전체 수 카운트
	        }						
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount,6);								
			List<Dog> dogList;
	        if (searchInput != null && !searchInput.isEmpty()) {	            
	            dogList = dService.selectDogsBySearch(searchInput, pInfo); // 검색어를 사용하여 돌봄 강아지 목록 조회
	        } else if (!region.equals("all")) {
	        	// "region"이 "all"이 아닌 경우에만 필터링 적용
	            dogList = dService.selectDogsByRegion(region, pInfo); // 지역을 사용하여 돌봄 강아지 목록 조회
	        } else {
	            dogList = dService.selectAllDog(pInfo); // 전체 돌봄 강아지 조회
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
			dogFileList = dService.selectFirstDogFile(); // dogFileOrder가 1인 파일을 dogFileList에 저장 (썸네일용)
			List<DogSet> combinedList = new ArrayList<>();
			for (Dog dog : dogList) {
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
			mv.addObject("combinedList", combinedList);
			mv.addObject("region", region);
			mv.addObject("sort", sort);
			mv.addObject("pInfo", pInfo);
			mv.setViewName("dog/dogList"); // 강아지 전체 리스트로 이동
		} catch (Exception e) {
			mv.addObject("msg", "돌봄 강아지 조회 에러");
			mv.addObject("error", e.getMessage());
			mv.setViewName("common/error");			
		}
		return mv;
	}

	// ==================== 돌봄 강아지 상세페이지 이동 ====================
	@GetMapping("/detail.dog")
	public ModelAndView showDogDetail(ModelAndView mv
			,@RequestParam(value="dogNo") int dogNo			
			,@ModelAttribute Dog dog
			,@ModelAttribute DogReply dogReply) {
		try {
			dog = dService.selectDogByDogNo(dogNo); // 강아지 번호로 정보 조회 후 dog에 저장
			List<DogFile> dogFileList = dService.selectDogFileByDogNo(dogNo); // 강아지 번호로 파일 조회 후 dogFileList에 저장
			List<DogReply> dogReplyList = dService.selectReplyList(dogNo); // 강아지 번호로 댓글 조회 후 dogReplyList에 저장
			if(dog != null && dogFileList.size()!=0) { 
				mv.addObject("dog", dog);
				mv.addObject("dogFileList", dogFileList);
				mv.addObject("dogReplyList", dogReplyList);
				mv.setViewName("dog/dogDetail"); // 강아지 상세페이지로 이동
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

	// ==================== 돌봄 강아지 댓글 가져오기(강아지번호로 조회) ====================
	@ResponseBody
	@RequestMapping(value="/replyList.dog", produces="application/json;charset=utf-8",method=RequestMethod.GET)
	public String showReplyList(@RequestParam("dogNo") int dogNo) {
		List<DogReply> dogRList = dService.selectReplyList(dogNo); // 강아지 번호로 댓글 조회 후 dogRList에 저장
		Gson gson = new Gson();
		return gson.toJson(dogRList); // JSON 형태로 리턴
	}

	// ==================== 돌봄 강아지 댓글 작성 ====================
	@ResponseBody
	@PostMapping("/addReply.dog")
	public String insertReply(@ModelAttribute DogReply dogReply
			,HttpSession session) {
		String dogReplyWriter = (String)session.getAttribute("userId"); // 세션에서 작성자 추출
		int result = 0;
		if(dogReplyWriter != null && !dogReplyWriter.equals("")) {
			dogReply.setDogReplyWriter(dogReplyWriter); // 작성자 dogReply에 set
			result = dService.insertReply(dogReply); // dogReply객체 보내서 댓글 등록
		}
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// ==================== 돌봄 강아지 댓글 수정 ====================
	@ResponseBody
	@PostMapping("/replyUpdate.dog")
	public String updateReply(
			@ModelAttribute DogReply dogReply
			) {
		int result = dService.updateReply(dogReply); // dogReply 객체 보내서 댓글 수정
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}

	// ==================== 돌봄 강아지 댓글 삭제 ====================
	@ResponseBody
	@PostMapping("/replyDelete.dog")
	public String deleteReply(Integer dogReplyNo) {
		int result = dService.deleteReply(dogReplyNo); // dogReplyNo 이용해서 해당 댓글 삭제
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}

	// ==================== 돌봄 강아지 좋아요 체크 상태 조회 ====================
	@ResponseBody
	@GetMapping("/checkLikeStatus.dog")
	public String checkLikeStatus(@ModelAttribute DogLike dogLike, HttpSession session) {
	    String userId = (String) session.getAttribute("userId");
	    
	    if (userId != null && !userId.equals("")) {	        	        	     
	        dogLike.setRefUserId(userId);
	        String existingLikeStatus = dService.getLikeStatus(dogLike); // refDogNo와 userId를 기반으로 데이터베이스에서 "좋아요" 상태를 가져옴	        
	        if ("Y".equals(existingLikeStatus)) {
	            return "liked"; // "좋아요" 상태
	        } else {
	            return "notliked"; // "좋아요"하지 않은 상태
	        }
	    } else {
	        return "unauthorized"; // 로그인하지 않은 사용자
	    }
	}

	// ==================== 돌봄 강아지 좋아요 체크 등록,수정 ====================
	@ResponseBody
	@PostMapping("/updateLikeStatus.dog")
	public String updateLikeStatus(@ModelAttribute DogLike dogLike, HttpSession session) {
	    String userId = (String) session.getAttribute("userId"); // 세션에서 작성자 추출
	    int result = 0;
	    String existingLikeStatus = null; // 변수를 밖으로 이동

	    if (userId != null && !userId.equals("")) {
	        dogLike.setRefUserId(userId);
	        existingLikeStatus = dService.getLikeStatus(dogLike); // refDogNo와 userId를 기반으로 데이터베이스에서 "좋아요" 상태를 가져옴
	        if (existingLikeStatus == null) {
	            // 데이터베이스에서 값을 가져오지 못한 경우 (최초 좋아요)
	            result = dService.insertLikeStatus(dogLike); // 첫 좋아요 등록 insert
	        } else {
	            result = dService.updateLikeStatus(dogLike); // 좋아요 상태 변경 update
	        }
	    }
	    return (result > 0) ? "success" : "fail";

	}

	
	// ==================== 페이징처리 메소드 ====================
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
