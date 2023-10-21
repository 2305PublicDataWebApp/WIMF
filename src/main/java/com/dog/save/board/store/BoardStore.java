package com.dog.save.board.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.BoardLike;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.user.domain.UserBoard;

public interface BoardStore {

	/**
	 * 게시글 작성 Store
	 * @param sqlSession
	 * @param board
	 * @return
	 */
	int insertBoard(SqlSession sqlSession, Board board);
	/**
	 * 게시글 수정 Store
	 * @param sqlSession
	 * @param board
	 * @return
	 */
	int updateBoard(SqlSession sqlSession, Board board);
	/**
	 * 게시글 삭제 Store
	 * @param sqlSession
	 * @param board
	 * @return
	 */
	int deleteBoard(SqlSession sqlSession, Board board);
	/**
	 * 게시글 상세조회 Store
	 * @param sqlSession
	 * @param boardNo
	 * @return
	 */
	Board selectOneByBoard(SqlSession sqlSession, Integer boardNo);
	/**
	 * 게시글 수정 페이지 Store
	 * @param sqlSession
	 * @param boardNo
	 * @return
	 */
	Board selectBoardByNo(SqlSession sqlSession, Integer boardNo);
	/**
	 * 게시판 리스트 Store
	 * @param sqlSession
	 * @return
	 */
	List<Board> selectBoardList(SqlSession sqlSession, bPageInfo bpInfo);
	/**
	 * 단체 게시글 갯수 Store
	 * @param sqlSession
	 * @return
	 */
	int selectListCount(SqlSession sqlSession);
	/**
	 * 리스트 검색 Store
	 * @param sqlSession
	 * @param paramMap
	 * @return
	 */
	int getListSearchCount(SqlSession sqlSession, Map<String, String> paramMap);
	/**
	 * 조건에 따라 키워드 검색 Store
	 */
	List<Board> selectBoardByKeyword(SqlSession sqlSession, bPageInfo bpInfo, Map<String, String> paramMap);
	/**
	 * 공지사항 제목 검색 Store
	 * @param sqlSession
	 * @param searchKeyword
	 * @return
	 */
	List<Board> selectBoardByTitle(SqlSession sqlSession, String searchKeyword);
	/**
	 * 공지사항 작성자 검색 Store
	 * @param sqlSession
	 * @param searchKeyword
	 * @return
	 */
	List<Board> searchBoardByWriter(SqlSession sqlSession, String searchKeyword);
	/**
	 * 공지사항 내용 검색 Store
	 * @param sqlSession
	 * @param searchKeyword
	 * @return
	 */
	List<Board> searchBoardByContent(SqlSession sqlSession, String searchKeyword);
	/**
	 * 공지사항 전체 검색 Store
	 * @param sqlSession
	 * @param searchKeyword
	 * @return
	 */
	List<Board> searchBoardByAll(SqlSession sqlSession, String searchKeyword);
	/**
	 * 게시글 조회수 증가 Store
	 * @param sqlSession
	 * @param boardNo
	 * @return
	 */
	int increaseViewCount(SqlSession sqlSession, Integer boardNo);
	
	List<Board> selectAllBoardList(SqlSession sqlSession);
	/**
	 * 게시글 좋아요 체크 상태 Store
	 * @param sqlSession
	 * @param boardLike
	 * @return
	 */
	String getLikeStatus(SqlSession sqlSession, BoardLike boardLike);
	/**
	 * DB에 좋아요 데이터가 없는 상태(insert) Store
	 * @param sqlSession
	 * @param boardLike
	 * @return
	 */
	int insertLikeStatus(SqlSession sqlSession, BoardLike boardLike);
	/**
	 * DB에 좋아요 데이터가 있는 상태(update) Store
	 * @param sqlSession
	 * @param boardLike
	 * @return
	 */
	int updateLikeStatus(SqlSession sqlSession, BoardLike boardLike);
	
	/**
	 * 이승현 왔다감
	 * 마이페이지 본인 게시글 조회 ajax
	 * @param sqlSession
	 * @param uBoard
	 * @return List<UserBoard>
	 */
	List<UserBoard> selectBoardListById(SqlSession sqlSession, UserBoard uBoard);
	

}
