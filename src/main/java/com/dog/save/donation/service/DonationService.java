package com.dog.save.donation.service;

import com.dog.save.donation.domain.Donation;

public interface DonationService {

	/**
	 * 유기견 후원하기
	 * @param donation
	 * @return
	 */
	int insertDonation(Donation donation);

}
