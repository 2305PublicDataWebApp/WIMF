package com.dog.save.user.store;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.user.domain.User;

public interface UserStore {

	User checkDuplUserId(SqlSession session, String userId);

	User checkLogin(SqlSession session, User user);
	// 게시글 상세 조회 (작성자 닉네임)
	User selectOneById(SqlSession session, String userId);

}
