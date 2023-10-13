package com.dog.save.board.domain;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private Timestamp createDate;
	private Timestamp updateDate;
	private int viewCount;
	
}
