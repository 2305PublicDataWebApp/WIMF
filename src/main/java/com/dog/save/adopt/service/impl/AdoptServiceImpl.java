package com.dog.save.adopt.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.adopt.domain.Adopt;
import com.dog.save.adopt.service.AdoptService;
import com.dog.save.adopt.store.AdoptStore;
import com.dog.save.board.domain.bPageInfo;

@Service
public class AdoptServiceImpl implements AdoptService {
	
	@Autowired
	private AdoptStore aStore;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertAdopt(Adopt adopt) {
		int result = aStore.insertAdopt(sqlSession, adopt);
		return result;
	}

	@Override
	public int updateAdoptByNo(Adopt adopt) {
		int result = aStore.updateAdopt(sqlSession, adopt);
		return result;
	}

	@Override
	public int deleteAdoptByNo(Adopt adopt) {
		int result = aStore.deleteAdopt(sqlSession, adopt);
		return result;
	}

	@Override
	public Adopt showOneByAdopt(Integer adoptNo) {
		Adopt adopt = aStore.selectOneByAdopt(sqlSession, adoptNo);
		return adopt;
	}

	@Override
	public List<Adopt> selectAdoptList(bPageInfo bpInfo, String adoptType) {
		List<Adopt> aList = aStore.selectAdoptList(sqlSession, bpInfo, adoptType);
		return aList;
	}

	@Override
	public int getListCount(String adoptType) {
		int result = aStore.selectListCount(sqlSession, adoptType);
		return result;
	}

	@Override
	public List<Adopt> searchAdoptByKeyword(bPageInfo bpInfo, Map<String, String> paramMap) {
		List<Adopt> searchList = aStore.selectAdoptByKeyword(sqlSession, bpInfo, paramMap);
		return searchList;
	}

	@Override
	public int increaseViewCount(Integer adoptNo) {
		int result = aStore.increaseViewCount(sqlSession, adoptNo);
		return result;
	}

	@Override
	public int getSelectAdoptByKeywordCount(Map<String, String> paramMap) {
		int result = aStore.getSelectAdoptByKeywordCount(sqlSession, paramMap);
		return result;
	}

}
