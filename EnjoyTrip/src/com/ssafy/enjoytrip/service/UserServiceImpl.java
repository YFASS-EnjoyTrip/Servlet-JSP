package com.ssafy.enjoytrip.service;

import com.ssafy.enjoytip.model.User;
import com.ssafy.enjoytrip.dao.UserDao;
import com.ssafy.enjoytrip.dao.UserDaoImpl;

public class UserServiceImpl implements UserService {

	private UserDao dao;
	
	private static UserService instance = new UserServiceImpl();
	private UserServiceImpl() {
		dao = UserDaoImpl.getInstance();
	}
	
	public static UserService getInstance() {
		return instance;
	}
	
	@Override
	public void signup(User user) throws Exception {
		dao.regist(user);
	}
	

}
