package com.dog.save.app.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.app.domain.App;
import com.dog.save.common.domain.PageInfo;

public interface AppStore {

	/**
	 * 지원서 제출 Store
	 * @param app
	 * @return int
	 */
	int insertApplication(SqlSession sqlSession, App app);

	/**
	 * 지원서 목록 개수 Store
	 * @return int
	 */
	int getTotalCount(SqlSession sqlSession);

	/**
	 * 지원서 리스트 Store
	 * @param pageInfo
	 * @return List<App>
	 */
	List<App> appAllList(SqlSession sqlSession, PageInfo pageInfo);

	/**
	 * 지원서 상세 Store
	 * @param appNo
	 * @return
	 */
	App selectAppByNo(SqlSession sqlSession, int appNo);

	/**
	 * 관리자 입양 승인 시 Store
	 * @param app
	 * @return int
	 */
	int allowAdopt(SqlSession sqlSession, App app);

	/**
	 * 관리자 신청서 상태 변경 시 Store
	 * @param app
	 * @return int
	 */
	int updateStatus(SqlSession sqlSession, App app);

	/**
	 * 관리자 돌봄 승인 시 Store
	 * @param app
	 * @return int
	 */
	int allowCare(SqlSession sqlSession, App app);

	/**
	 * 이승현 왔다감
	 * 마이페이지 작성한 입양신청서 리스트 출력 Store
	 * @param sqlSession
	 * @param userId
	 * @return List<App>
	 */
	List<App> selectAppListById(SqlSession sqlSession, String userId);

}
