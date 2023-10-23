package com.dog.save.app.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.app.domain.App;
import com.dog.save.app.service.AppService;
import com.dog.save.app.store.AppStore;
import com.dog.save.common.domain.PageInfo;

@Service
public class AppServiceImpl implements AppService {
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	
	private AppStore aStore;

	@Override
	public int getTotalCount() {
		int totalCount = aStore.getTotalCount(sqlSession);
		return totalCount;
	}

	@Override
	public List<App> appAllList(PageInfo pageInfo) {
		List<App> aList = aStore.appAllList(sqlSession, pageInfo);
		return aList;
	}

	@Override
	public int insertApplication(App app) {
		int result = aStore.insertApplication(sqlSession, app);
		return result;
	}

	@Override
	public App selectAppByNo(int appNo) {
		App app = aStore.selectAppByNo(sqlSession, appNo);
		return app;
	}

	@Override
	public int allowAdopt(App app) {
		int result = aStore.allowAdopt(sqlSession, app);
		return result;
	}

	@Override
	public int updateStatus(App app) {
		int result = aStore.updateStatus(sqlSession, app);
		return result;
	}

	@Override
	public int allowCare(App app) {
		int result = aStore.allowCare(sqlSession, app);
		return result;
	}

	// 이승현 왔다감
	// 마이페이지 작성한 입양신청서 리스트 출력
	@Override
	public List<App> selectAppListById(String userId) {
		List<App> aList = aStore.selectAppListById(sqlSession, userId);
		return aList;
	}

}
