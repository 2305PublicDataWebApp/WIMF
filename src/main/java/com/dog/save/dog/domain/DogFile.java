package com.dog.save.dog.domain;

import lombok.Data;

@Data
public class DogFile {
	private int refDogNo;
	private int dogFileOrder;
	private String dogFileName;
	private String dogFileRename;
	private String dogFilePath;
	
	
	
	public DogFile(int refDogNo2, String dogFileName2, String dogFileRename2, String dogFilePath2) {
		// TODO Auto-generated constructor stub
	}
}
