package com.dog.save.board.domain;

import lombok.Data;

@Data
public class BoardLike {

	private String boardWriteId;
	private int boardWriteNo;
	private char boardLike;
}
