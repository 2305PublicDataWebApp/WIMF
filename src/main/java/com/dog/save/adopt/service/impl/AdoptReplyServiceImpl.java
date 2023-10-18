package com.dog.save.adopt.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.adopt.domain.AdoptReply;
import com.dog.save.adopt.service.AdoptReplyService;
import com.dog.save.adopt.store.AdoptReplyStore;

@Service
public class AdoptReplyServiceImpl implements AdoptReplyService {
	
	@Autowired
	private AdoptReplyStore arStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertAdoptReply(AdoptReply reply) {
		int result = arStore.insertAdoptReply(session, reply);
		return result;
	}

	@Override
	public int updateAdoptReply(AdoptReply reply) {
		int result = arStore.updateAdoptReply(session, reply);
		return result;
	}

	@Override
	public int deleteAdoptReply(AdoptReply reply) {
		int result = arStore.deleteAdoptReply(session, reply);
		return result;
	}

	@Override
	public List<AdoptReply> selectAdoptReplyList(int adoptReplyNo) {
		List<AdoptReply> rList = arStore.selectAdoptReplyList(session, adoptReplyNo);
		return rList;
	}
}
