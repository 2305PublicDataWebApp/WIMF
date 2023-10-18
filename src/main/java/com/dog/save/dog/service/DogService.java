package com.dog.save.dog.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogReply;


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

	/**
	 * 돌봄 강아지 정보 가져오기 Service
	 * @param dogNo
	 * @return
	 */
	Dog selectDogByDogNo(int dogNo);

	/**
	 * 돌봄 강아지 이미지 가져오기 Service
	 * @param dogNo
	 * @return
	 */
	List<DogFile> selectDogFileByDogNo(int dogNo);

	/**
	 * 돌봄 강아지 지역별 조회 Service
	 * @param region
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectDogsByRegion(String region, PageInfo pInfo);

	/**
	 * 돌봄 강아지 지역별 리스트 카운트 Service
	 * @param region
	 * @return
	 */
	Integer getListCountByRegion(String region);

	/**
	 * 돌봄 강아지 검색 리스트 카운트 Service
	 * @param searchInput
	 * @return
	 */
	Integer getListCountBySearch(String searchInput);

	/**
	 * 돌봄 강아지 검색 결과 조회 Service
	 * @param searchInput
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectDogsBySearch(String searchInput, PageInfo pInfo);

	/**
	 * 돌봄 강아지 상세페이지 댓글 입력 Service
	 * @param dogReply
	 * @return
	 */
	int insertReply(DogReply dogReply);

	/**
	 * 돌봄 강아지 댓글 리스트 조회 Service
	 * @param refDogNo
	 * @return
	 */
	List<DogReply> selectReplyList(Integer dogNo);

	/**
	 * 돌봄 강아지 댓글 수정 Service
	 * @param dogReply
	 * @return
	 */
	int updateReply(DogReply dogReply);

	/**
	 * 돌봄 강아지 댓글 삭제 Service
	 * @param dogReplyNo
	 * @return
	 */
	int deleteReply(Integer dogReplyNo);






}
