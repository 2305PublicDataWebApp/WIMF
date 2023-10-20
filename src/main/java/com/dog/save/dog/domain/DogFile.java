package com.dog.save.dog.domain;

import lombok.Data;

@Data
public class DogFile {
	private int refDogNo;
	private int dogFileOrder;
	private String dogFileName;
	private String dogFileRename;
	private String dogFilePath;
	
	
	public DogFile(int refDogNo, int dogFileOrder,String dogFileName, String dogFileRename, String dogFilePath) {
		super();
		this.refDogNo = refDogNo;
		this.dogFileOrder = dogFileOrder;
		this.dogFileName = dogFileName;
		this.dogFileRename = dogFileRename;
		this.dogFilePath = dogFilePath;
	}
	public DogFile(int refDogNo, int dogFileOrder) {
		super();
		this.refDogNo = refDogNo;	
		this.dogFileOrder = dogFileOrder;
	}
	public DogFile() {
		super();
	}
	
	
	
	

}
