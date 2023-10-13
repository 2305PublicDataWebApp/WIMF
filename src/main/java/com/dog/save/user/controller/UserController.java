package com.dog.save.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@ResponseBody
	@RequestMapping(value="checkDuplUserId.dog", method=RequestMethod.POST)
	public String checkDuplUserId(@RequestParam("userId") String userId) {
		User uOne = uService.checkDuplUserId(userId);
		return (uOne != null) ? "true" : "false";
	}
}
