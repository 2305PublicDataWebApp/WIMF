package com.dog.save.board.service;

import java.util.List;

import com.dog.save.board.domain.Board;
import com.dog.save.board.domain.bPageInfo;

public interface BoardService {
	/**
	 * 게시판 리스트 Service
	 * @return
	 */
	List<Board> selectBoardList(bPageInfo bpInfo);
	/**
	 * 게시글 작성 Service
	 * @param board
	 * @return
	 */
	int insertBoard(Board board);
	/**
	 * 게시글 상세 조회 Service
	 * @param boardNo
	 * @return
	 */
	Board showOneByBoard(Integer boardNo);
	/**
	 * 단체 게시글 갯수 Service
	 * @return
	 */
	int getListCount();
	/**
	 * 게시글 수정 페이지 Service
	 * @param boardNo
	 * @return
	 */
	Board selectBoardByNo(Integer boardNo);
	

}