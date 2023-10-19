package com.dog.save.main.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dog.save.board.domain.Board;
import com.dog.save.board.service.BoardService;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogSet;
import com.dog.save.dog.service.DogService;
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
	
	//==================== main 리스트 조회 ====================
	@GetMapping("")
	public String boardAllListView(Model model) {

			// board List 가져오기
		List<Board> bList = bService.selectAllBoardList();
		
			// 닉네임 가져오기
		for (Board board : bList) {
	        String userId = board.getBoardWriter();
	        User user = uService.selectOneById(userId);
	        board.setUserNickName(user.getUserNickname());
	    }
		model.addAttribute("bList", bList);
		
			// dog List 가져오기
		List<Dog> dList = dService.selectAllDogList();
		
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
		
		return "index";
	}
	
}
