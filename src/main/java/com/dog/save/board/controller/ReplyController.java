package com.dog.save.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dog.save.board.domain.Reply;
import com.dog.save.board.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	ReplyService rService;
	// 댓글 작성
	@PostMapping("/add.dog")
	public String insertReply(Model model
			, @ModelAttribute Reply reply
			, HttpSession session) {
		String url = "";
		try {
			String replyWriter = (String)session.getAttribute("userId");
			if(replyWriter == null || replyWriter.isEmpty()) {
				model.addAttribute("msg", "로그인 후 댓글을 작성할 수 있습니다");
	            model.addAttribute("url", "/user/login.do"); // 로그인 페이지로 리다이렉트
	            return "common/error";
			}
			reply.setReplyBoardWriter(replyWriter);
			int result = rService.insertReply(reply);
			url = "/board/detail.dog?boardNo="+reply.getReplyBoardNo();
			if(result > 0) {
				return "redirect:" + url;
			}else {
				model.addAttribute("msg", "댓글 작성이 완료되지 않았습니다");
				model.addAttribute("url", "/board/detail.dog");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/board/detail.dog");
			return "common/error";
		}
	}
	// 댓글 수정
	@PostMapping("/update.dog")
	public String updateReply(Model model
			, @ModelAttribute Reply reply
			, HttpSession session) {
		String url = "";
		try {
			String replyWriter = (String)session.getAttribute("userId");
			if(replyWriter != null && !replyWriter.equals("")) {
				reply.setReplyBoardWriter(replyWriter);
				url = "/board/detail.dog?boardNo="+reply.getReplyBoardNo();
				int result = rService.updateReply(reply);
				return "redirect:" + url;
			}else {
				model.addAttribute("msg", "댓글 수정이 완료되지 않았습니다");
				model.addAttribute("url", "/board/detail.dog");
				return "common/error";
			}
		}catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/board/detail.dog");
			return "common/error";
		}
	}
	// 댓글 삭제
	@GetMapping("/delete.dog")
	public String deleteReply(Model model
			, @ModelAttribute Reply reply
			, HttpSession session) {
		String url = "";
		try {
			String userId = (String)session.getAttribute("userId");
			String replyBoardWriter = reply.getReplyBoardWriter();
			url = "/board/detail.dog?boardNo="+reply.getReplyBoardNo();
			if(replyBoardWriter != null && replyBoardWriter.equals(userId)) {
				int result = rService.deleteReply(reply);
				if(result > 0) {
					return "redirect:" + url;
				}else {
					model.addAttribute("msg", "댓글 삭제가 완료되지 않았습니다");
					model.addAttribute("url", "/board/detail.dog");
					return "common/error";
				}
			} else {
				model.addAttribute("msg", "자신의 댓글만 삭제할 수 있습니다");
				model.addAttribute("url", "/board/detail.dog");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/board/detail.dog");
			return "common/error";
		}
	}
}
