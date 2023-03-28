package com.ssafy.enjoytrip.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.enjoytip.model.User;
import com.ssafy.enjoytrip.service.UserService;
import com.ssafy.enjoytrip.service.UserServiceImpl;

@WebServlet("/user")
public class UserController extends HttpServlet {
	
	private UserService us;
	
	@Override
	public void init() throws ServletException {
		us = UserServiceImpl.getInstance();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doGet(req, res);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		String path = "";
		switch (action) {
		case "idcheck":
			idcheck(req, res);
			break;
		case "signup":
			signup(req, res);
			res.sendRedirect(req.getContextPath());
			break;

		default:
			break;
		}
	
	}

	private String signup(HttpServletRequest req, HttpServletResponse res) {
		try {
			User user = new User();
			
			user.setId(req.getParameter("userId"));
			user.setPwd(req.getParameter("userpwd"));
			user.setNickName(req.getParameter("userName"));
			
			us.signup(user);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return "";
	}

	private void idcheck(HttpServletRequest req, HttpServletResponse res) {
		
	}



}
