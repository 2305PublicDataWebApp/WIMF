package com.dog.save.app.service;

import java.util.List;

import com.dog.save.app.domain.App;
import com.dog.save.common.domain.PageInfo;

public interface AppService {

	int getTotalCount();

	List<App> appAllList(PageInfo pageInfo);

	int insertApplication(App app);

	App selectAppByNo(int appNo);

	int allowAdopt(App app);

	int updateStatus(App app);

	int allowCare(App app);

	/**
	 * 이승현 왔다감
	 * 마이페이지 작성한 입양신청서 리스트 출력
	 * @param userId
	 * @return List<App>
	 */
	List<App> selectAppListById(String userId);

}
