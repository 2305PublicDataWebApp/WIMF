package com.dog.save.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.board.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@Autowired
	private BoardService bService;
	
	// ==================== 게시글 작성 페이지 ====================
	@GetMapping("/write.dog")
	public String boardWriteView() {
		return "board/communityInsert";
	}
	// ==================== 게시글 작성 ====================
	@PostMapping("/write.dog")
	public String boardWrite(@ModelAttribute Board board, Model model, HttpSession session) {
		// 작성자 session에서 userId 가져오기
		try {
			String boardWriter = (String)session.getAttribute("userId");
			if(boardWriter != null && !boardWriter.equals("")) {
				board.setBoardWriter(boardWriter);
				int result = bService.insertBoard(board);
				return "redirect:/board/list.dog";
			}else {
				model.addAttribute("msg", "게시글 등록이 완료되지 않았습니다");
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
}