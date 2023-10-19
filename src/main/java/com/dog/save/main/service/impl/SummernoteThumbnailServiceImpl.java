package com.dog.save.main.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dog.save.main.service.SummernoteThumbnailService;

@Service
public class SummernoteThumbnailServiceImpl implements SummernoteThumbnailService {

	@Override
	public Map<String, Object> uploadImage(MultipartFile multipartFile, HttpServletRequest request) {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		// 파일 저장 경로 구하기
		String savePath = root + "/summerImageFiles";
		
		// 파일 이름 구하기
		String fileName = multipartFile.getOriginalFilename();
		
		// 파일 확장자 구하기
		String extension = fileName.substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1);
		
		// 시간으로 파일 리네임 하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+extension;
		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		
		// 파일 저장
		File saveFile = new File(savePath+"/"+fileRename);
		try {
			multipartFile.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long fileLength = multipartFile.getSize();
		
		// 파일 정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/summerImageFiles/" + fileRename);
		fileMap.put("fileLength", fileLength);
		return fileMap;
	}

	
	
}
