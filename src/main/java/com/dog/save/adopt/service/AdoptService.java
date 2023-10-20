package com.dog.save.adopt.service;

import java.util.List;
import java.util.Map;

import com.dog.save.adopt.domain.Adopt;
import com.dog.save.board.domain.bPageInfo;

public interface AdoptService {

	/**
	 * 게시글 작성 Service
	 * @param adopt
	 * @return
	 */
	int insertAdopt(Adopt adopt);
	
	/**
	 * 게시글 수정 Service
	 * @param adopt
	 * @return
	 */
	int updateAdoptByNo(Adopt adopt);
	
	/**
	 * 게시글 삭제 Service
	 * @param adopt
	 * @return
	 */
	int deleteAdoptByNo(Adopt adopt);
	
	/**
	 * 게시글 상세 조회 Service
	 * @param adoptNo
	 * @return
	 */
	Adopt showOneByAdopt(Integer adoptNo);
	
	/**
	 * 게시판 리스트 Service
	 * @param adoptType 
	 * @return
	 */
	List<Adopt> selectAdoptList(bPageInfo bpInfo, String adoptType);
	
	/**
	 * 전체 게시글 개수 Service
	 * @param adoptType 
	 * @return
	 */
	int getListCount(String adoptType);
	
	/**
	 * 조건에 따라 키워드 검색 Service
	 * @param bpInfo
	 * @param paramMap
	 * @return
	 */
	List<Adopt> searchAdoptByKeyword(bPageInfo bpInfo, Map<String, String> paramMap);
	
	/**
	 * 게시글 조회수 증가 Service
	 * @param adoptNo
	 * @return
	 */
	int increaseViewCount(Integer adoptNo);

	/**
	 * 키워드 검색 개수 Service
	 * @param paramMap
	 * @return
	 */
	int getSelectAdoptByKeywordCount(Map<String, String> paramMap);

	// 기진 코드
	/**
	 * 전체 리스트 가져오기 Service
	 * @return
	 */
	List<Adopt> selectAllAdobtList();
	// 기진 코드
}
