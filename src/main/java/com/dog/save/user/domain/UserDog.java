package com.dog.save.user.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDog {
	
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
	
	private String refUserId;
	private int refDogNo;
	private char dogLike;
	
	private int dogFileOrder;
	private String dogFileName;
	private String dogFileRename;
	private String dogFilePath;
}
