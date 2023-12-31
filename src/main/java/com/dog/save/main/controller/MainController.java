package com.dog.save.main.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.dog.save.board.domain.Board;
import com.dog.save.board.service.BoardService;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogSet;
import com.dog.save.dog.service.DogService;
import com.dog.save.mail.service.MailService;
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
	@Autowired
	private MailService mService;
	
	// ==================== main 리스트 조회 ====================
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
		List<Dog> careList = dService.selectCareList();
		List<Dog> adoptList = dService.selectAdoptList();
		List<Dog> noneList = dService.selectNoneList();

		// count 정보 가져오기
		int allDogCount = (dList == null) ? 0 : dList.size();
		int careCount = dService.getCareDogCount();
		int adoptCount = dService.getAdoptDogCount();
		int noneCount = dService.getNoneDogCount();
		model.addAttribute("allDogCount", allDogCount);
		model.addAttribute("careCount", careCount);
		model.addAttribute("adoptCount", adoptCount);
		model.addAttribute("noneCount", noneCount);
		
			// 사진 매칭
		List<DogFile> dogFileList;
		dogFileList = dService.selectFirstDogFile();
		
		// allDogList 사진 매칭
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
		
		// careDogList 사진 매칭
		List<DogSet> careDogList = new ArrayList<>();
		for (Dog dog : careList) {
			DogSet dogSet = new DogSet();
			dogSet.setDog(dog);
			// 각 Dog와 매칭되는 DogFile 찾기
			for (DogFile dogFile : dogFileList) {
				if (dog.getDogNo() == dogFile.getRefDogNo()) {
					dogSet.setDogFile(dogFile);
					break;
				}
			}
			careDogList.add(dogSet);
		}		
		model.addAttribute("careDogList", careDogList);
		
		// adoptDogList 사진 매칭
		List<DogSet> adoptDogList = new ArrayList<>();
		for (Dog dog : adoptList) {
			DogSet dogSet = new DogSet();
			dogSet.setDog(dog);
			// 각 Dog와 매칭되는 DogFile 찾기
			for (DogFile dogFile : dogFileList) {
				if (dog.getDogNo() == dogFile.getRefDogNo()) {
					dogSet.setDogFile(dogFile);
					break;
				}
			}
			adoptDogList.add(dogSet);
		}		
		model.addAttribute("adoptDogList", adoptDogList);
		
		// noneDogList 사진 매칭
		List<DogSet> noneDogList = new ArrayList<>();
		for (Dog dog : noneList) {
			DogSet dogSet = new DogSet();
			dogSet.setDog(dog);
			// 각 Dog와 매칭되는 DogFile 찾기
			for (DogFile dogFile : dogFileList) {
				if (dog.getDogNo() == dogFile.getRefDogNo()) {
					dogSet.setDogFile(dogFile);
					break;
				}
			}
			noneDogList.add(dogSet);
		}		
		model.addAttribute("noneDogList", noneDogList);
		
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
	
	// ==================== ajax 회원가입 이메일 중복체크 및 유효성 체크 ====================
	@ResponseBody
	@PostMapping(value="checkDuplUserEmail.dog")
	public String checkDuplUserEmail(@RequestParam("userEmail") String userEmail) {
		boolean isValid = emailIsValid(userEmail);
		if(isValid) {
			return "false2";
		} else {
			return "false1";
		}
	}
	
	// ==================== 이메일 유효성 체크 정규식 ====================
	private boolean emailIsValid(String userEmail) {
		String pattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$";
		Pattern compiledPattern = Pattern.compile(pattern);
		Matcher matcher = compiledPattern.matcher(userEmail);
		boolean isValid = matcher.matches();
		return isValid;
	}
	
	// ==================== 이메일 보내기 ====================
	@ResponseBody
	@PostMapping(value="sendMail.dog")
	public String MailSend(@RequestParam Map<String, String> emailParams) {
		String userVoiceEmail = mService.MailSenderToWimfFromUser(emailParams);
		System.out.println(userVoiceEmail);
		return userVoiceEmail;
	}
	
}
