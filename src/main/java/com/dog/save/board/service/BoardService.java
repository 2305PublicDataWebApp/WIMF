package com.dog.save.board.service;

import java.util.List;
import java.util.Map;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.bPageInfo;

public interface BoardService {
	/**
	 * 게시글 작성 Service
	 * @param board
	 * @return
	 */
	int insertBoard(Board board);
	/**
	 * 게시글 수정 Service
	 * @param board
	 * @return
	 */
	int updateBoardByNo(Board board);
	/**
	 * 게시글 삭제 Service
	 * @param board
	 * @return
	 */
	int deleteBoardByNo(Board board);
	/**
	 * 게시글 상세 조회 Service
	 * @param boardNo
	 * @return
	 */
	Board showOneByBoard(Integer boardNo);
	/**
	 * 게시글 수정 페이지 Service
	 * @param boardNo
	 * @return
	 */
	Board selectBoardByNo(Integer boardNo);
	/**
	 * 게시판 리스트 Service
	 * @return
	 */
	List<Board> selectBoardList(bPageInfo bpInfo);
	/**
	 * 단체 게시글 갯수 Service
	 * @return
	 */
	int getListCount();
	/**
	 * 리스트 검색 Service
	 * @param paramMap
	 * @return
	 */
	int getListCount(Map<String, String> paramMap);
	/**
	 * 조건에 따라 키워드 검색 Service
	 * @param bpInfo
	 * @param paramMap
	 * @return
	 */
	List<Board> searchBoardByKeyword(bPageInfo bpInfo, Map<String, String> paramMap);
	/**
	 * 공지사항 제목으로 검색 Service
	 * @param searchKeyword
	 * @return
	 */
	List<Board> searchBoardByTitle(String searchKeyword);
	/**
	 * 공지사항 작성자로 검색 Service
	 * @param searchKeyword
	 * @return
	 */
	List<Board> searchBoardByWriter(String searchKeyword);
	/**
	 * 공지사항 내용으로 검색 Service
	 * @param searchKeyword
	 * @return
	 */
	List<Board> searchBoardByContent(String searchKeyword);
	/**
	 * 공지사항 전체 검색 Service
	 * @param searchKeyword
	 * @return
	 */
	List<Board> searchBoardByAll(String searchKeyword);
	/**
	 * 게시글 조회수 증가 Service
	 * @param boardNo
	 * @return
	 */
	int increaseViewCount(Integer boardNo);
	
	List<Board> selectAllBoardList();
	

}