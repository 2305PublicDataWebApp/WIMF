package com.dog.save.donation.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.donation.domain.Donation;
import com.dog.save.donation.store.DonationStore;

@Repository
public class DonationStoreLogic implements DonationStore{

	@Override
	public int insertDonation(Donation donation, SqlSession sqlSession) {
		int result = sqlSession.insert("DonationMapper.insertDonation", donation);
		return result;
	}

}
