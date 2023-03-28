package com.ssafy.enjoytrip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssafy.enjoytip.model.User;
import com.ssafy.enjoytrip.util.DBUtil;

public class UserDaoImpl implements UserDao {
	
	private DBUtil db;
	
	private static UserDao instance = new UserDaoImpl();
	private UserDaoImpl() {
		db = DBUtil.getInstance();
	}
	
	public static UserDao getInstance() {
		return instance;
	}
	
	@Override
	public void regist(User user) throws SQLException {
		try (
				Connection con = db.getConnection();
				PreparedStatement pstmt = con.prepareStatement
				(
					"insert into user(id, pw, nickname) values(?, ?, ?)"
				)
			)
		{
			int idx = 0;
			pstmt.setString(++idx, user.getId());
			pstmt.setString(++idx, user.getPwd());
			pstmt.setString(++idx, user.getNickName());
			
			pstmt.executeUpdate();
		}
	}

	@Override
	public User login(String id, String pw) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findUserById(String id) throws SQLException {
		try (
				Connection con = db.getConnection();
				PreparedStatement pstmt = con.prepareStatement
				(
					"select id, nickname from user where id = ?"
				)
			)
		{
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) return 1;	
		}
		return 0;
	}
	

}
