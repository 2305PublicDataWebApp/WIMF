package com.dog.save.user.service;

import com.dog.save.user.domain.User;

public interface UserService {

	User checkDuplUserId(String userId);

	User checkLogin(User user);
	// 게시글 상세 조회 (작성자 닉네임)
	User selectOneById(String userId);
	
}
