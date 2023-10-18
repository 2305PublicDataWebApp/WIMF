package com.dog.save.adopt.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Adopt {
    private int adoptNo;
    private String userId;
    private String adoptTitle;
    private String adoptContent;
    private Timestamp adoptCreateDate;
    private Timestamp adoptUpdateDate;
    private Date adoptDate;
    private int viewCount;
    
    private String userNickName;
}
