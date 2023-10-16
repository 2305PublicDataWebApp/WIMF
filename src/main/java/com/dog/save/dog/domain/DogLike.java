package com.dog.save.dog.domain;

import lombok.Data;

@Data
public class DogLike {
	private String refUserId;
	private int refDogNo;
	private char dogLike;
}
