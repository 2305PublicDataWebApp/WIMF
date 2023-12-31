package com.dog.save.dog.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogLike;
import com.dog.save.dog.domain.DogReply;
import com.dog.save.user.domain.UserDog;


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

	/**
	 * 돌봄 강아지 수정 Service
	 * @param dog
	 * @param uploadFiles
	 * @param request
	 * @return
	 */
	int modifyDog(Dog dog, MultipartFile[] uploadFiles, List<Integer> noChangeFileOrder,HttpServletRequest request);

	/**
	 * 돌봄 강아지 삭제 Service
	 * @param dogNo
	 * @return
	 */
	int deleteDog(int dogNo);	
	
	/**
	 * 모든 강아지 리스트 가져오기 Service
	 * @return
	 */
	List<Dog> selectAllDogList();
	
	/**
	 * 돌봄 강아지 리스트 가져오기 Service
	 * @return
	 */
	List<Dog> selectCareList();

	/**
	 * 입양 강아지 리스트 가져오기 Service
	 * @return
	 */
	List<Dog> selectAdoptList();
	
	/**
	 * 돌봄 강아지 좋아요 등록 Service
	 * @param dogLike
	 * @return
	 */
	int insertLikeStatus(DogLike dogLike);

	/**
	 * 돌봄 강아지 좋아요 상태 체크 Service
	 * @param dogLike
	 * @return
	 */
	String getLikeStatus(DogLike dogLike);

	/**
	 * 돌봄 강아지 좋아요 상태변경 Service
	 * @param dogLike
	 * @return
	 */
	int updateLikeStatus(DogLike dogLike);

	/**
	 * 모든 강아지 리스트 가져오기 for Map Service
	 * @return
	 */
	List<Dog> selectAllDogListMap();
	
	/**
	 * 이승현 왔다감
	 * 마이페이지 강아지 좋아요 리스트 Service 
	 * @param userId
	 * @return
	 */
	List<UserDog> selectLikeDogList(String userId);

	/**
	 * 안락사 임박 순 및 지역 선택해서 강아지 리스트 가져오기 Service
	 * @param region
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectDogsByEuthanasiaAndRegion(String region, PageInfo pInfo);

	/**
	 * 안락사 임박 순 선택 및 전체 지역 강아지 리스트 가져오기 Service
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectDogsByEuthanasia(PageInfo pInfo);
	
	// 기진 코드
	/**
	 * 돌봄, 입양 아닌 강아지 리스트 가져오기 Service
	 * @return
	 */
	List<Dog> selectNoneList();

	/**
	 * 돌봄 강아지 마릿수 가져오기 service
	 * @return
	 */
	int getCareDogCount();

	/**
	 * 입양 강아지 마릿수 가져오기 service
	 * @return
	 */
	int getAdoptDogCount();

	/**
	 * 대기 강아지 마릿수 가져오기 service
	 * @return
	 */
	int getNoneDogCount();
	// 기진 코드

	/**
	 * 강아지 번호로 후원금액 조회 Service
	 * @param dogNo
	 * @return
	 */
	int getTotalDonationByDogNo(int dogNo);

	/**
	 * 댓글 작성자 조회 Service
	 * @param dogReplyNo
	 * @return
	 */
	String getReplyWriter(Integer dogReplyNo);

	






}
