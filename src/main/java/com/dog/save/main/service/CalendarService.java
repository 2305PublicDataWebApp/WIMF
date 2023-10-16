package com.dog.save.main.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.dog.save.main.domain.Calendar;

public interface CalendarService {

	int insertEvent(Calendar calendar);

	List<Calendar> getAllEventList();

	Optional<Calendar> findEventByUserIdAndTitleAndStartDateAndEndDate(Map<String, Object> params);

	int deleteEvent(int schNo);

	int updateEvent(Map<String, Object> newParams);
	
}
