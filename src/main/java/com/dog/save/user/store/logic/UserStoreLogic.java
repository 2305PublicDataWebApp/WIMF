package com.dog.save.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.user.domain.User;
import com.dog.save.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	@Override
	public User checkDuplUserId(SqlSession session, String userId) {
		User uOne = session.selectOne("UserMapper.checkDuplUserId", userId);
		return uOne;
	}

}
