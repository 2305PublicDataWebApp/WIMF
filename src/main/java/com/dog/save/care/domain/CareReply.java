package com.dog.save.care.domain;

import java.sql.Timestamp;

import com.dog.save.board.domain.Board;

import lombok.Data;

@Data
public class CareReply {
    private int careNo;
    private int careReplyNo;
    private String userId;
    private String careReplyContent;
    private Timestamp careReplyCreateDate;
    private Timestamp careReplyUpdateDate;

	private String userNickName;
}
