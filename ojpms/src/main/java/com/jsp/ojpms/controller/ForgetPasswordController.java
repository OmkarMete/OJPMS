package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.UserDao;

@WebServlet(value = "/reset")
public class ForgetPasswordController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    String email = req.getParameter("email");
	    String password = req.getParameter("password");
	    String confirmPassword = req.getParameter("confirmPassword");

	    // Check password match first
	    if(!password.equals(confirmPassword))
	    {
	        req.setAttribute("error", "Password and Confirm Password do not match");

	        req.getRequestDispatcher("reset.jsp").forward(req, resp);

	        return;
	    }

	    if(UserDao.updatePassword(email, password))
	    {
	        req.setAttribute("success", "Password reset successfully");
	        req.getRequestDispatcher("login.jsp").forward(req, resp);
	    }
	    else
	    {
	        req.setAttribute("error","Email not found");
	        req.getRequestDispatcher("reset.jsp").forward(req, resp);
	    }
	}
}
