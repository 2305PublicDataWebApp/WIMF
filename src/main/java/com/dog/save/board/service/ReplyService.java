package com.dog.save.board.service;

import java.util.List;

import com.dog.save.board.domain.Reply;

public interface ReplyService{
	/**
	 * 댓글 작성 Service
	 * @param reply
	 * @return
	 */
	int insertReply(Reply reply);
	/**
	 * 댓글 수정 Service
	 * @param reply
	 * @return
	 */
	int updateReply(Reply reply);
	/**
	 * 댓글 삭제 Service
	 * @param reply
	 * @return
	 */
	int deleteReply(Reply reply);
	/**
	 * 댓글 리스트 Service
	 * @param boardNo
	 * @return
	 */
	List<Reply> selectReplyList(int replyBoardNo);

}
