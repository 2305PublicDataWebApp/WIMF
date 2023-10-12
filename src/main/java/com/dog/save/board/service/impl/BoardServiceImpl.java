package com.dog.save.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.board.domain.Board;
import com.dog.save.board.service.BoardService;
import com.dog.save.board.store.BoardStore;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardStore bStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Board> selectBoardList() {
		List<Board> bList = bStore.selectBoardList(sqlSession);
		return bList;
	}

	@Override
	public int insertBoard(Board board) {
		int result = bStore.insertBoard(sqlSession, board);
		return result;
	}

}