package com.dog.save.donation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/donation")
public class DonationController {

	
	// ==================== 후원 페이지 ====================
	@GetMapping("/money.dog")
	public String donationView() {
		return "donation/donationWrite";
	}
	// ==================== 유기견 후원 ====================
	@PostMapping("/money.dog") 
	public String donationInfoInsert() {
		return "donation/donationWrite";
	}
}
