package com.dog.save.app.service;

import java.util.List;

import com.dog.save.app.domain.App;
import com.dog.save.common.domain.PageInfo;

public interface AppService {

	/**
	 * 지원서 제출 Service
	 * @param app
	 * @return int
	 */
	int insertApplication(App app);

	/**
	 * 지원서 목록 개수 Service
	 * @return int
	 */
	int getTotalCount();

	/**
	 * 지원서 리스트 Service
	 * @param pageInfo
	 * @return List<App>
	 */
	List<App> appAllList(PageInfo pageInfo);

	/**
	 * 지원서 상세 Service
	 * @param appNo
	 * @return
	 */
	App selectAppByNo(int appNo);

	/**
	 * 관리자 입양 승인 시 Service
	 * @param app
	 * @return int
	 */
	int allowAdopt(App app);

	/**
	 * 관리자 신청서 상태 변경 시 Service
	 * @param app
	 * @return int
	 */
	int updateStatus(App app);

	/**
	 * 관리자 돌봄 승인 시 Service
	 * @param app
	 * @return int
	 */
	int allowCare(App app);

	/**
	 * 이승현 왔다감
	 * 마이페이지 작성한 입양신청서 리스트 출력 Service
	 * @param userId
	 * @return List<App>
	 */
	List<App> selectAppListById(String userId);

}
