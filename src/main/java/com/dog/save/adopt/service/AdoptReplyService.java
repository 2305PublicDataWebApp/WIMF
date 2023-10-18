package com.dog.save.adopt.service;

import java.util.List;

import com.dog.save.adopt.domain.AdoptReply;

public interface AdoptReplyService {
	
	/**
	 * 댓글 작성 Service
	 * @param reply
	 * @return
	 */
	int insertAdoptReply(AdoptReply reply);
	
	/**
	 * 댓글 수정 Service
	 * @param reply
	 * @return
	 */
	int updateAdoptReply(AdoptReply reply);
	
	/**
	 * 댓글 삭제 Service
	 * @param reply
	 * @return
	 */
	int deleteAdoptReply(AdoptReply reply);
	
	/**
	 * 댓글 리스트 Service
	 * @param boardNo
	 * @return
	 */
	List<AdoptReply> selectAdoptReplyList(int adoptReplyNo);
}
