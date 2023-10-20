package com.dog.save.donation.store;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.donation.domain.Donation;

public interface DonationStore {

	/**
	 * 유기견 후원하기
	 * @param donation
	 * @param sqlSession
	 * @return
	 */
	int insertDonation(Donation donation, SqlSession sqlSession);

}
