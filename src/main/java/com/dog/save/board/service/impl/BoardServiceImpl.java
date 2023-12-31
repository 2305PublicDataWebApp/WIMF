package com.dog.save.board.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.BoardLike;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.board.service.BoardService;
import com.dog.save.board.store.BoardStore;
import com.dog.save.user.domain.UserBoard;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardStore bStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertBoard(Board board) {
		int result = bStore.insertBoard(sqlSession, board);
		return result;
	}

	@Override
	public int updateBoardByNo(Board board) {
		int result = bStore.updateBoard(sqlSession, board);
		return result;
	}

	@Override
	public int deleteBoardByNo(Board board) {
		int result = bStore.deleteBoard(sqlSession, board);
		return result;
	}

	@Override
	public Board showOneByBoard(Integer boardNo) {
		Board board = bStore.selectOneByBoard(sqlSession, boardNo);
		return board;
	}

	@Override
	public Board selectBoardByNo(Integer boardNo) {
		Board board = bStore.selectBoardByNo(sqlSession, boardNo);
		return board;
	}

	@Override
	public List<Board> selectBoardList(bPageInfo bpInfo) {
		List<Board> bList = bStore.selectBoardList(sqlSession, bpInfo);
		return bList;
	}

	@Override
	public int getListCount() {
		int result = bStore.selectListCount(sqlSession);
		return result;
	}

	@Override
	public int getListSearchCount(Map<String, String> paramMap) {
		int result = bStore.getListSearchCount(sqlSession, paramMap);
		return result;
	}

	@Override
	public List<Board> searchBoardByKeyword(bPageInfo bpInfo, Map<String, String> paramMap) {
		List<Board> searchList = bStore.selectBoardByKeyword(sqlSession, bpInfo, paramMap);
		return searchList;
	}

	@Override
	public List<Board> searchBoardByTitle(String searchKeyword) {
		List<Board> searchList = bStore.selectBoardByTitle(sqlSession, searchKeyword);
		return searchList;
	}

	@Override
	public List<Board> searchBoardByWriter(String searchKeyword) {
		List<Board> searchList = bStore.searchBoardByWriter(sqlSession, searchKeyword);
		return searchList;
	}

	@Override
	public List<Board> searchBoardByContent(String searchKeyword) {
		List<Board> searchList = bStore.searchBoardByContent(sqlSession, searchKeyword);
		return searchList;
	}

	@Override
	public List<Board> searchBoardByAll(String searchKeyword) {
		List<Board> searchList = bStore.searchBoardByAll(sqlSession, searchKeyword);
		return searchList;
	}

	@Override
	public int increaseViewCount(Integer boardNo) {
		int result = bStore.increaseViewCount(sqlSession, boardNo);
		return result;
	}
	
	@Override
	public List<Board> selectAllBoardList() {
		List<Board> searchList = bStore.selectAllBoardList(sqlSession);
		return searchList;
	}

	@Override
	public String getLikeStatus(BoardLike boardLike) {
		String result = bStore.getLikeStatus(sqlSession, boardLike);
		return result;
	}

	@Override
	public int insertLikeStatus(BoardLike boardLike) {
		int result = bStore.insertLikeStatus(sqlSession, boardLike);
		return result;
	}

	@Override
	public int updateLikeStatus(BoardLike boardLike) {
		int result = bStore.updateLikeStatus(sqlSession, boardLike);
		return result;
	}

	// 이승현 왔다감
	// 마이페이지 본인 게시글 조회
	@Override
	public List<UserBoard> selectBoardListById(UserBoard uBoard) {
		List<UserBoard> ubList = bStore.selectBoardListById(sqlSession, uBoard);
		return ubList;
	}

	@Override
	public int getReplyCount(int boardNo) {
		int result = bStore.getReplyCount(sqlSession, boardNo);
		return result;
	}

}