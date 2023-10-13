package com.dog.save.user.service;

import com.dog.save.user.domain.User;

public interface UserService {

	User checkDuplUserId(String userId);

	User checkLogin(User user);
	
}
