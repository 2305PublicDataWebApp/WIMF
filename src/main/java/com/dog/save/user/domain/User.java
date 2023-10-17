package com.dog.save.user.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class User {
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

	
	public User() {
		super();
	}

	public User(String userId, String userPw, String userName, String userNickname, String userAddress,
			String userPhone, String userSSN, String userEmail) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userAddress = userAddress;
		this.userPhone = userPhone;
		this.userSSN = userSSN;
		this.userEmail = userEmail;
	}
	


	
	
}
