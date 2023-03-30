package com.ssafy.enjoytrip.service;

import java.util.List;

import com.ssafy.enjoytrip.model.TopRateEvent;

public interface MainService {
	List<TopRateEvent> getTopInfo() throws Exception;
}
