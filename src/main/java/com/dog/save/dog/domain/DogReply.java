package com.dog.save.dog.domain;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class DogReply {
	private int dogReplyNo;
	private int refDogNo;
	private String dogReplyWriter;
	private String dogReplyContent;
	private int dogReplyRecommend;
	private Timestamp dogReplyCreateDate;
	private Timestamp dogReplyUpdateDate;
}
