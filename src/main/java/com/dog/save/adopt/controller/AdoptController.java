package com.dog.save.adopt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dog.save.adopt.domain.Adopt;
import com.dog.save.adopt.domain.AdoptReply;
import com.dog.save.adopt.service.AdoptReplyService;
import com.dog.save.adopt.service.AdoptService;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;

@Controller
@RequestMapping(value="/adopt")
public class AdoptController {
	
	@Autowired
	private AdoptService aService;
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private AdoptReplyService arService;
	
	// ==================== 게시글 작성 페이지 ====================
	@GetMapping("/write.dog")
	public String adoptWriteView(Model model, HttpSession session) {
		String adoptWriter = (String)session.getAttribute("userId");
		if(adoptWriter == null || adoptWriter.isEmpty()) {
			model.addAttribute("msg", "로그인 후에 게시글을 작성할 수 있습니다");
			model.addAttribute("url", "/user/login.dog");
			return "common/error";
		}else {
			return "adopt/insert";
		}
	}
	// ==================== 게시글 작성 ====================
	@PostMapping("/write.dog")
	public String adoptWrite(@ModelAttribute Adopt adopt, Model model, HttpSession session) {
		// 작성자 session에서 userId 가져오기
		try {
			String adoptWriter = (String)session.getAttribute("userId");
			if(adoptWriter == null || adoptWriter.isEmpty()) {
				model.addAttribute("msg", "로그인 후에 게시글을 작성할 수 있습니다");
				model.addAttribute("url", "/user/login.dog");
				return "common/error";
			}else{
				adopt.setUserId(adoptWriter);
				int result = aService.insertAdopt(adopt);
				if(result > 0) {
					return "redirect:/adopt/list.dog";					
				}else {
					model.addAttribute("msg", "게시글 작성이 완료되지 않았습니다.");
					model.addAttribute("url", "/adopt/list.dog");
					return "common/error";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 수정 페이지 ====================
	@GetMapping("/update.dog")
	public String adoptUpdateView(Model model
			, @RequestParam("adoptNo") Integer adoptNo
			, HttpSession session) {
		try {
			Adopt adopt = aService.showOneByAdopt(adoptNo);
			String adoptWriter = (String)session.getAttribute("userId");
			String userId = adopt.getUserId();
			if(adoptWriter == null || adoptWriter.isEmpty()) {
				model.addAttribute("msg", "로그인 후에 게시글을 수정 할 수 있습니다");
				model.addAttribute("url", "/user/login.dog");
				return "common/error";
			}else if(!adoptWriter.equals(userId)){
				model.addAttribute("msg", "내가 작성한 글만 수정이 가능합니다");
				model.addAttribute("url", "/adopt/list.dog");
				return "common/error";
			}else {
				model.addAttribute("adopt", adopt);
				return "adopt/update";
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 수정 ====================
	@PostMapping("/update.dog")
	public String adoptUpdate(@ModelAttribute Adopt adopt, Model model, HttpSession session) {
		try {
			String adoptWriter = adopt.getUserId();
			String userId = (String)session.getAttribute("userId");
			if(adoptWriter != null && adoptWriter.equals(userId)) {
				int result = aService.updateAdoptByNo(adopt);
				if(result > 0) {
					return "redirect:/adopt/detail.dog?adoptNo="+adopt.getAdoptNo();
				}else {
					model.addAttribute("msg", "게시글 수정이 완료되지 않았습니다");
					model.addAttribute("url", "/adopt/list.dog");
					return "common/error";
				}
			}else {
				model.addAttribute("msg", "내가 작성한 글만 수정이 가능합니다");
				model.addAttribute("url", "/adopt/list.dog");
				return "common/error";
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 삭제 ====================
	@GetMapping("/delete.dog")
	public String adoptDelete(@ModelAttribute Adopt adopt, Model model, HttpSession session) {
		try {
			String adoptWriter = adopt.getUserId();
			String userId = (String)session.getAttribute("userId");
			User uOne = uService.selectOneById(userId);
			if(adoptWriter != null && adoptWriter.equals(userId) || uOne.getAdminCheck().equals("Y")) {
				int result = aService.deleteAdoptByNo(adopt);
				if(result > 0) {
					return "redirect:/adopt/list.dog";
				}else {
					model.addAttribute("msg", "게시글 삭제가 완료되지 않았습니다");
					model.addAttribute("url", "/adopt/list.dog");
					return "common/error";
				}
			}else {
				model.addAttribute("msg", "내가 작성한 글만 삭제가 가능합니다");
				model.addAttribute("url", "/adopt/list.dog");
				return "common/error";
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 리스트 조회 ====================
	@GetMapping("/list.dog")
	public String adoptListView(Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		Integer totalCount = aService.getListCount();
		bPageInfo bpInfo = this.getPageInfo(currentPage, totalCount);
		List<Adopt> aList = aService.selectAdoptList(bpInfo);
		model.addAttribute("aList", aList).addAttribute("bpInfo", bpInfo);
		return "adopt/list";
	}
	// ==================== 게시글 상세 조회 ====================
	@GetMapping("/detail.dog")
	public String adoptDetailView(Model model
			, @RequestParam("adoptNo") Integer adoptNo) {
		try {
			Adopt adopt = aService.showOneByAdopt(adoptNo);
			if(adopt != null) {
				String userId = adopt.getUserId();
				User uOne = uService.selectOneById(userId);
				String userNickName = uOne.getUserNickname();
				List<AdoptReply> replyList = arService.selectAdoptReplyList(adoptNo);
				aService.increaseViewCount(adoptNo);
				if(replyList.size() > 0) {
					model.addAttribute("rList", replyList);
				}
				model.addAttribute("userNickName", userNickName);
				model.addAttribute("adopt", adopt);
				return "adopt/detail";
			}else {
				model.addAttribute("msg", "게시글 조회에 실패하였습니다.");
				model.addAttribute("url", "/adopt/list.dog");
				return "common/error";
			}
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 페이징 처리 ====================
	public bPageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 6;
		int naviCountPerPage = 5;
		int naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		bPageInfo bpInfo = new bPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
			
		return bpInfo;
	}
	// ==================== 게시글 검색 처리 ====================
	@GetMapping("/search.dog")
	public String searchAdoptList(Model model
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		int totalCount = aService.getSelectAdoptByKeywordCount(paramMap);
		bPageInfo bpInfo = this.getPageInfo(currentPage, totalCount);
		List<Adopt> searchList = aService.searchAdoptByKeyword(bpInfo, paramMap);
		
		if(!searchList.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("bpInfo", bpInfo);
			model.addAttribute("aList", searchList);
			return "adopt/search";
		}else {
			model.addAttribute("msg", "데이터 조회가 되지 않습니다.");
			model.addAttribute("error", "공지사항 제목 조회 실패");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
}
