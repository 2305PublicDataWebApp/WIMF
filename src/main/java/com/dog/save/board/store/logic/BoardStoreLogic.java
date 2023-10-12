package com.dog.save.board.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.board.domain.Board;
import com.dog.save.board.store.BoardStore;

@Repository
public class BoardStoreLogic implements BoardStore{

	@Override
	public List<Board> selectBoardList(SqlSession sqlSession) {
		List<Board> bList = sqlSession.selectList("BoardMapper.selectBoardList");
		return bList;
	}

	@Override
	public int insertBoard(SqlSession sqlSession, Board board) {
		int result = sqlSession.insert("BoardMapper.insertBoard", board);
		return result;
	}

}
