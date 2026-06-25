package com.jsp.ojpms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.JobSeekerProfileDao;
import com.jsp.ojpms.entity.JobSeekerProfile;
import com.jsp.ojpms.entity.User;

@WebServlet("/viewresume")
public class ViewResumeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		if (user == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		JobSeekerProfile profile = JobSeekerProfileDao.getProfileByUserId(user.getId());

		if (profile == null || profile.getResumePath() == null) {
			resp.getWriter().println("Resume not found");
			return;
		}

		String path = getServletContext().getRealPath("/") + profile.getResumePath();

		File file = new File(path);

		if (!file.exists()) {
			resp.getWriter().println("Resume file not found");
			return;
		}

		resp.setContentType("application/pdf");
		resp.setHeader("Content-Disposition", "inline; filename=" + file.getName());

		FileInputStream fis = new FileInputStream(file);
		OutputStream os = resp.getOutputStream();

		byte[] buffer = new byte[4096];
		int bytesRead;

		while ((bytesRead = fis.read(buffer)) != -1) {
			os.write(buffer, 0, bytesRead);
		}

		fis.close();
		os.close();
	}
}