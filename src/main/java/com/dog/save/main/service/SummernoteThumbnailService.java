package com.dog.save.main.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

public interface SummernoteThumbnailService {

	Map<String, Object> uploadImage(MultipartFile multipartFile, HttpServletRequest request);

}
