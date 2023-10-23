package com.dog.save.app.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.app.domain.App;
import com.dog.save.app.store.AppStore;
import com.dog.save.common.domain.PageInfo;

@Repository
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
		List<App> aList = sqlSession.selectList("AppMapper.appAllList", null, rowBounds);
		return aList;
	}

	@Override
	public int insertApplication(SqlSession sqlSession, App app) {
		int result = sqlSession.insert("AppMapper.insertApplication", app);
		return result;
	}

	@Override
	public App selectAppByNo(SqlSession sqlSession, int appNo) {
		App app = sqlSession.selectOne("AppMapper.selectAppByNo", appNo);
		return app;
	}

	@Override
	public int allowAdopt(SqlSession sqlSession, App app) {
		int result = sqlSession.insert("AppMapper.allowAdopt", app);
		return result;
	}

	@Override
	public int updateStatus(SqlSession sqlSession, App app) {
		int result = sqlSession.insert("AppMapper.updateStatus", app);
		return result;
	}

	@Override
	public int allowCare(SqlSession sqlSession, App app) {
		int result = sqlSession.insert("AppMapper.allowCare", app);
		return result;
	}

	
	// 이승현 왔다감
	// 마이페이지 작성한 입양신청서 리스트 출력
	@Override
	public List<App> selectAppListById(SqlSession sqlSession, String userId) {
		List<App> aList = sqlSession.selectList("AppMapper.selectAppListById", userId);
		return aList;
	}

}
