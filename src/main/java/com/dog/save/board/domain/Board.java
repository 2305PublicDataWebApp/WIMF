package com.dog.save.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String userId;
	private String boardFileName;
	private String boardFileRename;
	private String boardFilePath;
	private int boardFileLength;
	private Date createDate;
	private Date updateDate;
	private int viewCount;
	
}
