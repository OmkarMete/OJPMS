package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicationDao;
import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.util.EmailUtil;

@WebServlet("/updateApplicationStatus")
public class UpdateApplicationStatusController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            int applicationId = Integer.parseInt(
                    req.getParameter("applicationId"));

            String status = req.getParameter("status");

            Application application =
                    ApplicationDao.getApplicationById(applicationId);

            if (application != null) {

                application.setStatus(status);

                ApplicationDao.updateApplication(application);

                String email = application.getUser().getEmail();
                String name = application.getUser().getName();
                String jobTitle = application.getJob().getTitle();

                String subject = "";
                String message = "";

                if ("SELECTED".equals(status)) {

                    subject = "Application Selected";

                    message =
                            "Dear " + name + ",\n\n" +
                            "Congratulations!\n\n" +
                            "Your application for the position '" +
                            jobTitle +
                            "' has been selected by the recruiter.\n\n" +
                            "You may be contacted soon for the next stage of the recruitment process.\n\n" +
                            "Best Regards,\n" +
                            "SmartHire Portal";

                } else if ("REJECTED".equals(status)) {

                    subject = "Application Status Update";

                    message =
                            "Dear " + name + ",\n\n" +
                            "Thank you for applying for the position '" +
                            jobTitle +
                            "'.\n\n" +
                            "We regret to inform you that your application was not selected for this opportunity.\n\n" +
                            "We appreciate your interest and wish you success in your future career.\n\n" +
                            "Best Regards,\n" +
                            "SmartHire Portal";
                }

                EmailUtil.sendEmail(email, subject, message);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("viewapplicants");
    }
}