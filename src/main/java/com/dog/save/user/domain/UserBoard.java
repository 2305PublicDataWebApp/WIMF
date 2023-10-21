package com.dog.save.user.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class UserBoard {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userNickname;
	private String userAddress;
	private String userDetailAddress;
	private String userPhone;
	private String userSSN;
	private String userEmail;
	private String userFileName;
	private String userFileRename;
	private String userFilePath;
	private long userFileLength;
	private String adminCheck;
	private Date userCreateDate;
	private int currentPage;
	private int totalCount;
	private int naviTotalCount;
	private int recordCountPerPage;
	private int naviCountPerPage;
	private int startNavi;
	private int endNavi;
	
	public UserBoard() {
		super();
	}

	public UserBoard(String userId, int currentPage, int totalCount, int naviTotalCount, int recordCountPerPage,
			int naviCountPerPage, int startNavi, int endNavi) {
		super();
		this.userId = userId;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.naviTotalCount = naviTotalCount;
		this.recordCountPerPage = recordCountPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
	}
	
	
}
