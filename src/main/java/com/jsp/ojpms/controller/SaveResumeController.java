package com.jsp.ojpms.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.jsp.ojpms.dao.JobSeekerProfileDao;
import com.jsp.ojpms.entity.JobSeekerProfile;
import com.jsp.ojpms.entity.User;

@WebServlet("/saveresume")
@MultipartConfig
public class SaveResumeController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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

		Part resumePart = req.getPart("resume");

		if (resumePart == null || resumePart.getSize() == 0) {
			session.setAttribute("error", "Please select a resume file");
			resp.sendRedirect("profile?id=" + user.getId());
			return;
		}

		String fileName = "resume_" + user.getId() + ".pdf";

		// CHANGED: Dynamic upload path inside project
		String uploadPath = getServletContext().getRealPath("/Resumes");

		File uploadDir = new File(uploadPath);

		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		String filePath = uploadPath + File.separator + fileName;

		resumePart.write(filePath);

		// CHANGED: Dynamic path stored in database
		String dbPath = "Resumes/" + fileName;

		JobSeekerProfile profile = JobSeekerProfileDao.getProfileByUserId(user.getId());

		if (profile != null) {
			profile.setResumePath(dbPath);
			JobSeekerProfileDao.updateProfile(profile);
		}

		session.setAttribute("success", "Resume uploaded successfully");

		resp.sendRedirect("profile?id=" + user.getId());
	}
}