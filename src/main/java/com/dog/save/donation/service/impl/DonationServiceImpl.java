package com.dog.save.donation.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.donation.domain.Donation;
import com.dog.save.donation.service.DonationService;
import com.dog.save.donation.store.DonationStore;

@Service
public class DonationServiceImpl implements DonationService{

	@Autowired
	private DonationStore dnStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertDonation(Donation donation) {
		int result = dnStore.insertDonation(donation, sqlSession);
		return result;
	}

}
