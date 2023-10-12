package com.dog.save.board.service;

import java.util.List;

import com.dog.save.board.domain.Board;

public interface BoardService {
	/**
	 * 게시판 리스트 Service
	 * @return
	 */
	List<Board> selectBoardList();
	/**
	 * 게시글 작성 Service
	 * @param board
	 * @return
	 */
	int insertBoard(Board board);

}