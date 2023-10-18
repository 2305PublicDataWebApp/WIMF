package com.dog.save.adopt.domain;

import java.sql.Timestamp;

import com.dog.save.board.domain.Board;

import lombok.Data;

@Data
public class AdoptReply {
    private int adoptNo;
    private int adoptReplyNo;
    private String userId;
    private String adoptReplyContent;
    private Timestamp adoptReplyCreateDate;
    private Timestamp adoptReplyUpdateDate;
    
	private String userNickName;
}
