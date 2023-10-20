package com.dog.save.adopt.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.adopt.domain.Adopt;
import com.dog.save.board.domain.bPageInfo;

public interface AdoptStore {
	
	/**
	 * 게시글 작성 Store
	 * @param sqlSession
	 * @param adopt
	 * @return
	 */
	int insertAdopt(SqlSession sqlSession, Adopt adopt);
	
	/**
	 * 게시글 수정 Store
	 * @param sqlSession
	 * @param adopt
	 * @return
	 */
	int updateAdopt(SqlSession sqlSession, Adopt adopt);
	
	/**
	 * 게시글 삭제 Store
	 * @param sqlSession
	 * @param adopt
	 * @return
	 */
	int deleteAdopt(SqlSession sqlSession, Adopt adopt);
	
	/**
	 * 게시글 상세조회 Store
	 * @param sqlSession
	 * @param adoptNo
	 * @return
	 */
	Adopt selectOneByAdopt(SqlSession sqlSession, Integer adoptNo);
	
	/**
	 * 게시판 리스트 Store
	 * @param sqlSession
	 * @param adoptType 
	 * @return
	 */
	List<Adopt> selectAdoptList(SqlSession sqlSession, bPageInfo bpInfo, String adoptType);
	
	/**
	 * 전체 게시글 개수 Store
	 * @param sqlSession
	 * @param adoptType 
	 * @return
	 */
	int selectListCount(SqlSession sqlSession, String adoptType);
	
	/**
	 * 조건에 따라 키워드 검색 Store
	 */
	List<Adopt> selectAdoptByKeyword(SqlSession sqlSession, bPageInfo bpInfo, Map<String, String> paramMap);
	
	/**
	 * 게시글 조회수 증가 Store
	 * @param sqlSession
	 * @param adoptNo
	 * @return
	 */
	int increaseViewCount(SqlSession sqlSession, Integer adoptNo);

	/**
	 * 검색 게시글 개수 Store
	 * @param sqlSession
	 * @param paramMap 
	 * @return
	 */
	int getSelectAdoptByKeywordCount(SqlSession sqlSession, Map<String, String> paramMap);

	// 기진 코드
	/**
	 * 전체 리스트 가져오기 Store
	 * @param sqlSession
	 * @return
	 */
	List<Adopt> selectAllAdobtList(SqlSession sqlSession);
	// 기진 코드
}
