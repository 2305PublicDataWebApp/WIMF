package com.dog.save.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.board.domain.Board;
import com.dog.save.board.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@GetMapping("/write.dog")
	public ModelAndView boardWriteView(ModelAndView mv) {
		mv.setViewName("board/communityInsert");
		return mv;
	}
	@PostMapping("/write.dog")
	public ModelAndView boardWrite(ModelAndView mv
			, @ModelAttribute Board board) {
		int result = bService.insertBoard(board);
		if(result > 0) {
			mv.setViewName("redirect:/list.dog");
		}else {
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@GetMapping("/list.dog")
	public ModelAndView boardListView(ModelAndView mv) {
		List<Board> bList = bService.selectBoardList();
		mv.addObject("bList", bList).setViewName("board/communityList");
		return mv;
	}
}
