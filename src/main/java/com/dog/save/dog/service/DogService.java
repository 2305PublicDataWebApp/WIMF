package com.dog.save.dog.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;


public interface DogService {

	/**
	 * 돌봄 강아지 등록 Service
	 * @param dog
	 * @param uploadFiles
	 * @param request
	 * @return
	 */
	int insertDog(Dog dog, MultipartFile[] uploadFiles, HttpServletRequest request);

	/**
	 * 돌봄 강아지 전체 리스트 카운트 Service
	 * @return
	 */
	Integer getListCount();

	/**
	 * 돌봄 강아지 정보 전체 조회 Service
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectAllDog(PageInfo pInfo);

	/**
	 * 돌봄 강아지 썸네일 이미지 조회 Service
	 * @return
	 */
	List<DogFile> selectFirstDogFile();





}
