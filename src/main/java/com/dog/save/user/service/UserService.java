package com.dog.save.user.service;

import com.dog.save.user.domain.User;

public interface UserService {
	
	/**
	 * ajax 유저 회원가입
	 * @param user
	 * @return
	 */
	int insertUser(User userData);

	/**
	 * ajax 유저 개인정보 수정
	 * @param userData
	 * @return
	 */
	int updateUser(User userData);

	/**
	 * ajax 회원가입 아이디 중복 체크
	 * @param userId
	 * @return User
	 */
	User checkDuplUserId(String userId);
	
	/**
	 * ajax 회원가입 닉네임 중복 체크
	 * @param userNickname
	 * @return User
	 */
	User checkDuplUserNickname(String userNickname);

	/**
	 * ajax 회원가입 이메일 중복 체크
	 * @param userEmail
	 * @return User
	 */
	User checkDuplUserEmail(String userEmail);

	/**
	 * 로그인 체크
	 * @param user
	 * @return User
	 */
	User checkLogin(User user);
	// 게시글 상세 조회 (작성자 닉네임)
	User selectOneById(String userId);
	
	/**
	 * ajax 아이디 찾기 회원 유효성 체크
	 * @param user
	 * @return User
	 */
	User checkUserByNameEmail(User user);
	
	/**
	 * ajax 비밀번호 찾기 회원 유효성 체크
	 * @param user
	 * @return User
	 */
	User checkUserByNameIdEmail(User user);
	
}