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

}
