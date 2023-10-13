package com.dog.save.board.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.bPageInfo;
import com.dog.save.board.store.BoardStore;

@Repository
public class BoardStoreLogic implements BoardStore{

	@Override
	public List<Board> selectBoardList(SqlSession sqlSession, bPageInfo bpInfo) {
		int limit = bpInfo.getRecordCountPerPage();
		int offset = (bpInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Board> bList = sqlSession.selectList("BoardMapper.selectBoardList", null, rowBounds);
		return bList;
	}

	@Override
	public int insertBoard(SqlSession sqlSession, Board board) {
		int result = sqlSession.insert("BoardMapper.insertBoard", board);
		return result;
	}

	@Override
	public Board selectOneByBoard(SqlSession sqlSession, Integer boardNo) {
		Board board = sqlSession.selectOne("BoardMapper.selectOneByBoard", boardNo);
		return board;
	}

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("BoardMapper.selectListCount");
		return result;
	}

	@Override
	public Board selectBoardByNo(SqlSession sqlSession, Integer boardNo) {
		Board board = sqlSession.selectOne("BoardMapper.selectBoardByNo", boardNo);
		return board;
	}

}