package com.dog.save.donation.store.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.donation.domain.Donation;
import com.dog.save.donation.store.DonationStore;
import com.dog.save.user.domain.UserDonation;

@Repository
public class DonationStoreLogic implements DonationStore{

	@Override
	public int insertDonation(Donation donation, SqlSession sqlSession) {
		int result = sqlSession.insert("DonationMapper.insertDonation", donation);
		return result;
	}

	// 이승현 왔다감
	// 마이페이지 후원중인 강아지 리스트 출력 ajax
	@Override
	public List<UserDonation> selectListById(SqlSession sqlSession, String userId) {
		List<UserDonation> dnList =  sqlSession.selectList("DonationMapper.selectListById", userId);
		return dnList;
	}

	@Override
	public int totalDonationAmount(SqlSession sqlSession, int dogNo) {
		int result = sqlSession.selectOne("DonationMapper.totalDonationAmount", dogNo);
		return result;
	}

}
