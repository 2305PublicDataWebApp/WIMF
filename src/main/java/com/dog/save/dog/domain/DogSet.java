package com.dog.save.dog.domain;

import lombok.Data;

@Data
public class DogSet {
	private Dog dog;
	private DogFile dogFile;
	private int progress;
}
