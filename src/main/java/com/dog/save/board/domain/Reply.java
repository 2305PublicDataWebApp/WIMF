package com.dog.save.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Reply {

	private int replyNo;
	private int replyBoardNo;
	private String replyBoardContent;
	private String replyBoardWriter;
	private Timestamp replyCreateDate;
	private Timestamp replyUpdateDate;
}
