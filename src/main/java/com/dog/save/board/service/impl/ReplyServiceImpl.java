package com.dog.save.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.board.domain.Reply;
import com.dog.save.board.service.ReplyService;
import com.dog.save.board.store.ReplyStore;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyStore rStore;
	@Autowired
	private SqlSession session;

	@Override
	public int insertReply(Reply reply) {
		int result = rStore.insertReply(session, reply);
		return result;
	}

	@Override
	public int updateReply(Reply reply) {
		int result = rStore.updateReply(session, reply);
		return result;
	}

	@Override
	public int deleteReply(Reply reply) {
		int result = rStore.deleteReply(session, reply);
		return result;
	}

	@Override
	public List<Reply> selectReplyList(int replyBoardNo) {
		List<Reply> rList = rStore.selectReplyList(session, replyBoardNo);
		return rList;
	}

}
