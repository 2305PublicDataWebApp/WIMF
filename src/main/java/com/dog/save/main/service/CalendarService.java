package com.dog.save.main.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.dog.save.main.domain.Calendar;

public interface CalendarService {

	int insertEvent(Calendar calendar);

	Optional<Calendar> findEventByUserIdAndTitleAndStartDateAndEndDate(Map<String, Object> params);

	int deleteEvent(int schNo);

	int updateEvent(Map<String, Object> newParams);

	List<Calendar> getEventListByDate(Map<String, Object> dateRange);

	List<Calendar> getAllEventList(String userId);
	
}
