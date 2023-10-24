package com.dog.save.donation.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.donation.domain.Donation;
import com.dog.save.donation.service.DonationService;
import com.dog.save.donation.store.DonationStore;
import com.dog.save.user.domain.UserDonation;

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

	// 이승현 왔다감
	// 마이페이지 후원중인 강아지 리스트 출력 ajax
	@Override
	public List<UserDonation> selectListById(String userId) {
		List<UserDonation> donaList = dnStore.selectListById(sqlSession, userId);
		return donaList;
	}

	@Override
	public int totalDonationAmount(int dogNo) {
		int result = dnStore.totalDonationAmount(sqlSession, dogNo);
		return result;
	}

}
