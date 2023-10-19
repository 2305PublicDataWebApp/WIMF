package com.dog.save.donation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.service.DogService;
import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;

@Controller
@RequestMapping("/donation")
public class DonationController {

	@Autowired
	private DogService dService;
	@Autowired
	private UserService uService;
	
	// ==================== 후원 페이지 ====================
	@GetMapping("/money.dog")
	public String donationView(Model model, HttpSession session
			, @RequestParam(value="dogNo") int dogNo) {
		String userId = (String) session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			model.addAttribute("msg", "로그인 후에 후원 할 수 있습니다");
			model.addAttribute("url", "/user/login.dog");
			return "common/error";
		}else {
			// user 리스트 가져오기
			User user = uService.selectOneById(userId);
			// dog 리스트 가져오기
			Dog dog = dService.selectDogByDogNo(dogNo);
			List<DogFile> dogFileList = dService.selectDogFileByDogNo(dogNo);
			if(dog != null && dogFileList.size()!=0) {
				model.addAttribute("user", user);
				model.addAttribute("dog", dog);
				model.addAttribute("dogFileList", dogFileList);
				return "donation/donationWrite";
			} else {
				model.addAttribute("msg", "돌봄 강아지 조회가 완료되지 않았습니다");
				model.addAttribute("url", "/");
				return "common/error";
			}
		}
	}
	// ==================== 유기견 후원 ====================
	@PostMapping("/money.dog")
	public String donationInfoInsert() {
		return "donation/donationWrite";
	}
}
