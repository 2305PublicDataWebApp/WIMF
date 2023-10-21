package com.dog.save.main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dog.save.adopt.domain.Adopt;
import com.dog.save.adopt.service.AdoptService;
import com.dog.save.app.domain.App;
import com.dog.save.app.service.AppService;
import com.dog.save.board.domain.Board;
import com.dog.save.board.service.BoardService;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogSet;
import com.dog.save.dog.service.DogService;
import com.dog.save.donation.domain.Donation;
import com.dog.save.donation.service.DonationService;
import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;

@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	private BoardService bService;
	@Autowired
	private DogService dService;
	@Autowired
	private UserService uService;
	@Autowired
	private AdoptService aService;
	
	//==================== main 리스트 조회 ====================
	@GetMapping("")
	public String boardAllListView(Model model) {

			// board List 가져오기
		List<Board> bList = bService.selectAllBoardList();
		// user 닉네임, 프로필 가져오기
		for (Board board : bList) {
	        String userId = board.getBoardWriter();
	        User user = uService.selectOneById(userId);
	        board.setUserNickName(user.getUserNickname());
	        board.setUserProfile(user.getUserFilePath());
	    }
		model.addAttribute("bList", bList);
		
			// dog List 가져오기
		List<Dog> dList = dService.selectAllDogList();
		
		// count 정보 가져오기
		List<Dog> careList = dService.selectCareList();
		List<Dog> adoptList = dService.selectAdoptList();
		int careCount = (careList == null) ? 0 : careList.size();
		int adoptCount = (adoptList == null) ? 0 : adoptList.size();
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("adoptCount = " + adoptCount);
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		System.out.println("=================================================");
		int allDogCount = (dList == null) ? 0 : dList.size();
		model.addAttribute("careList", careList);
		model.addAttribute("adoptList", adoptList);
		model.addAttribute("careCount", careCount);
		model.addAttribute("adoptCount", adoptCount);
		model.addAttribute("allDogCount", allDogCount);
		
		// 사진 매칭
		List<DogFile> dogFileList;
		dogFileList = dService.selectFirstDogFile();
		
		List<DogSet> combinedList = new ArrayList<>();
		for (Dog dog : dList) {
			DogSet dogSet = new DogSet();
			dogSet.setDog(dog);
			// 각 Dog와 매칭되는 DogFile 찾기
			for (DogFile dogFile : dogFileList) {
				if (dog.getDogNo() == dogFile.getRefDogNo()) {
					dogSet.setDogFile(dogFile);
					break;
				}
			}
			combinedList.add(dogSet);
		}		
		model.addAttribute("combinedList", combinedList);
		
			// adopt List 가져오기
		List<Adopt> aList = aService.selectAllAdobtList();
		// user 닉네임, 프로필 가져오기
			for (Adopt adopt : aList) {
		        String userId = adopt.getUserId();
		        User user = uService.selectOneById(userId);
		        adopt.setUserNickName(user.getUserNickname());
		        adopt.setUserProfile(user.getUserFilePath());
		    }
		model.addAttribute("aList", aList);
		
		return "index";
	}
	
}
