package com.dog.save.main.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.dog.save.main.service.SummernoteThumbnailService;

public class SummernoteThumbnailServiceImpl implements SummernoteThumbnailService {

	@Override
	public Map<String, Object> uploadImage(MultipartFile multipartFile, HttpServletRequest request) {
		try {
        	//파일저장 외부 경로, 파일명, 저장할 파일명
			String originalFileName = multipartFile.getOriginalFilename(); 
	        String root = request.getSession().getServletContext().getRealPath("resources"); 
	        String savePath = root + "/summerImageFiles"; 
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
	        String extension = originalFileName.substring(originalFileName.lastIndexOf(".")+1); 
	        String boardFileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;  
	        File targetFile = new File(savePath); 
	        if(!targetFile.exists()) { 
	            targetFile.mkdir(); 
	        } 
	        multipartFile.transferTo(new File(savePath+"/"+boardFileRename)); 

	        System.out.println("============================================"); 
	        System.out.println(savePath); 
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return null;
	}

}
