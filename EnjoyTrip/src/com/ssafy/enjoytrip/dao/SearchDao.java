package com.ssafy.enjoytrip.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.enjoytrip.model.SearchSidoDto;
import com.ssafy.enjoytrip.model.SearchInfoDto;
import com.ssafy.enjoytrip.util.DBUtil;

public class SearchDao {
	private DBUtil db;
	private static SearchDao searchDao = new SearchDao(); 
	
	private SearchDao () {
		db = DBUtil.getInstance();
	}
	
	public static SearchDao getTripService() {
		return searchDao;
	}
	
	// 시 정보 가져오기
	public List<SearchSidoDto> getCities() throws SQLException {
		try (
			Connection conn = db.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(
					"select * from sido"
					);
		) {
			List<SearchSidoDto> list= new ArrayList<>();
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				SearchSidoDto city = new SearchSidoDto();
				city.setSidoCode(rs.getInt("sido_code"));
				city.setSidoName(rs.getString("sido_name"));
				
				list.add(city);
			}
			return list;
		}
	}
	
	
	// 구군 정보 가져오기
	public List<SearchInfoDto> getAttrInfo(int sido, int gugun, int type, String keyword) throws SQLException {
		List<SearchInfoDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String newKey = "'%" + keyword + "%'";
		
		try {
			conn = db.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select sido_code, gugun_code, content_type_id, \n");
			sql.append("title, addr1, addr2, first_image, latitude, longitude \n");
			sql.append("from attraction_info \n");
			sql.append("where sido_code="+sido+" and gugun_code="+gugun+" and content_type_id="+type + " ");
//			sql.append("and ((title LIKE '%" + keyword + "%') or (addr1 LIKE '%" + keyword + "%') or (addr2 LIKE '%" + keyword + "%'))");
			sql.append("and ((title LIKE " + newKey+ ") or (addr1 LIKE "+ newKey + ") or (addr2 LIKE " + newKey+ "))");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				SearchInfoDto Info = new SearchInfoDto();
				Info.setSidoCode(rs.getInt("sido_code"));
				Info.setContentId(rs.getInt("content_type_id"));
				Info.setTitle(rs.getString("title"));
				Info.setAddress(rs.getString("addr1"));
				Info.setAddress2(rs.getString("addr2"));
				Info.setImgUrl(rs.getString("first_image"));
				Info.setLatitude(rs.getDouble("latitude"));
				Info.setLongitude(rs.getDouble("longitude"));
					
				list.add(Info);
			}
		} finally {
			db.close(rs, pstmt, conn);
		}
		return list;
	}

	// (추가) 지역명 버튼 눌렀을 때 처리
	public List<SearchInfoDto> getAttrInfo2(String keyword) throws SQLException {
		List<SearchInfoDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String newKey = "'%" + keyword + "%'";
		
		try {
			conn = db.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select sido_code, gugun_code, content_type_id, \n");
			sql.append("title, addr1, addr2, first_image, latitude, longitude \n");
			sql.append("from attraction_info \n");
			sql.append("where content_type_id=12 and ((addr1 LIKE "+ newKey + ") or addr2 LIKE (" + newKey + "))");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				SearchInfoDto Info = new SearchInfoDto();
				Info.setSidoCode(rs.getInt("sido_code"));
				Info.setContentId(rs.getInt("content_type_id"));
				Info.setTitle(rs.getString("title"));
				Info.setAddress(rs.getString("addr1"));
				Info.setAddress2(rs.getString("addr2"));
				Info.setImgUrl(rs.getString("first_image"));
				Info.setLatitude(rs.getDouble("latitude"));
				Info.setLongitude(rs.getDouble("longitude"));
					
				list.add(Info);
			}
		} finally {
			db.close(rs, pstmt, conn);
		}
		return list;
	}

}
