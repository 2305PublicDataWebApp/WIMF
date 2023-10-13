package com.dog.save.user.store;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.user.domain.User;

public interface UserStore {

	User checkDuplUserId(SqlSession session, String userId);

}
