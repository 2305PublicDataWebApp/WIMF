package com.dog.save.adopt.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.adopt.domain.Adopt;
import com.dog.save.adopt.store.AdoptStore;
import com.dog.save.board.domain.bPageInfo;

@Repository
public class AdoptStoreLogic implements AdoptStore {
	
	@Override
	public int insertAdopt(SqlSession sqlSession, Adopt adopt) {
		int result = sqlSession.insert("AdoptMapper.insertAdopt", adopt);
		return result;
	}

	@Override
	public int updateAdopt(SqlSession sqlSession, Adopt adopt) {
		int result = sqlSession.update("AdoptMapper.updateAdopt", adopt);
		return result;
	}

	@Override
	public int deleteAdopt(SqlSession sqlSession, Adopt adopt) {
		int result = sqlSession.delete("AdoptMapper.deleteAdopt", adopt);
		return result;
	}

	@Override
	public Adopt selectOneByAdopt(SqlSession sqlSession, Integer adoptNo) {
		Adopt adopt = sqlSession.selectOne("AdoptMapper.selectOneByAdopt", adoptNo);
		return adopt;
	}

	@Override
	public List<Adopt> selectAdoptList(SqlSession sqlSession, bPageInfo bpInfo, String adoptType) {
		int limit = bpInfo.getRecordCountPerPage();
		int offset = (bpInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Adopt> aList = sqlSession.selectList("AdoptMapper.selectAdoptList", adoptType, rowBounds);
		return aList;
	}

	@Override
	public int selectListCount(SqlSession sqlSession, String adoptType) {
		int result = sqlSession.selectOne("AdoptMapper.selectListCount", adoptType);
		return result;
	}

	@Override
	public List<Adopt> selectAdoptByKeyword(SqlSession sqlSession, bPageInfo bpInfo, Map<String, String> paramMap) {
		int limit = bpInfo.getRecordCountPerPage();
		int offset = (bpInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Adopt> searchList = sqlSession.selectList("AdoptMapper.selectAdoptByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public int increaseViewCount(SqlSession sqlSession, Integer adoptNo) {
		int result = sqlSession.update("AdoptMapper.increaseViewCount", adoptNo);
		return result;
	}

	@Override
	public int getSelectAdoptByKeywordCount(SqlSession sqlSession, Map<String, String> paramMap) {
		int result = sqlSession.selectOne("AdoptMapper.getSelectAdoptByKeywordCount", paramMap);
		return result;
	}

	@Override
	public List<Adopt> selectAllAdobtList(SqlSession sqlSession) {
		List<Adopt> aList = sqlSession.selectList("AdoptMapper.selectAllAdobtList");
		return aList;
	}

}
