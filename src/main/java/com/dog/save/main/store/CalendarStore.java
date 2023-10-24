package com.dog.save.main.store;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.main.domain.Calendar;

public interface CalendarStore {

	/**
	 * 일정 등록 Store
	 * @param session
	 * @param calendar
	 * @return
	 */
	int insertEvent(SqlSession session, Calendar calendar);

	/**
	 * 일정 수정 Store
	 * @param session
	 * @param newParams
	 * @return
	 */
	int updateEvent(SqlSession session, Map<String, Object> newParams);

	/**
	 * 일정 삭제 Store
	 * @param session
	 * @param schNo
	 * @return
	 */
	int deleteEvent(SqlSession session, int schNo);

	/**
	 * 모든 일정 가져오기 Store
	 * @param session
	 * @param userId
	 * @return
	 */
	List<Calendar> getAllEventList(SqlSession session, String userId);

	/**
	 * 선택한 날짜 일정 가져오기 Store
	 * @param session
	 * @param dateRange
	 * @return
	 */
	List<Calendar> getEventListByDate(SqlSession session, Map<String, Object> dateRange);

	/**
	 * 아이디, 제목, 시작일, 종료일로 일정 찾기 Store
	 * @param session
	 * @param params
	 * @return
	 */
	Optional<Calendar> findEventByUserIdAndTitleAndStartDateAndEndDate(SqlSession session, Map<String, Object> params);

}
