package com.dog.save.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.Reply;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.board.service.BoardService;
import com.dog.save.board.service.ReplyService;
import com.dog.save.main.service.SummernoteThumbnailService;
import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@Autowired
	private BoardService bService;
	@Autowired
	private UserService uService;
	@Autowired
	private ReplyService rService;
	@Autowired
	private SummernoteThumbnailService stService;
	
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
				int likeCount = board.getLikeCount();
				model.addAttribute("likeCount", likeCount);
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
	// ===================== 게시글 좋아요 ======================
	@PostMapping("/like.dog")
    @ResponseBody
    public String likeBoard(Model model
    		, @RequestParam("boardNo") Integer boardNo) {
        try {
            Board board = bService.showOneByBoard(boardNo);
            if (board != null) {
            	bService.increaseLikeCount(boardNo); // 좋아요 수 증가 처리
            	int likeCount = board.getLikeCount();
            	model.addAttribute("likeCount", likeCount);
                return "true";
            } else {
            	model.addAttribute("msg", "게시글 조회에 실패하였습니다.");
				model.addAttribute("url", "/board/list.dog");
				return "false";
            }
        } catch (Exception e) {
        	model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/board/list.dog");
			return "false";
        }
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