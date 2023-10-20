package com.dog.save.adopt.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dog.save.adopt.domain.Adopt;
import com.dog.save.adopt.domain.AdoptReply;
import com.dog.save.adopt.service.AdoptReplyService;
import com.dog.save.adopt.service.AdoptService;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;

@Controller
@RequestMapping(value="/adopt")
public class AdoptController {
	
	@Autowired
	private AdoptService aService;
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private AdoptReplyService arService;
	
	// ==================== 게시글 작성 페이지 ====================
	@GetMapping("/write.dog")
	public String adoptWriteView(Model model, HttpSession session) {
		String adoptWriter = (String)session.getAttribute("userId");
		// 로그인 여부 확인
		if(adoptWriter == null || adoptWriter.isEmpty()) {
			model.addAttribute("msg", "로그인 후에 게시글을 작성할 수 있습니다");
			model.addAttribute("url", "/user/login.dog");
			return "common/error";
		}else {
			return "adopt/insert";
		}
	}
	
	// ==================== 게시글 작성 ====================
	@PostMapping("/write.dog")
	public String adoptWrite(@ModelAttribute Adopt adopt, Model model, HttpSession session
			, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request) {
		try {
			// 로그인 한 아이디
			String adoptWriter = (String)session.getAttribute("userId");
			// 로그인 여부 확인
			if(adoptWriter == null || adoptWriter.isEmpty()) {
				model.addAttribute("msg", "로그인 후에 게시글을 작성할 수 있습니다");
				model.addAttribute("url", "/user/login.dog");
				return "common/error";
			}else{
				// 파일 유무 확인
				if (uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					// 파일 정보(이름, 리네임, 경로, 크기) 및 파일 저장
					Map<String, Object> aMap = this.saveFile(request, uploadFile);
					adopt.setAdoptFileName((String) aMap.get("fileName"));
					adopt.setAdoptFileRename((String) aMap.get("fileRename"));
					adopt.setAdoptFilePath((String) aMap.get("filePath"));
				}
				// 작성자는 로그인 한 아이디로 넣기
				adopt.setUserId(adoptWriter);
				int result = aService.insertAdopt(adopt);
				// insert 확인
				if(result > 0) {
					return "redirect:/adopt/list.dog";					
				}else {
					model.addAttribute("msg", "게시글 작성이 완료되지 않았습니다.");
					model.addAttribute("url", "/adopt/list.dog");
					return "common/error";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	
	// ==================== 게시글 수정 페이지 ====================
	@GetMapping("/update.dog")
	public String adoptUpdateView(Model model
			, @RequestParam("adoptNo") Integer adoptNo
			, HttpSession session) {
		try {
			Adopt adopt = aService.showOneByAdopt(adoptNo);
			// 데이터를 못 불러오면
			if(adopt == null) {
				model.addAttribute("msg", "수정할 데이터를 불러오기 실패했습니다.");
				model.addAttribute("url", "/adopt/list.dog");
				return "common/error";
			}else {
				String adoptWriter = (String)session.getAttribute("userId");
				String userId = adopt.getUserId();
				if(adoptWriter == null || adoptWriter.isEmpty()) {
					// 로그인을 안했으면
					model.addAttribute("msg", "로그인 후에 게시글을 수정 할 수 있습니다");
					model.addAttribute("url", "/user/login.dog");
					return "common/error";
				}else if(!adoptWriter.equals(userId)){
					// 내가 쓴 글이 아니면
					model.addAttribute("msg", "내가 작성한 글만 수정이 가능합니다");
					model.addAttribute("url", "/adopt/list.dog");
					return "common/error";
				}else {
					model.addAttribute("adopt", adopt);
					return "adopt/update";
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	
	// ==================== 게시글 수정 ====================
	@PostMapping("/update.dog")
	public String adoptUpdate(@ModelAttribute Adopt adopt, Model model, HttpSession session
			, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request) {
		try {
			String adoptWriter = adopt.getUserId();
			String userId = (String)session.getAttribute("userId");
			if(adoptWriter != null && adoptWriter.equals(userId)) {
				if(uploadFile != null && !uploadFile.isEmpty()) {
					// 수정
					// 1. 대체, 삭제 후 등록
					// 기존 업로드 된 파일 존재 여부 체크 후 있으면 기존 파일 삭제
					String fileName = adopt.getAdoptFileRename();
					if(adopt.getAdoptFileName() != null) {
						// 있으면 기존 파일 삭제
						this.deleteFile(request, fileName);
					}
					// 없으면 새로 업로드 하려는 파일 저장
					Map<String, Object> infoMap = this.saveFile(request, uploadFile);
					
					// DB에 저장하기 위해 adopt에 데이터를 Set하는 부분임.
					String adoptfileName = (String)infoMap.get("fileName");
					adopt.setAdoptFileName(adoptfileName);
					String adoptfileRename = (String)infoMap.get("fileRename");
					adopt.setAdoptFileRename(adoptfileRename);
					adopt.setAdoptFilePath((String)infoMap.get("filePath"));
				}
				int result = aService.updateAdoptByNo(adopt);
				// 수정이 여부 확인
				if(result > 0) {
					return "redirect:/adopt/detail.dog?adoptNo="+adopt.getAdoptNo();
				}else {
					model.addAttribute("msg", "게시글 수정이 완료되지 않았습니다");
					model.addAttribute("url", "/adopt/list.dog");
					return "common/error";
				}
			}else {
				System.out.println("adoptWriter : " + adoptWriter);
				System.out.println("userId : " + userId);
				model.addAttribute("msg", "내가 작성한 글만 수정이 가능합니다");
				model.addAttribute("url", "/adopt/list.dog");
				return "common/error";
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	
	// ==================== 게시글 삭제 ====================
	@GetMapping("/delete.dog")
	public String adoptDelete(@RequestParam("adoptNo") Integer adoptNo, Model model, HttpSession session, HttpServletRequest request) {
		try {
			Adopt adopt = aService.showOneByAdopt(adoptNo);
			String adoptWriter = adopt.getUserId();
			String userId = (String)session.getAttribute("userId");
			String adminCheck = (String)session.getAttribute("adminCheck");
			String fileName = adopt.getAdoptFileRename();
			// 로그인 된 사람이 글의 작성자거나, 관리자면
			if(adoptWriter != null && adoptWriter.equals(userId) || adminCheck.equals("Y")) {
				int result = aService.deleteAdoptByNo(adopt);
				// 삭제가 성공했으면
				if(result > 0) {
					// 기존 업로드 된 파일 존재 여부 체크 후 있으면 기존 파일 삭제
					if(adopt.getAdoptFileName() != null) {
						// 있으면 기존 파일 삭제
						this.deleteFile(request, fileName);
					}
					return "redirect:/adopt/list.dog";
				}else {
					model.addAttribute("msg", "게시글 삭제가 완료되지 않았습니다");
					model.addAttribute("url", "/adopt/list.dog");
					return "common/error";
				}
			}else {
				model.addAttribute("msg", "내가 작성한 글만 삭제가 가능합니다");
				model.addAttribute("url", "/adopt/list.dog");
				return "common/error";
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	
	// ==================== 게시글 리스트 조회 ====================
	@GetMapping("/list.dog")
	public String adoptListView(Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, @RequestParam(value="adoptType", required=false, defaultValue="all") String adoptType) {
		Integer totalCount = aService.getListCount(adoptType);
		bPageInfo bpInfo = this.getPageInfo(currentPage, totalCount);
		List<Adopt> aList = aService.selectAdoptList(bpInfo, adoptType);
		model.addAttribute("aList", aList).addAttribute("bpInfo", bpInfo).addAttribute("adoptType", adoptType);
		return "adopt/list";
	}
	
	// ==================== 게시글 상세 조회 ====================
	@GetMapping("/detail.dog")
	public String adoptDetailView(Model model
			, @RequestParam("adoptNo") Integer adoptNo) {
		try {
			Adopt adopt = aService.showOneByAdopt(adoptNo);
			if(adopt != null) {
				String userId = adopt.getUserId();
				User uOne = uService.selectOneById(userId);
				String userNickName = uOne.getUserNickname();
				List<AdoptReply> replyList = arService.selectAdoptReplyList(adoptNo);
				aService.increaseViewCount(adoptNo);
				if(replyList.size() > 0) {
					model.addAttribute("rList", replyList);
				}
				model.addAttribute("userNickName", userNickName);
				model.addAttribute("adopt", adopt);
				return "adopt/detail";
			}else {
				model.addAttribute("msg", "게시글 조회에 실패하였습니다.");
				model.addAttribute("url", "/adopt/list.dog");
				return "common/error";
			}
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 바랍니다");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	
	// ==================== 게시글 페이징 처리 ====================
	public bPageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 6;
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
	
	// ==================== 게시글 검색 처리 ====================
	@GetMapping("/search.dog")
	public String searchAdoptList(Model model
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, @RequestParam(value="adoptType", required=false, defaultValue="all") String adoptType) {
		
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("adoptType", adoptType);
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		int totalCount = aService.getSelectAdoptByKeywordCount(paramMap);
		bPageInfo bpInfo = this.getPageInfo(currentPage, totalCount);
		List<Adopt> searchList = aService.searchAdoptByKeyword(bpInfo, paramMap);
		
		if(!searchList.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("adoptType", adoptType);
			model.addAttribute("bpInfo", bpInfo);
			model.addAttribute("aList", searchList);
			return "adopt/search";
		}else {
			model.addAttribute("msg", "데이터 조회가 되지 않습니다.");
			model.addAttribute("error", "공지사항 제목 조회 실패");
			model.addAttribute("url", "/adopt/list.dog");
			return "common/error";
		}
	}
	
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		HashMap<String, Object> filaMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일 저장 경로
		String savePath = root + "\\adoptUploadFiles";
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".")+1);
		// 시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		// ********************** 파일 저장 **********************
		File saveFile = new File(savePath + "\\" + fileRename);
		uploadFile.transferTo(saveFile);
		// 파일 이름, 경로, 크기를 넘겨주기위해 Map에 정보를 저장한 후 return 함
				// 왜 return 하는 가? DB에 저장하기 위해서 필요한 정보니까
		filaMap.put("fileName", fileName);
		filaMap.put("fileRename", fileRename);
		filaMap.put("filePath", "../resources/adoptUploadFiles/" + fileRename);
		
		return filaMap;
	}

	private void deleteFile(HttpServletRequest request, String fileName) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delfilepath = root + "\\adoptUploadFiles\\" + fileName;
		File file = new File(delfilepath);
		if(file.exists()) {
			file.delete();
		}
	}
	
	// Fix String null to Date
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}
