package com.ssafy.enjoytrip.dao;

import java.sql.SQLException;

import com.ssafy.enjoytrip.model.User;

public interface UserDao {
	void regist(User user) throws SQLException;
	User login(String id, String pw) throws SQLException;
	int findUserById(String id) throws SQLException;
}
