package com.dog.save.user.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.user.domain.User;
import com.dog.save.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{
	

	@Override
	public int insertUser(SqlSession session, User userData) {
		int result = session.insert("UserMapper.insertUser", userData);
		return result;
	}

	@Override
	public int updateUser(SqlSession session, User userData) {
		int result = session.update("UserMapper.updateUser", userData);
		return result;
	}

	@Override
	public User checkDuplUserId(SqlSession session, String userId) {
		User uOne = session.selectOne("UserMapper.checkDuplUserId", userId);
		return uOne;
	}

	@Override
	public User checkDuplUserNickname(SqlSession session, String userNickname) {
		User uOne = session.selectOne("UserMapper.checkDuplUserNickname", userNickname);
		return uOne;
	}

	@Override
	public User checkDuplUserEmail(SqlSession session, String userEmail) {
		User uOne = session.selectOne("UserMapper.checkDuplUserEmail", userEmail);
		return uOne;
	}

	@Override
	public User checkLogin(SqlSession session, User user) {
		User uOne = session.selectOne("UserMapper.checkLogin", user);
		return uOne;
	}
	// 게시글 상세 조회 (작성자 닉네임)
	@Override
	public User selectOneById(SqlSession session, String userId) {
		User uOne = session.selectOne("UserMapper.checkDuplUserId", userId);
		return uOne;
	}

	@Override
	public User checkUserByNameEmail(SqlSession session, User user) {
		User uOne = session.selectOne("UserMapper.checkUserByNameEmail", user);
		return uOne;
	}

	@Override
	public User checkUserByNameIdEmail(SqlSession session, User user) {
		User UOne = session.selectOne("UserMapper.checkUserByNameIdEmail", user);
		return UOne;
	}

}
