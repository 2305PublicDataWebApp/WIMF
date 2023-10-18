package com.dog.save.care.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Care {
    private int careNo;
    private String userId;
    private String careTitle;
    private String careContent;
    private Timestamp careCreateDate;
    private Timestamp careUpdateDate;
    private Date careStartDate;
    private Date careEndDate;
    private int viewCount;
    
    private String userNickName;
}
