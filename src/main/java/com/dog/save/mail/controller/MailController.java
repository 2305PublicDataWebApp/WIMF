package com.dog.save.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dog.save.mail.service.MailService;

@Controller
@RequestMapping(value="/user/")
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@ResponseBody
	@PostMapping(value="sendMail.dog")
	public String MailSend(String mail) {
		int num = mailService.sendMail(mail);
		String ranNum = "" + num;
		System.out.println(ranNum);
		return ranNum;
	}
}
