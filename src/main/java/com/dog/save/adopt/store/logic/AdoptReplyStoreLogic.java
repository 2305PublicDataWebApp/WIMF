package com.dog.save.adopt.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.adopt.domain.AdoptReply;
import com.dog.save.adopt.store.AdoptReplyStore;

@Repository
public class AdoptReplyStoreLogic implements AdoptReplyStore {
	@Override
	public int insertAdoptReply(SqlSession session, AdoptReply reply) {
		int result = session.insert("AdoptReplyMapper.insertAdoptReply", reply);
		return result;
	}

	@Override
	public int updateAdoptReply(SqlSession session, AdoptReply reply) {
		int result = session.update("AdoptReplyMapper.updateAdoptReply", reply);
		return result;
	}

	@Override
	public int deleteAdoptReply(SqlSession session, AdoptReply reply) {
		int result = session.delete("AdoptReplyMapper.deleteAdoptReply", reply);
		return result;
	}

	@Override
	public List<AdoptReply> selectAdoptReplyList(SqlSession session, int replyBoardNo) {
		List<AdoptReply> rList = session.selectList("AdoptReplyMapper.selectAdoptReplyList", replyBoardNo);
		return rList;
	}
}
