package com.dog.save.user.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;

@Controller
@RequestMapping(value="/user/")
public class UserController {
	
	@Autowired
	private UserService uService;
	
	
	
	// 로그인 페이지 url
	@GetMapping(value="login.dog")
	public String showLoginPage(Model model) {
		return "user/login";
	}
	
	// 회원가입 페이지 url
	@GetMapping(value="register.dog")
	public String showRegisterPage(Model model) {
		return "user/register";
	}
	
	// 아이디 비밀번호 찾기 url
	@GetMapping(value="findUserIdPw.dog")
	public String showFindIdPwPage(Model model) {
		return "user/findUserIdPw";
	}
	
	// ajax 회원가입 아이디 중복체크 및 유효성 체크
	@ResponseBody
	@PostMapping(value="checkDuplUserId.dog")
	public String checkDuplUserId(@RequestParam("userId") String userId) {
		boolean isValid = idIsValid(userId);
		if(isValid) {
			User uOne = uService.checkDuplUserId(userId);			
			return (uOne != null) ? "true" : "false2";
		} else {
			return "false1";
		}
	}
	
	// ajax 회원가입 닉네임 중복체크 및 유효성 체크
	@ResponseBody
	@PostMapping(value="checkDuplUserNickname.dog")
	public String checkDuplUserNickname(@RequestParam("userNickname") String userNickname) {
		boolean isValid = nicknameIsValid(userNickname);
		if(isValid) {
			User uOne = uService.checkDuplUserNickname(userNickname);
			return (uOne != null) ? "true" : "false2";
		} else {
			return "false1";
		}
	}
	
	// ajax 회원가입 이메일 중복체크 및 유효성 체크
	@ResponseBody
	@PostMapping(value="checkDuplUserEmail.dog")
	public String checkDuplUserEmail(@RequestParam("userEmail") String userEmail) {
		boolean isValid = emailIsValid(userEmail);
		if(isValid) {
			User uOne = uService.checkDuplUserEmail(userEmail);
			return (uOne != null) ? "true" : "false2";
		} else {
			return "false1";			
		}
	}
	
	
	// ajax 아이디 찾기 유저 유효성 체크
	@ResponseBody
	@PostMapping(value="checkUserByNameEmail.dog")
	public String checkUserByNameEmail(
			@RequestParam("userName") String userName
			, @RequestParam("userEmail") String userEmail
			) {
		User user = new User();
		user.setUserName(userName);
		user.setUserEmail(userEmail);
		User uOne = uService.checkUserByNameEmail(user);
	    if (uOne != null) {
	        return "true," + uOne.getUserId();
	    } else {
	        return "false";
	    }
	}

	// ajax 비밀번호 찾기 유저 유효성 체크
	@ResponseBody
	@PostMapping(value="checkUserByNameIdEmail.dog")
	public String checkUserByNameIdEmail (
			@RequestParam("userName") String userName
			, @RequestParam("userId") String userId
			, @RequestParam("userEmail") String userEmail
			) {
		User user = new User();
		user.setUserName(userName);
		user.setUserId(userId);
		user.setUserEmail(userEmail);
		User uOne = uService.checkUserByNameIdEmail(user);
		return (uOne != null) ? "true" : "false";
	}
	
	// 로그인
	@PostMapping(value="login.dog")
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
	@GetMapping(value="logout.dog")
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
	
	// 회원가입
	@ResponseBody
	@PostMapping(value="register.dog")
	public String insertUser(
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, @RequestParam("userId") String userId
			, @RequestParam("userPw") String userPw
			, @RequestParam("userName") String userName
			, @RequestParam("userNickname") String userNickname
			, @RequestParam("userSSN") String userSSN
			, @RequestParam("userAddressVal") String userAddressVal
			, @RequestParam("userDetailAddress") String userDetailAddress
			, @RequestParam("userPhone") String userPhone
			, @RequestParam("userEmail") String userEmail
			, HttpServletRequest request
			) {
		
		String userAddress = userAddressVal + " " + userDetailAddress;
		User user = new User(userId, userPw, userName, userNickname, userAddress, userPhone, userSSN, userEmail);
		
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				Map<String, Object> userMap = this.saveFile(request, uploadFile);
				user.setUserFileName((String)userMap.get("fileName"));
				user.setUserFileRename((String)userMap.get("fileRename"));
				user.setUserFilePath((String)userMap.get("filePath"));
				user.setUserFileLength((long)userMap.get("fileLength"));
			} else {
				user.setUserFileName(null);
				user.setUserFileRename(null);
				user.setUserFilePath(null);
				user.setUserFileLength(0);
			}
			int result = uService.insertUser(user);
			if(result > 0) {
				return "true";
			} else {
				return "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	// 아이디 유효성 체크 정규식
		private boolean idIsValid(String userId) {
			String pattern = "^[a-z0-9]{6,14}$";
			Pattern compiledPattern = Pattern.compile(pattern);
	        Matcher matcher = compiledPattern.matcher(userId);
	        boolean isValid = matcher.matches();
			return isValid;
		}
		
		// 닉네임 유효성 체크 정규식
		private boolean nicknameIsValid(String userNickname) {
			String pattern = "^[가-힣a-zA-Z0-9]{2,15}$";
			Pattern compiledPattern = Pattern.compile(pattern);
	        Matcher matcher = compiledPattern.matcher(userNickname);
	        boolean isValid = matcher.matches();
			return isValid;
		}
		
		// 이메일 유효성 체크 정규식
		private boolean emailIsValid(String userEmail) {
			String pattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$";
			Pattern compiledPattern = Pattern.compile(pattern);
	        Matcher matcher = compiledPattern.matcher(userEmail);
	        boolean isValid = matcher.matches();
			return isValid;
		}
		
		// 파일 업로드 관련 컨트롤러
		public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws IllegalStateException, IOException{
			Map<String, Object> fileMap = new HashMap<String, Object>();
			// resources 경로 구하기
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			// 파일 저장 경로 구하기
			String savePath = root + "\\profileUploadFiles";
			
			// 파일 이름 구하기
			String fileName = uploadFile.getOriginalFilename();
			
			// 파일 확장자 구하기
			String extension = fileName.substring(uploadFile.getOriginalFilename().lastIndexOf(".")+1);
			
			// 시간으로 파일 리네임 하기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String fileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+extension;
			// 파일 저장 전 폴더 만들기
			File saveFolder = new File(savePath);
			if(!saveFolder.exists()) {
				saveFolder.mkdir();
			}
			
			// 파일 저장
			File saveFile = new File(savePath+"\\"+fileRename);
			uploadFile.transferTo(saveFile);
			long fileLength = uploadFile.getSize();
			
			// 파일 정보 리턴
			fileMap.put("fileName", fileName);
			fileMap.put("fileRename", fileRename);
			fileMap.put("filePath", "../resources/profileUploadFiles/" + fileRename);
			fileMap.put("fileLength", fileLength);
			return fileMap;
			
		}
}
