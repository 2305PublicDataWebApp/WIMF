package com.dog.save.app.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class App {
    private int appNo;
    private String userId;
    private char appDogHad;
    private char appExpHad;
    private String appQuestionOne;
    private String appQuestionTwo;
    private String appQuestionThree;
    private String appContent;
    private Timestamp appCreateDate;
    private Date appStartDate;
    private Date appEndDate;
    private char appDogAdopt;
    private char appStatus;
}
