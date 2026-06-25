package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.UserDao;

@WebServlet(value="/deleteprofile")
public class DeleteUserProfileController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String stringId = req.getParameter("userId");
		int id = Integer.parseInt(stringId);
		
		UserDao.deleteUser(id);
		
		resp.sendRedirect("home.jsp");
	}
	

}
