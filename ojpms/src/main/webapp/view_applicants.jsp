<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>View Applicants</title>

<link rel="stylesheet" href="assests/base.css">
<link rel="stylesheet" href="assests/navbar.css">
<link rel="stylesheet" href="assests/view_applicants.css">
<link rel="stylesheet" href="assests/home.css">

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="page-header">

    <h1>Applicants Dashboard</h1>

    <p>
        Review and manage candidates who applied to your job postings.
    </p>

</div>

<div class="jobs-container">

<c:choose>

    <c:when test="${not empty applications}">

        <c:forEach var="app" items="${applications}">

            <div class="job-card">

                <h3>${app.job.title}</h3>

                <p>
                    👤 <b>Applicant:</b> ${app.user.name}
                </p>

                <p>
                    📧 <b>Email:</b> ${app.user.email}
                </p>

                <p>
                    📍 <b>Location:</b> ${app.job.location}
                </p>

                <!-- Status Display -->
                <c:choose>

                    <c:when test="${app.status == 'APPLIED'}">
                        <span class="status status-applied">
                            📄 Applied
                        </span>
                    </c:when>

                    <c:when test="${app.status == 'SELECTED'}">
                        <span class="status status-selected">
                            ✅ Selected
                        </span>
                    </c:when>

                    <c:when test="${app.status == 'REJECTED'}">
                        <span class="status status-rejected">
                            ❌ Rejected
                        </span>
                    </c:when>

                    <c:otherwise>
                        <span class="status">
                            ${app.status}
                        </span>
                    </c:otherwise>

                </c:choose>

                <br><br>

                <!-- Accept / Reject Buttons -->
                <c:if test="${app.status == 'APPLIED'}">

                    <a href="updateApplicationStatus?applicationId=${app.id}&status=SELECTED"
                       onclick="return confirm('Accept this applicant?')"
                       style="background:#28a745;
                              color:white;
                              padding:10px 20px;
                              text-decoration:none;
                              border-radius:5px;
                              margin-right:10px;
                              font-weight:bold;">
                        Accept
                    </a>

                    <a href="updateApplicationStatus?applicationId=${app.id}&status=REJECTED"
                       onclick="return confirm('Reject this applicant?')"
                       style="background:#dc3545;
                              color:white;
                              padding:10px 20px;
                              text-decoration:none;
                              border-radius:5px;
                              font-weight:bold;">
                        Reject
                    </a>

                </c:if>

            </div>

        </c:forEach>

    </c:when>

    <c:otherwise>

        <div class="job-card">

            <h3>No Applicants Found</h3>

            <p>No candidates have applied to your jobs yet.</p>

        </div>

    </c:otherwise>

</c:choose>

</div>

</body>
</html>