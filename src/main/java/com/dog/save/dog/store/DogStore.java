package com.dog.save.dog.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogReply;

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

//	기진 코드
	/**
	 * 모든 강아지 리스트 가져오기 Store
	 * @param session
	 * @return
	 */
	List<Dog> selectAllDogList(SqlSession session);
//	기진 코드
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




}
