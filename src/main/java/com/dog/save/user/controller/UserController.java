package com.dog.save.user.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.lang.reflect.Type;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dog.save.app.domain.App;
import com.dog.save.app.service.AppService;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.board.service.BoardService;
import com.dog.save.dog.service.DogService;
import com.dog.save.donation.service.DonationService;
import com.dog.save.user.domain.User;
import com.dog.save.user.domain.UserBoard;
import com.dog.save.user.domain.UserDog;
import com.dog.save.user.domain.UserDonation;
import com.dog.save.user.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;


@Controller
@RequestMapping(value="/user/")
public class UserController {
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private DogService dService;
	
	@Autowired
	private AppService aService;
	
	@Autowired
	private DonationService donaService;
	
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
	
	// 마이페이지 url
	@GetMapping(value="myPage.dog")
	public String showMypage(
			Model model
			, HttpSession session
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			) {
		try {
			String sessionId = (String)session.getAttribute("userId");
			if(sessionId != null) {
				Integer totalCount = bService.getListCount();
				bPageInfo bpInfo = this.getPageInfo(currentPage, totalCount);
				model.addAttribute("bpInfo", bpInfo);
				return "user/myPage";
			} else {
				model.addAttribute("msg", "로그인이 필요한 기능입니다.");
				model.addAttribute("url", "/user/login.dog");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("url", "/user/login.dog");
			return "common/error";
		}
	}
	
	
	// ajax 마이페이지 후원중인 강아지 리스트 출력
	@ResponseBody
	@PostMapping(value="myPageDonationList.dog", produces="application/json;charset=utf-8")
	public String showDonationDogList(HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			List<UserDonation> donaList = donaService.selectListById(userId);
			if(donaList.size() > 0 || !donaList.isEmpty()) {
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				return gson.toJson(donaList);
			} else {
				return "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		
	}
	
	// ajax 마이페이지 본인 게시물 리스트 출력
	@ResponseBody
	@PostMapping(value="myPageBoardList.dog", produces="application/json;charset=utf-8")
	public String showUserBoardList(
			HttpSession session
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			) {
		try {
			String userId = (String)session.getAttribute("userId");
			Integer totalCount = bService.getListCount();
			bPageInfo bpInfo = this.getPageInfo(currentPage, totalCount);
			UserBoard uBoard = new UserBoard(userId, bpInfo.getCurrentPage(), bpInfo.getTotalCount(), bpInfo.getNaviTotalCount(), bpInfo.getRecordCountPerPage()
					, bpInfo.getNaviCountPerPage(), bpInfo.getStartNavi(), bpInfo.getEndNavi());
			List<UserBoard> uBList = bService.selectBoardListById(uBoard);
			if(uBList.size() > 0 || !uBList.isEmpty()) {
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				return gson.toJson(uBList);
			} else {
				return "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	// ajax 마이페이지 좋아요 누른 게시물 리스트 출력
	@ResponseBody
	@PostMapping(value="myPageLikeList.dog", produces="application/json;charset=utf-8")
	public String showUserLikeList(HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			List<UserDog> dLList = dService.selectLikeDogList(userId);
			if(dLList.size() > 0 || !dLList.isEmpty()) {
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				return gson.toJson(dLList);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
		return "false";
	}
	
	// ajax 마이페이지 신청중인 입양신청서 게시물 리스트 출력
	@ResponseBody
	@PostMapping(value="myPageAdoptList.dog", produces="application/json;charset=utf-8")
	public String showDogAdoptList(HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			List<App> aList = aService.selectAppListById(userId);
			if(aList.size() > 0 || !aList.isEmpty()) {
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				return gson.toJson(aList);
			} else {
				return "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	// ajax 마이페이지 회원 개인정보 출력 
	@ResponseBody
	@PostMapping(value="showPerInf.dog", produces="application/json;charset=utf-8")
	public String showUserPersnalInfo(
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, @RequestParam("userId") String userId
			, HttpServletRequest request
			) {
		try {
			User user = uService.selectOneById(userId);
			if(user != null) {
				JSONObject userJson = new JSONObject();
				userJson.put("userIdVal", user.getUserId());
				userJson.put("userNameVal", user.getUserName());
				userJson.put("userNicknameVal", user.getUserNickname());
				userJson.put("userAddressVal", user.getUserAddress());
				userJson.put("userPhoneVal", user.getUserPhone());
				userJson.put("userEmailVal", user.getUserEmail());
				
				if(user.getUserFileRename() != null) {
					userJson.put("userFileRenameVal", user.getUserFileRename());
				} else {
//					String setDefaultProfile = user.setUserFileRename("noneProfile");
					userJson.put("userFileRenameVal", "noneProfile");
				}
				return userJson.toString();
			}else {
				return "null";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "null";
		}
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
	    	String userId = uOne.getUserId();
	    	String subUserId = uOne.getUserId().substring(0, userId.length()-3);
	    	String resultUserId = subUserId + "***";
	        return "true," + resultUserId;
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
				session.setAttribute("adminCheck", uOne.getAdminCheck());
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
			, User userData
			, HttpServletRequest request
			) {
		
		String userAddress = userData.getUserAddress() + " " + userData.getUserDetailAddress();
		userData.setUserAddress(userAddress);
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				Map<String, Object> userMap = this.saveFile(request, uploadFile);
				userData.setUserFileName((String)userMap.get("fileName"));
				userData.setUserFileRename((String)userMap.get("fileRename"));
				userData.setUserFilePath((String)userMap.get("filePath"));
				userData.setUserFileLength((long)userMap.get("fileLength"));
			} else {
				userData.setUserFileName("default-profile.png");
				userData.setUserFileRename("default-profile.png");
				userData.setUserFilePath("/img/user/default-profile.png");
				userData.setUserFileLength(0);
			}
			int result = uService.insertUser(userData);
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
	
	// 개인정보 수정
	@ResponseBody
	@PostMapping(value="update.dog")
	public String updateUser(
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, User userData
			, HttpServletRequest request
			) {
		try {
			String userFileRename = userData.getUserFileRename();
			String userAddress = userData.getUserAddress() + " " + userData.getUserDetailAddress();
			userData.setUserAddress(userAddress);
			
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				if(userFileRename != null) {
					this.deleteUserProfile(request, userFileRename);
				}
				Map<String, Object> userMap = this.saveFile(request, uploadFile);
				userData.setUserFileName((String)userMap.get("fileName"));
				userData.setUserFileRename((String)userMap.get("fileRename"));
				userData.setUserFilePath((String)userMap.get("filePath"));
				userData.setUserFileLength((long)userMap.get("fileLength"));
			} else {
				userData.setUserFileName("default-profile.png");
				userData.setUserFileRename("default-profile.png");
				userData.setUserFilePath("/img/user/default-profile.png");
				userData.setUserFileLength(0);
			}
			int result = uService.updateUser(userData);
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
	
	// 마이페이지 비밀번호 변경 전 본인확인
	@ResponseBody
	@PostMapping(value="checkUserPw.dog", produces="application/json;charset=utf-8")
	public String checkUserbyIdPw (
			HttpSession session
			, @RequestParam("userPw") String userPw
			) {
		try {
			String userId = (String)session.getAttribute("userId");
			User user = new User();
			user.setUserId(userId);
			user.setUserPw(userPw);
			
			User uOne = uService.checkLogin(user);
			if(uOne != null) {
				JSONObject userJson = new JSONObject();
				userJson.put("userPwVal", user.getUserPw());
				return userJson.toString();
			} else {
				return "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	

	// 비밀번호 변경 시 본인확인
	@ResponseBody
	@PostMapping(value="updateCkPw.dog")
	public String checkUserByIdPW(
			HttpSession session,
			@RequestParam("userPw") String userPw
			) {
		try {
			String userId = (String)session.getAttribute("userId");
			
			User user = new User();
			user.setUserId(userId);
			user.setUserPw(userPw);
			
			User uOne = uService.checkLogin(user);
			if(uOne != null) {
				return "true";
			}else {
				return "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	// 비밀번호 변경
	@ResponseBody
	@PostMapping(value="updatePw.dog")
	public String updatePwByMyPage(
			HttpSession session
			, @RequestParam("userPw") String userPw
			) {
		try {
			String userId = (String)session.getAttribute("userId");
			User user = new User();
			user.setUserId(userId);
			user.setUserPw(userPw);
			
			int result = uService.updateUserPw(user);
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
	
	// ajax 회원탈퇴
	@ResponseBody
	@PostMapping(value="deleteUser.dog")
	public String deleteUser(
			HttpSession session
			) {
		try {
			String userId = (String)session.getAttribute("userId");
			int result = uService.deleteUser(userId);
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
	
	// gson 숫자 데이터 포맷 형식 변환(숫자 -> 금액)
	public class NumberFormatterSerializer implements JsonSerializer<Number> {
	    @Override
	    public JsonElement serialize(Number number, Type type, JsonSerializationContext jsonSerializationContext) {
	        DecimalFormat formatter = new DecimalFormat("###,###,###");
	        return jsonSerializationContext.serialize(formatter.format(number));
	    }
	}
	
	// 페이징처리
	public bPageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 7;
		int naviCountPerPage = 5;
		int naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		bPageInfo bpInfo = new bPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
			
		return bpInfo;
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
		
	// 게시물 수정 시 파일 삭제 관련 컨트롤러
	private void deleteUserProfile(HttpServletRequest request, String fileName) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilepath = root + "\\profileUploadFiles\\" + fileName;
		File file = new File(delFilepath);

		if (file.exists() && (!fileName.equals("default-profile.png"))) {
	        file.delete();
	    }
	}
}
