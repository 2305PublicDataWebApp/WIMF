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
}
