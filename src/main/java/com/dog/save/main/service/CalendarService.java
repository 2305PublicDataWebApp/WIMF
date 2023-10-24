package com.dog.save.main.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.dog.save.main.domain.Calendar;

public interface CalendarService {

	/**
	 * 일정 등록 Service
	 * @param calendar
	 * @return
	 */
	int insertEvent(Calendar calendar);

	/**
	 * 일정 수정 Service
	 * @param newParams
	 * @return
	 */
	int updateEvent(Map<String, Object> newParams);

	/**
	 * 일정 삭제 Service
	 * @param schNo
	 * @return
	 */
	int deleteEvent(int schNo);
	
	/**
	 * 모든 일정 가져오기 Service
	 * @param userId
	 * @return
	 */
	List<Calendar> getAllEventList(String userId);

	/**
	 * 선택한 날짜 일정 가져오기 Service
	 * @param dateRange
	 * @return
	 */
	List<Calendar> getEventListByDate(Map<String, Object> dateRange);
	
	/**
	 * 아이디, 제목, 시작일, 종료일로 일정 찾기
	 * @param params
	 * @return
	 */
	Optional<Calendar> findEventByUserIdAndTitleAndStartDateAndEndDate(Map<String, Object> params);
	
}
