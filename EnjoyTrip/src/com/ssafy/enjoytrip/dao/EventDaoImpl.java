package com.ssafy.enjoytrip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.enjoytrip.model.TopRateEvent;
import com.ssafy.enjoytrip.util.DBUtil;

public class EventDaoImpl implements EventDao{
	private DBUtil db;
	
	private static EventDao instance = new EventDaoImpl();
	private EventDaoImpl() {
		db = DBUtil.getInstance();
	}
	
	public static EventDao getInstance() {
		return instance;
	}
	
	@Override
	public List<TopRateEvent> findAllTopEvent() throws SQLException {
		try (
				Connection con = db.getConnection();
				PreparedStatement pstmt = con.prepareStatement
				(
					"select content_id, title, first_image "
					+ "from attraction_info "
					+ "order by readcount DESC limit 10"
				)
			)				
		{
			List<TopRateEvent> res = new ArrayList<>();
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TopRateEvent eve = new TopRateEvent();
				
				eve.setContentId(rs.getInt("content_id"));
				eve.setTitle(rs.getString("title"));
				eve.setImage(rs.getString("first_image"));
				
				
				System.out.println(rs.getString("first_image"));
				res.add(eve);
			}
			
			return res;
		}
	}
	
}
