package com.dog.save.main.service;

import java.util.List;

import com.dog.save.main.domain.Calendar;

public interface CalendarService {

	int insertEvent(Calendar calendar);

	List<Calendar> getAllEventList();
	
}
