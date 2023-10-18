package com.dog.save.adopt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dog.save.adopt.domain.AdoptReply;
import com.dog.save.adopt.service.AdoptReplyService;

@Controller
@RequestMapping("/adoptreply")
public class AdoptReplyController {
	
	@Autowired
	private AdoptReplyService arService;
	
		// 댓글 작성
		@PostMapping("/add.dog")
		public String insertAdoptReply(Model model
				, @ModelAttribute AdoptReply reply
				, HttpSession session) {
			String url = "";
			try {
				String replyWriter = (String)session.getAttribute("userId");
				if(replyWriter == null || replyWriter.isEmpty()) {
					model.addAttribute("msg", "로그인 후 댓글을 작성할 수 있습니다");
		            model.addAttribute("url", "/user/login.dog"); // 로그인 페이지로 리다이렉트
		            return "common/error";
				}else{
					reply.setUserId(replyWriter);
					int result = arService.insertAdoptReply(reply);
					url = "redirect:/adopt/detail.dog?adoptNo="+reply.getAdoptNo();
					if(result > 0) {
						return url;
					}else {
						model.addAttribute("msg", "댓글 작성이 완료되지 않았습니다");
						model.addAttribute("url", "redirect:/adopt/detail.dog?adoptNo="+reply.getAdoptNo());
						return "common/error";
					}
				}
				
			} catch (Exception e) {
				model.addAttribute("msg", "관리자에게 문의 바랍니다");
				model.addAttribute("url", "redirect:/adopt/detail.dog?adoptNo="+reply.getAdoptNo());
				return "common/error";
			}
		}
	
	// 댓글 수정
	@PostMapping("/update.dog")
	public String updateAdoptReply(Model model
			, @ModelAttribute AdoptReply reply
			, HttpSession session) {
		String url = "";
		try {
			String replyWriter = (String)session.getAttribute("userId");
			if(replyWriter != null && !replyWriter.equals("")) {
				reply.setUserId(replyWriter);
				url = "redirect:/adopt/detail.dog?adoptNo="+reply.getAdoptNo();
				int result = arService.updateAdoptReply(reply);
				if(result > 0) {
					return url;
				}else {
					model.addAttribute("msg", "댓글 수정이 완료되지 않았습니다.");
					model.addAttribute("url", url);
					return "common/error";
				}
			}else {
				model.addAttribute("msg", "댓글 작성인만 수정 가능합니다.");
				model.addAttribute("url", "redirect:/adopt/detail.dog?adoptNo="+reply.getAdoptNo());
				return "common/error";
			}
		}catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "redirect:/adopt/detail.dog?adoptNo="+reply.getAdoptNo());
			return "common/error";
		}
	}
	// 댓글 삭제
	@GetMapping("/delete.dog")
	public String deleteAdoptReply(Model model
			, @ModelAttribute AdoptReply reply
			, HttpSession session) {
		String delUrl = "";
		try {
			String userId = (String)session.getAttribute("userId");
			String replyBoardWriter = reply.getUserId();
			delUrl = "redirect:/adopt/detail.dog?adoptNo="+reply.getAdoptNo();
			if(replyBoardWriter != null && replyBoardWriter.equals(userId) || userId.equals("admin")) {
				int result = arService.deleteAdoptReply(reply);
				if(result > 0) {
					return "redirect:" + delUrl;
				}else {
					model.addAttribute("msg", "댓글 삭제가 완료되지 않았습니다");
					model.addAttribute("url", delUrl);
					return "common/error";
				}
			} else {
				model.addAttribute("msg", "자신의 댓글만 삭제할 수 있습니다");
				model.addAttribute("url", delUrl);
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "redirect:/adopt/detail.dog?adoptNo="+reply.getAdoptNo());
			return "common/error";
		}
	}
	
}
