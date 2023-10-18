package com.dog.save.adopt.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.adopt.domain.AdoptReply;

public interface AdoptReplyStore {

	/**
	 * 댓글 작성 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int insertAdoptReply(SqlSession session, AdoptReply reply);
	
	/**
	 * 댓글 수정 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int updateAdoptReply(SqlSession session, AdoptReply reply);
	
	/**
	 * 댓글 삭제 Store
	 * @param session
	 * @param reply
	 * @return
	 */
	int deleteAdoptReply(SqlSession session, AdoptReply reply);
	
	/**
	 * 댓글 리스트 Store
	 * @param session
	 * @param replyBoardNo
	 * @return
	 */
	List<AdoptReply> selectAdoptReplyList(SqlSession session, int replyBoardNo);
	
}
