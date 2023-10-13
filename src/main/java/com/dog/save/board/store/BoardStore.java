package com.dog.save.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.bPageInfo;

public interface BoardStore {

	/**
	 * 게시판 리스트 Store
	 * @param sqlSession
	 * @return
	 */
	List<Board> selectBoardList(SqlSession sqlSession, bPageInfo bpInfo);
	/**
	 * 게시글 작성 Store
	 * @param sqlSession
	 * @param board
	 * @return
	 */
	int insertBoard(SqlSession sqlSession, Board board);
	/**
	 * 게시글 상세조회 Store
	 * @param sqlSession
	 * @param boardNo
	 * @return
	 */
	Board selectOneByBoard(SqlSession sqlSession, Integer boardNo);
	/**
	 * 단체 게시글 갯수 Store
	 * @param sqlSession
	 * @return
	 */
	int selectListCount(SqlSession sqlSession);
	/**
	 * 게시글 수정 페이지 Store
	 * @param sqlSession
	 * @param boardNo
	 * @return
	 */
	Board selectBoardByNo(SqlSession sqlSession, Integer boardNo);
	/**
	 * 게시글 수정 Store
	 * @param sqlSession
	 * @param board
	 * @return
	 */
	int updateBoard(SqlSession sqlSession, Board board);

}
