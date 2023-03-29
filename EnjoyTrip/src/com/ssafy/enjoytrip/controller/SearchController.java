package com.ssafy.enjoytrip.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.enjoytrip.dao.SearchDao;
import com.ssafy.enjoytrip.model.SearchInfoDto;


@WebServlet("/navigator")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SearchDao searchDao;
	
	public void init() throws ServletException {
		searchDao = SearchDao.getTripService();
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	
	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		String path = "";
		// "지역별여행지" 리다이렉션
		if("serchTrip".equals(action)) {
			path = getInfo(request, response);
			forward(request, response, path);
		} 
		
		else if("showmap".equals(action)) {
			path = showMap(request, response);
			forward(request, response, path);
		} 
		
		else {
			redirect(request, response, path);
		}
	}
	
	
	// 선택된 정보를 바탕으로 관광지 정보를 DB에서 수집한다.
	private String showMap(HttpServletRequest request, HttpServletResponse response) {
		//HttpSession session = request.getSession();
		int sido = Integer.parseInt(request.getParameter("sido"));
		int gugun = Integer.parseInt(request.getParameter("gugun"));
		int type = Integer.parseInt(request.getParameter("type"));
		String keyword = request.getParameter("keyword");
		
		try {
			List<SearchInfoDto> tripInfo = searchDao.getAttrInfo(sido, gugun, type, keyword);
			request.setAttribute("attrinfo", tripInfo);
			
			return "/product/search.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "/product/search.jsp";
		}
	}

	// "지역별 여행지" 네비게이션 이벤트 발생 시 관광지 정보를 가져오기 위한 기초 자료를 DB에서 가져온다.
	private String getInfo(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			session.setAttribute("cities", searchDao.getCities());  // 시 정보는 Main이니 Session 유지.
		} catch (Exception e) {
			e.printStackTrace();
			return "/product/search.jsp";
		}
		return "/product/search.jsp";
	}
}
