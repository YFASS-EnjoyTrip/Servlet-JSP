package com.ssafy.enjoytrip.service;

import java.util.List;

import com.ssafy.enjoytrip.dao.EventDao;
import com.ssafy.enjoytrip.dao.EventDaoImpl;
import com.ssafy.enjoytrip.model.TopRateEvent;

public class MainServiceImpl implements MainService {
	
	private EventDao dao;
	
	private static MainService instance = new MainServiceImpl();
	private MainServiceImpl() {
		dao = EventDaoImpl.getInstance();
	}
	
	public static MainService getInstance() {
		return instance;
	}
	
	@Override
	public List<TopRateEvent> getTopInfo() throws Exception {
		return dao.findAllTopEvent();
	}
	
}
