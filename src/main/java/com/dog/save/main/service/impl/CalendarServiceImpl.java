package com.dog.save.main.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dog.save.main.domain.Calendar;
import com.dog.save.main.service.CalendarService;
import com.dog.save.main.store.CalendarStore;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private CalendarStore cStore;

	@Override
	public int insertEvent(Calendar calendar) {
		int result = cStore.insertEvent(session, calendar);
		return result;
	}

	@Override
	public List<Calendar> getAllEventList() {
		List<Calendar> AllEventList = cStore.getAllEventList(session);
		return AllEventList;
	}
	
}
