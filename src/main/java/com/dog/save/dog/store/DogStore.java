package com.dog.save.dog.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogLike;
import com.dog.save.dog.domain.DogReply;
import com.dog.save.user.domain.UserDog;

public interface DogStore {

	/**
	 * 돌봄 강아지 정보 등록 Store
	 * @param session
	 * @param dog
	 * @return
	 */
	int insertDog(SqlSession session, Dog dog);

	/**
	 * 돌봄 강아지 연관번호 조회 Store
	 * @param session
	 * @return
	 */
	int selectDogNoSeq(SqlSession session);

	/**
	 * 돌봄 강아지 파일 등록 Store
	 * @param session
	 * @param dogFile
	 * @return
	 */
	int insertDogFiles(SqlSession session, DogFile dogFile);

	/**
	 * 돌봄 강아지 전체 리스트 카운트 Store
	 * @param session
	 * @return
	 */
	int getListCount(SqlSession session);

	/**
	 * 돌봄 강아지 전체 리스트 조회 Store
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectAllDog(SqlSession session, PageInfo pInfo);

	/**
	 * 돌봄 강아지 썸네일 이미지 조회 Store
	 * @param session
	 * @return
	 */
	List<DogFile> selectFirstDogFile(SqlSession session);

	/**
	 * 돌봄 강아지 정보 가져오기 Store
	 * @param session
	 * @param dogNo
	 * @return
	 */
	Dog selectDogByDogNo(SqlSession session, int dogNo);

	/**
	 * 돌봄 강아지 이미지 가져오기 Store
	 * @param session
	 * @param dogNo
	 * @return
	 */
	List<DogFile> selectDogFileByDogNo(SqlSession session, int dogNo);

	/**
	 * 돌봄 강아지 지역별 조회 Store
	 * @param session
	 * @param region
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectDogsByRegion(SqlSession session, String region, PageInfo pInfo);

	/**
	 * 돌봄 강아지 지역별 리스트 카운트 Store
	 * @param session
	 * @param region
	 * @return
	 */
	int getListCountByRegion(SqlSession session, String region);

	/**
	 * 돌봄 강아지 검색 리스트 카운트 Store
	 * @param session
	 * @param searchInput
	 * @return
	 */
	int getListCountBySearch(SqlSession session, String searchInput);

	/**
	 * 돌봄 강아지 검색 조회 Store
	 * @param session
	 * @param searchInput
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectDogsBySearch(SqlSession session, String searchInput, PageInfo pInfo);

	/**
	 * 돌봄 강아지 상세 댓글 입력 Store
	 * @param session
	 * @param dogReply
	 * @return
	 */
	int insertReply(SqlSession session, DogReply dogReply);

	/**
	 * 돌봄 강아지 댓글 조회 Store
	 * @param session
	 * @param refDogNo
	 * @return
	 */
	List<DogReply> selectReplyList(SqlSession session, Integer dogNo);

	/**
	 * 돌봄 강아지 댓글 수정 Store
	 * @param session
	 * @param dogReply
	 * @return
	 */
	int updateReply(SqlSession session, DogReply dogReply);

	/**
	 * 돌봄 강아지 댓글 삭제 Store
	 * @param session
	 * @param dogReplyNo
	 * @return
	 */
	int deleteReply(SqlSession session, Integer dogReplyNo);

	/**
	 * 돌봄 강아지 수정 Store
	 * @param session
	 * @param dog
	 * @return
	 */
	int modifyDog(SqlSession session, Dog dog);

	/**
	 * 돌봄 강아지 이미지 수정 시 원 이미지 삭제 Store
	 * @param session
	 * @param refDogNo
	 * @param dogFileOrder
	 * @return
	 */
	int deleteDogFileByDogNoAndOrder(SqlSession session, int refDogNo, int dogFileOrder);

	/**
	 * 돌봄 강아지 수정 시 변경된 이미지 원래 파일 삭제 Store
	 * @param session
	 * @param toDeleteFilePath
	 * @return
	 */
	int deleteDogFileByFilePath(SqlSession session, String toDeleteFilePath);

	/**
	 * 돌봄 강아지 삭제 Store
	 * @param session
	 * @param dogNo
	 * @return
	 */
	int deleteDog(SqlSession session, int dogNo);

	/**
	 * 돌봄 강아지 좋아요 업데이트 Store
	 * @param session
	 * @param dogLike
	 * @return
	 */
	int insertLikeStatus(SqlSession session, DogLike dogLike);

	/**
	 * 돌봄 강아지 좋아요 상태 체크 Store
	 * @param session
	 * @param dogLike
	 * @return
	 */
	String getLikeStatus(SqlSession session, DogLike dogLike);

	/**
	 * 돌봄 강아지 좋아요 상태수정 Store
	 * @param session
	 * @param dogLike
	 * @return
	 */
	int updateLikeStatus(SqlSession session, DogLike dogLike);
//	기진 코드
	/**
	 * 모든 강아지 리스트 가져오기 Store
	 * @param session
	 * @return
	 */
	List<Dog> selectAllDogList(SqlSession session);
	
	/**
	 * 돌봄 강아지 리스트 가져오기 Store
	 * @param session
	 * @return
	 */
	List<Dog> selectCareList(SqlSession session);

	/**
	 * 입양 강아지 리스트 가져오기 Store
	 * @param session
	 * @return
	 */
	List<Dog> selectAdoptList(SqlSession session);
//	기진 코드

	/**
	 * 모든 강아지 리스트 가져오기 for Map Store
	 * @param session
	 * @return
	 */
	List<Dog> selectAllDogListMap(SqlSession session);

	
	/**
	 * 이승현 왔다감
	 * 마이페이지 좋아요 누른 강아지 리스트 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<UserDog> selectLikeDogList(SqlSession session, String userId);

	/**
	 * 안락사 임박 순 및 지역 선택해서 강아지 리스트 가져오기 Store
	 * @param session
	 * @param region
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectDogsByEuthanasiaAndRegion(SqlSession session, String region, PageInfo pInfo);

	/**
	 * 안락사 임박 순 선택 및 전체 지역 강아지 리스트 가져오기 Store
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<Dog> selectDogsByEuthanasia(SqlSession session, PageInfo pInfo);
	// 기진 코드
	/**
	 * 돌봄, 입양 아닌 강아지 리스트 가져오기 Store
	 * @param session
	 * @return
	 */
	List<Dog> selectNoneList(SqlSession session);
	// 기진 코드

	/**
	 * 강아지 번호로 후원 금액 조회 Store
	 * @param session
	 * @param dogNo
	 * @return
	 */
	int getTotalDonationByDogNo(SqlSession session, int dogNo);

	

	


}
