package com.dog.save.user.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDonation {
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
	
	private int donationNo;
	private int donationDogNo;
	private String donationUser;
	private int donationMoney;
	private Timestamp donationDate;
	
	private int dogNo;
	private String dogName;
	private String dogKind;
	private String dogAgency;
	private int dogAge;
	private char dogGender;
	private String dogRLocation;
	private int dogWeight;
	private String dogPersonality;
	private String dogHealth;
	private Date dogRDate;
	private Date dogDeathDate;
	private Date dogPStartDate;
	private Date dogPEndDate;
	private String dogInfo;
	private String dogRegion;
	private Timestamp dogCDate;
	private Timestamp dogUpdate;
	private char dogAdopt;
	
	private int dogFileOrder;
	private String dogFileName;
	private String dogFileRename;
	private String dogFilePath;
}
