package com.dog.save.donation.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Donation {

	private int donationNo;
	private int donationDogNo;
	private String donationUser;
	private int donationMoney;
	private Timestamp donationDate;
	
}
