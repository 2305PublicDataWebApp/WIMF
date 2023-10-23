package com.dog.save.app.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.app.domain.App;
import com.dog.save.common.domain.PageInfo;

public interface AppStore {

	int getTotalCount(SqlSession sqlSession);

	List<App> appAllList(SqlSession sqlSession, PageInfo pageInfo);

	int insertApplication(SqlSession sqlSession, App app);

	App selectAppByNo(SqlSession sqlSession, int appNo);

	int allowAdopt(SqlSession sqlSession, App app);

	int updateStatus(SqlSession sqlSession, App app);

	int allowCare(SqlSession sqlSession, App app);

	/**
	 * 이승현 왔다감
	 * 마이페이지 작성한 입양신청서 리스트 출력
	 * @param sqlSession
	 * @param userId
	 * @return List<App>
	 */
	List<App> selectAppListById(SqlSession sqlSession, String userId);

}
