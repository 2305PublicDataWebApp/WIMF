package com.dog.save.board.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.BoardLike;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.board.store.BoardStore;
import com.dog.save.user.domain.UserBoard;

@Repository
public class BoardStoreLogic implements BoardStore{

	@Override
	public int insertBoard(SqlSession sqlSession, Board board) {
		int result = sqlSession.insert("BoardMapper.insertBoard", board);
		return result;
	}

	@Override
	public int updateBoard(SqlSession sqlSession, Board board) {
		int result = sqlSession.update("BoardMapper.updateBoard", board);
		return result;
	}

	@Override
	public int deleteBoard(SqlSession sqlSession, Board board) {
		int result = sqlSession.delete("BoardMapper.deleteBoard", board);
		return result;
	}

	@Override
	public Board selectOneByBoard(SqlSession sqlSession, Integer boardNo) {
		Board board = sqlSession.selectOne("BoardMapper.selectOneByBoard", boardNo);
		return board;
	}

	@Override
	public Board selectBoardByNo(SqlSession sqlSession, Integer boardNo) {
		Board board = sqlSession.selectOne("BoardMapper.selectBoardByNo", boardNo);
		return board;
	}

	@Override
	public List<Board> selectBoardList(SqlSession sqlSession, bPageInfo bpInfo) {
		int limit = bpInfo.getRecordCountPerPage();
		int offset = (bpInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Board> bList = sqlSession.selectList("BoardMapper.selectBoardList", null, rowBounds);
		return bList;
	}

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("BoardMapper.selectListCount");
		return result;
	}

	@Override
	public int getListSearchCount(SqlSession sqlSession, Map<String, String> paramMap) {
		int result = sqlSession.selectOne("BoardMapper.getListSearchCount", paramMap);
		return result;
	}

	@Override
	public List<Board> selectBoardByKeyword(SqlSession sqlSession, bPageInfo bpInfo, Map<String, String> paramMap) {
		int limit = bpInfo.getRecordCountPerPage();
		int offset = (bpInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Board> searchList = sqlSession.selectList("BoardMapper.selectBoardByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public List<Board> selectBoardByTitle(SqlSession sqlSession, String searchKeyword) {
		List<Board> searchList = sqlSession.selectList("BoardMapper.selectBoardByTitle", searchKeyword);
		return searchList;
	}

	@Override
	public List<Board> searchBoardByWriter(SqlSession sqlSession, String searchKeyword) {
		List<Board> searchList = sqlSession.selectList("BoardMapper.searchBoardByWriter", searchKeyword);
		return searchList;
	}

	@Override
	public List<Board> searchBoardByContent(SqlSession sqlSession, String searchKeyword) {
		List<Board> searchList = sqlSession.selectList("BoardMapper.searchBoardByContent", searchKeyword);
		return searchList;
	}

	@Override
	public List<Board> searchBoardByAll(SqlSession sqlSession, String searchKeyword) {
		List<Board> searchList = sqlSession.selectList("BoardMapper.searchBoardByAll", searchKeyword);
		return searchList;
	}

	@Override
	public int increaseViewCount(SqlSession sqlSession, Integer boardNo) {
		int result = sqlSession.update("BoardMapper.increaseViewCount", boardNo);
		return result;
	}
	
	@Override
	public List<Board> selectAllBoardList(SqlSession sqlSession) {
		List<Board> searchList = sqlSession.selectList("BoardMapper.selectAllBoardList");
		return searchList;
	}

	// 이승현 왔다 감
	// 마이페이지 본인이 작성한 게시글 조회 ajax
	@Override
	public List<UserBoard> selectBoardListById(SqlSession sqlSession, UserBoard uBoard) {
		int limit = uBoard.getRecordCountPerPage();
		int offset = (uBoard.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<UserBoard> uBList = sqlSession.selectList("BoardMapper.selectBoardListById", uBoard, rowBounds);
		return uBList;
	}
	
	@Override
	public String getLikeStatus(SqlSession sqlSession, BoardLike boardLike) {
		String result = sqlSession.selectOne("BoardMapper.getLikeStatus", boardLike);
		return result;
	}

	@Override
	public int insertLikeStatus(SqlSession sqlSession, BoardLike boardLike) {
		int result = sqlSession.insert("BoardMapper.insertLikeStatus", boardLike);
		return result;
	}

	@Override
	public int updateLikeStatus(SqlSession sqlSession, BoardLike boardLike) {
		int result = sqlSession.update("BoardMapper.updateLikeStatus", boardLike);
		return result;
	}


}