package com.dog.save.main.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.main.domain.Calendar;
import com.dog.save.main.store.CalendarStore;

@Repository
public class CalendarStoreLogic implements CalendarStore {

	@Override
	public int insertEvent(SqlSession session, Calendar calendar) {
		int result = session.insert("CalendarMapper.insertEvent", calendar);
		return result;
	}

	@Override
	public List<Calendar> getAllEventList(SqlSession session) {
		List<Calendar> AllEventList = session.selectList("CalendarMapper.getAllEventList");
		return AllEventList;
	}

	
}
