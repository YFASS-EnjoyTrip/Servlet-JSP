package com.ssafy.enjoytrip.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.enjoytrip.model.TopRateEvent;

public interface EventDao {
	List<TopRateEvent> findAllTopEvent() throws SQLException;
}
