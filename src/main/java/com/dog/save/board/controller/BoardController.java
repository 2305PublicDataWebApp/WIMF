package com.dog.save.board.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.BoardLike;
import com.dog.save.board.domain.Reply;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.board.service.BoardService;
import com.dog.save.board.service.ReplyService;
import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@Autowired
	private BoardService bService;
	@Autowired
	private UserService uService;
	@Autowired
	private ReplyService rService;
	
	// ==================== 게시글 작성 페이지 ====================
	@GetMapping("/write.dog")
	public String boardWriteView() {
		return "board/communityInsert";
	}
	// ==================== 게시글 작성(정대 코드) ====================
	@PostMapping("/write.dog")
	public String boardWrite(@ModelAttribute Board board, Model model, HttpSession session) {
		// 작성자 session에서 userId 가져오기
		try {
			String boardWriter = (String)session.getAttribute("userId");
			if(boardWriter == null || boardWriter.isEmpty()) {
				model.addAttribute("msg", "로그인 후에 게시글을 작성할 수 있습니다");
				model.addAttribute("url", "/user/login.dog");
				return "common/error";
			}else if(boardWriter != null && !boardWriter.equals("")) {
				board.setBoardWriter(boardWriter);
				int result = bService.insertBoard(board);
				return "redirect:/board/list.dog";
			}else {
				model.addAttribute("msg", "게시글 작성이 완료되지 않았습니다.");
				model.addAttribute("url", "/board/list.dog");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/board/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 수정 페이지 ====================
	@GetMapping("/update.dog")
	public String boardUpdateView(Model model
			, @RequestParam("boardNo") Integer boardNo) {
		try {
			Board board = bService.selectBoardByNo(boardNo);
			if(board != null) {
				model.addAttribute("board", board);
				return "board/communityUpdate";
			}else {
				model.addAttribute("msg", "게시글 수정이 완료되지 않았습니다");
				model.addAttribute("url", "/board/list.dog");
				return "common/error";
			}
		}catch(Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/board/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 수정 ====================
	@PostMapping("/update.dog")
	public String boardUpdate(@ModelAttribute Board board, Model model, HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			String boardWriter = board.getBoardWriter();
			if(boardWriter != null && boardWriter.equals(userId)) {
				int result = bService.updateBoardByNo(board);
				if(result > 0) {
					return "redirect:/board/detail.dog?boardNo="+board.getBoardNo();
				}else {
					model.addAttribute("msg", "게시글 수정이 완료되지 않았습니다");
					model.addAttribute("url", "/board/list.dog");
					return "common/error";
				}
			}else {
				model.addAttribute("msg", "내가 작성한 글만 수정이 가능합니다");
				model.addAttribute("url", "/board/list.dog");
				return "common/error";
			}
		} catch(Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/board/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 삭제 ====================
	@GetMapping("/delete.dog")
	public String boardDelete(@ModelAttribute Board board, Model model, HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			String boardWriter = board.getBoardWriter();
			if(boardWriter != null && boardWriter.equals(userId) || userId.equals("admin")) {
				int result = bService.deleteBoardByNo(board);
				if(result > 0) {
					return "redirect:/board/list.dog";
				}else {
					model.addAttribute("msg", "게시글 삭제가 완료되지 않았습니다");
					model.addAttribute("url", "/board/list.dog");
					return "common/error";
				}
			}else {
				model.addAttribute("msg", "내가 작성한 글만 삭제가 가능합니다");
				model.addAttribute("url", "/board/list.dog");
				return "common/error";
			}
		} catch(Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/board/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 리스트 조회 ====================
	@GetMapping("/list.dog")
	public String boardListView(Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		Integer totalCount = bService.getListCount();
		bPageInfo bpInfo = this.getPageInfo(currentPage, totalCount);
		List<Board> bList = bService.selectBoardList(bpInfo);
		
//		for (Board board : bList) {
//			int replyCount = bService.getReplyCount(board.getBoardNo());
//			board.setReplyCount(replyCount);
//		}
		model.addAttribute("bList", bList).addAttribute("bpInfo", bpInfo);
		return "board/communityList";
	}
	// ==================== 게시글 상세 조회 ====================
	@GetMapping("/detail.dog")
	public String boardDetailView(Model model
			, @RequestParam("boardNo") Integer boardNo) {
		try {
			Board board = bService.showOneByBoard(boardNo);
			if(board != null) {
				String userId = board.getBoardWriter();
				User uOne = uService.selectOneById(userId);
				String userNickName = uOne.getUserNickname();
				List<Reply> replyList = rService.selectReplyList(boardNo);
				bService.increaseViewCount(boardNo); // 조회수 증가
				if(replyList.size() > 0) {
					model.addAttribute("rList", replyList);
				}
				model.addAttribute("userNickName", userNickName);
				model.addAttribute("board", board);
				return "board/communityDetail";
			}else {
				model.addAttribute("msg", "게시글 조회에 실패하였습니다.");
				model.addAttribute("url", "/board/list.dog");
				return "common/error";
			}
		}catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/board/list.dog");
			return "common/error";
		}
	}
	// ==================== 게시글 좋아요 상태 체크 ====================
	@GetMapping("/checkBoardLike.dog")
	@ResponseBody
	public String checkBoardLike(@ModelAttribute BoardLike boardLike, HttpSession session) {
		String userId = (String) session.getAttribute("userId"); //  세션에서 userId 라는 속성을 가져오는 코드
		
		if(userId != null && !userId.equals("")) { // userId 변수가 null이 아니고 비어있지 않을 때만 조건문이 참
			
			boardLike.setBoardWriteId(userId); // boardLike 객체의 setBoardWriteId 메서드를 호출하여 userId 값을 설정
			String existingLikeStatus = bService.getLikeStatus(boardLike); // boardLike 객체에 관련된 좋아요 상태를 가져와서 existingLikeStatus 변수에 할당
			
			if("Y".equals(existingLikeStatus)) {
				return "liked"; // 좋아요가 체크된 상태
			} else {
				return "notliked"; // 좋아요가 체크되지 않은 상태
			}
		} else {
			return "unauthorized"; // 로그인이 되어 있지 않은 사용자
		}
	}
	// ==================== 게시글 좋아요 ====================
	@PostMapping("/updateBoardLike.dog")
	@ResponseBody
	public String updateBoardLike(@ModelAttribute BoardLike boardLike, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		int result = 0;
		String existingLikeStatus = null;
		
		if(userId != null && !userId.equals("")) {
			boardLike.setBoardWriteId(userId);
			existingLikeStatus = bService.getLikeStatus(boardLike);
			if(existingLikeStatus == null) {
				// DB에 좋아요 데이터가 없는 상태 (insert)
				result = bService.insertLikeStatus(boardLike);
			} else {
				// DB에 좋아요 데이터가 있는 상태 (update)
				result = bService.updateLikeStatus(boardLike);
			}
		}
		// 삼항연산자
		// 조건 ? 참 : 거짓
		return(result > 0) ? "success" : "fail";
	}
	// ==================== 게시글 페이징 처리 ====================
	public bPageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 7;
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
	public String searchBoardList(Model model
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		
		Map<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		
		int totalCount = bService.getListSearchCount(paramMap);
		bPageInfo bpInfo = this.getPageInfo(currentPage, totalCount);
		List<Board> searchList = bService.searchBoardByKeyword(bpInfo, paramMap);
		
		if(!searchList.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("bpInfo", bpInfo);
			model.addAttribute("bList", searchList);
			return "board/communitySearch";
		}else {
			model.addAttribute("msg", "데이터 조회가 되지 않습니다.");
			model.addAttribute("error", "공지사항 제목 조회 실패");
			model.addAttribute("url", "/board/list.dog");
			return "common/error";
		}
	}
}