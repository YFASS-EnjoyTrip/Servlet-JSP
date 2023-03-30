package com.ssafy.enjoytrip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.enjoytrip.service.MainService;
import com.ssafy.enjoytrip.service.MainServiceImpl;

@WebServlet("/main")
public class MainController extends HttpServlet {
	
	private MainService ms;

	@Override
	public void init() throws ServletException {
		ms = MainServiceImpl.getInstance();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doGet(req, res);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if (action == null || "".equals(action)) action = "main";
		
		String path = "";
		switch (action) {
		case "main":
			path = getTopInfo(req, res);
			req.getRequestDispatcher(path).forward(req, res);
			break;
		case "search":
			req.getRequestDispatcher("/service/search.jsp").forward(req, res);
			break;
		default:
			break;
		}
		
	}

	private String getTopInfo(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.setAttribute("items", ms.getTopInfo());
		} catch (Exception e) {
			e.printStackTrace();
			return "/index.jsp";
		}
		
		return "/index.jsp";
	}

	
}
