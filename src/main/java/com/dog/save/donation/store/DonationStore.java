package com.dog.save.donation.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.donation.domain.Donation;
import com.dog.save.user.domain.UserDonation;

public interface DonationStore {

	/**
	 * 유기견 후원하기
	 * @param donation
	 * @param sqlSession
	 * @return
	 */
	int insertDonation(Donation donation, SqlSession sqlSession);

	/**
	 * 이승현 왔다감
	 * 마이페이지 후원중인 강아지 리스트 출력 ajax
	 * @param sqlSession
	 * @param userId
	 * @return List<UserDonation>
	 */
	List<UserDonation> selectListById(SqlSession sqlSession, String userId);

}
