package com.dog.save.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.board.domain.Reply;

public interface ReplyStore {
	/**
	 * 댓글 작성 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int insertReply(SqlSession session, Reply reply);
	/**
	 * 댓글 수정 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int updateReply(SqlSession session, Reply reply);
	/**
	 * 댓글 삭제 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int deleteReply(SqlSession session, Reply reply);
	/**
	 * 댓글 리스트 Store
	 * @param session
	 * @param replyBoardNo
	 * @return
	 */
	List<Reply> selectReplyList(SqlSession session, int replyBoardNo);

}
