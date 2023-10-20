package com.dog.save.user.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.user.domain.User;

public interface UserStore {
	
	/**
	 * ajax 유저 회원가입
	 * @param session
	 * @param user
	 * @return int
	 */
	int insertUser(SqlSession session, User userData);

	/**
	 * ajax 유저 개인정보 수정
	 * @param session
	 * @param userData
	 * @return int
	 */
	int updateUser(SqlSession session, User userData);
	
	/**
	 * ajax 유저 마이페이지에서 비밀번호 변경
	 * @param session
	 * @param user
	 * @return int
	 */
	int updateUserPw(SqlSession session, User user);
	
	/**
	 * ajax 유저 회원탈퇴
	 * @param session
	 * @param userId
	 * @return
	 */
	int deleteUser(SqlSession session, String userId);

	/**
	 * ajax 회원가입 아이디 중복 체크
	 * @param session
	 * @param userId
	 * @return User
	 */
	User checkDuplUserId(SqlSession session, String userId);
	
	/**
	 * ajax 회원가입 닉네임 중복 체크
	 * @param session
	 * @param userNickname
	 * @return User
	 */
	User checkDuplUserNickname(SqlSession session, String userNickname);

	/**
	 * ajax 회원가입 이메일 중복 체크
	 * @param session
	 * @param userEmail
	 * @return User
	 */
	User checkDuplUserEmail(SqlSession session, String userEmail);

	/**
	 * 로그인 체크
	 * @param session
	 * @param user
	 * @return User
	 */
	User checkLogin(SqlSession session, User user);
	
	// 게시글 상세 조회 (작성자 닉네임)
	User selectOneById(SqlSession session, String userId);
	
	/**
	 * ajax 아이디 찾기 회원 유효성 체크
	 * @param session
	 * @param user
	 * @return User
	 */
	User checkUserByNameEmail(SqlSession session, User user);
	
	/**
	 * ajax 비밀번호 찾기 회원 유효성 체크
	 * @param session
	 * @param user
	 * @return User
	 */
	User checkUserByNameIdEmail(SqlSession session, User user);

	// 기진 코드
	/**
	 * 모든 유저 정보 가져오기
	 * @param session
	 * @return
	 */
	List<User> selectAllUser(SqlSession session);
	// 기진 코드

	

	

}