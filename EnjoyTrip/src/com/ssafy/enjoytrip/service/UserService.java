package com.ssafy.enjoytrip.service;

import com.ssafy.enjoytrip.model.User;

public interface UserService {
	void signup(User user) throws Exception;

	int idCheck(String id) throws Exception;

	User login(String id, String pw) throws Exception; 
}
