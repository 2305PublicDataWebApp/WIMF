package com.dog.save.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;

@Controller
@RequestMapping(value="/user/")
public class UserController {
	
	@Autowired
	private UserService uService;
	
	
	@RequestMapping(value="login.dog", method=RequestMethod.GET)
	public String showLoginPage(Model model) {
		return "user/login";
	}
	
	@RequestMapping(value="register.dog", method=RequestMethod.GET)
	public String showRegisterPage(Model model) {
		return "user/register";
	}
	
	// ajax 회원가입 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="checkDuplUserId.dog", method=RequestMethod.POST)
	public String checkDuplUserId(@RequestParam("userId") String userId) {
		User uOne = uService.checkDuplUserId(userId);
		return (uOne != null) ? "true" : "false";
	}
	
	// 로그인
	@RequestMapping(value="login.dog", method=RequestMethod.POST)
	public String checkLogin(
			@ModelAttribute User user
			, Model model
			, HttpSession session) {
		try {
			User uOne = uService.checkLogin(user);
			if(uOne != null) {
				session.setAttribute("userId", uOne.getUserId());
				session.setAttribute("userNickname", uOne.getUserNickname());
				return "redirect:/";
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호가 다릅니다.");
				model.addAttribute("url", "/user/login.dog");			
				return "common/error";
			}			
		} catch (Exception e) {
			model.addAttribute("msg", "로그인 실패 (관리자 문의 요망)");
			model.addAttribute("url", "/user/login.dog");			
			return "common/error";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="logout.dog", method=RequestMethod.GET)
	public String userLogout(
			Model model
			, HttpSession session
			) {
		if(session != null) {
			session.invalidate();
			return "redirect:/";
		} else {
			model.addAttribute("msg", "로그아웃 실패 (관리자 문의 요망)");
			model.addAttribute("url", "/");
			return "common/error";
		}
	}
}
