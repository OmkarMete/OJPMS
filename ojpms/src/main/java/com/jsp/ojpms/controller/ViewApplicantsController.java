package com.jsp.ojpms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.User;

@WebServlet("/viewapplicants")
public class ViewApplicantsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        User recruiter = null;

        if(session != null) {
            recruiter = (User) session.getAttribute("user");
        }

        if(recruiter == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        List<Application> applications =
                ApplicationDao.getApplicationsByRecruiter(recruiter.getId());

        req.setAttribute("applications", applications);

        req.getRequestDispatcher("view_applicants.jsp")
           .forward(req, resp);
    }
}