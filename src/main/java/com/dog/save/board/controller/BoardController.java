package com.dog.save.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.board.domain.Board;
import com.dog.save.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@GetMapping("/board/list.do")
	public ModelAndView boardListView(ModelAndView mv) {
		List<Board> bList = bService.selectBoardList();
		mv.addObject("bList", bList).setViewName("board/list");
		return mv;
	}
}
