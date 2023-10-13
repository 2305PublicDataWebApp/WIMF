package com.dog.save.main.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Calendar {

	private int schNo;
	private int dogNo;
	private String userId;
	private Date schStartDate;
	private Date schEndDate;
	private String schOption;
	private String schTitle;
	private String schContent;
	private Date schCreateDate;
	
}
