package com.dog.save.dog.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.dog.save.dog.domain.Dog;


public interface DogService {

	int insertDog(Dog dog, MultipartFile[] uploadFiles, HttpServletRequest request);



}
