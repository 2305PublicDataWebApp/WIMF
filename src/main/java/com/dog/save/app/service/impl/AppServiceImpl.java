package com.dog.save.app.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.dog.save.app.domain.App;
import com.dog.save.app.service.AppService;
import com.dog.save.app.store.AppStore;
import com.dog.save.common.domain.PageInfo;

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

}
