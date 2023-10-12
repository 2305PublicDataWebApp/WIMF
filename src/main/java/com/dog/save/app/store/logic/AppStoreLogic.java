package com.dog.save.app.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dog.save.app.domain.App;
import com.dog.save.app.store.AppStore;
import com.dog.save.common.domain.PageInfo;

public class AppStoreLogic implements AppStore {

	@Override
	public int getTotalCount(SqlSession sqlSession) {
		int totalCount = sqlSession.selectOne("AppMapper.getTotalCount");
		return totalCount;
	}

	@Override
	public List<App> appAllList(SqlSession sqlSession, PageInfo pageInfo) {
		int limit = pageInfo.getRecordCountPerPage();
		int offset = (pageInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<App> aList = sqlSession.selectList("AppMapper.appAllList", rowBounds);
		return aList;
	}

}
