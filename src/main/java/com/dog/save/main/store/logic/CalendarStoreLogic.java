package com.dog.save.main.store.logic;

import java.util.List;
import java.util.Map;
import java.util.Optional;

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

	@Override
	public Optional<Calendar> findEventByUserIdAndTitleAndStartDateAndEndDate(SqlSession session,
			Map<String, Object> params) {
		return Optional.ofNullable(session.selectOne("CalendarMapper.findEventByUserIdAndTitleAndStartDateAndEndDate", params));
	}

	@Override
	public int deleteEvent(SqlSession session, int schNo) {
		int result = session.delete("CalendarMapper.deleteEvent", schNo);
		return result;
	}

	@Override
	public int updateEvent(SqlSession session, Map<String, Object> newParams) {
		int result = session.update("CalendarMapper.updateEvent", newParams);
		return result;
	}
	
}
