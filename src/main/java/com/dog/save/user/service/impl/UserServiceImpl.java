package com.dog.save.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.user.domain.User;
import com.dog.save.user.service.UserService;
import com.dog.save.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private UserStore uStore;

	@Override
	public User checkDuplUserId(String userId) {
		User uOne = uStore.checkDuplUserId(session, userId);
		return uOne;
	}

	@Override
	public User checkDuplUserNickname(String userNickname) {
		User uOne = uStore.checkDuplUserNickname(session, userNickname);
		return uOne;
	}

	@Override
	public User checkDuplUserEmail(String userEmail) {
		User uOne = uStore.checkDuplUserEmail(session, userEmail);
		return uOne;
	}

	@Override
	public User checkLogin(User user) {
		User uOne = uStore.checkLogin(session, user);
		return uOne;
	}
	// 게시글 상세 조회 (작성자 닉네임)
	@Override
	public User selectOneById(String userId) {
		User uOne = uStore.selectOneById(session, userId);
		return uOne;
	}

	@Override
	public User checkUserByNameEmail(User user) {
		User uOne = uStore.checkUserByNameEmail(session, user);
		return uOne;
	}

	@Override
	public User checkUserByNameIdEmail(User user) {
		User uOne = uStore.checkUserByNameIdEmail(session, user);
		return uOne;
	}

	@Override
	public int insertUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}
}
