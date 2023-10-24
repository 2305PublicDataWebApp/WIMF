package com.dog.save.donation.service;

import java.util.List;

import com.dog.save.donation.domain.Donation;
import com.dog.save.user.domain.UserDonation;

public interface DonationService {

	/**
	 * 유기견 후원하기
	 * @param donation
	 * @return
	 */
	int insertDonation(Donation donation);

	/**
	 * 이승현 왔다감
	 * 마이페이지 후원중인 강아지 리스트 출력 ajax
	 * @param userId
	 * @return List<UserDonation>
	 */
	List<UserDonation> selectListById(String userId);
	/**
	 * 후원 금액
	 * @param dogNo
	 * @return
	 */
	int totalDonationAmount(int dogNo);

}
