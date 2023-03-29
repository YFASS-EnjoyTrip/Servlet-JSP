package com.ssafy.enjoytrip.service;

import com.ssafy.enjoytrip.dao.UserDao;
import com.ssafy.enjoytrip.dao.UserDaoImpl;
import com.ssafy.enjoytrip.model.User;

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
	
	@Override
	public int idCheck(String id) throws Exception {
		return dao.findUserById(id);
	}

	@Override
	public User login(String id, String pw) throws Exception {
		return dao.login(id, pw);
	}
}
