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
	private int likeCount;
	private String boardFileName;
	private String boardFileRename;
	private String boardFilePath;
	private long boardFileLength;
	
	private String userNickName;
	private String userProfile;	// 기진 코드
	
}
