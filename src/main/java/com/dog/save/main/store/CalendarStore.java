package com.dog.save.main.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.main.domain.Calendar;

public interface CalendarStore {

	int insertEvent(SqlSession session, Calendar calendar);

	List<Calendar> getAllEventList(SqlSession session);

}
