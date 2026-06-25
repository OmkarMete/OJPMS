<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>OJPMS - User Dashboard</title>

<link rel="stylesheet" href="assests/base.css">
<link rel="stylesheet" href="assests/user_dashboard.css">
<link rel="stylesheet" href="assests/home.css">

</head>

<body>

<%
	if(session.getAttribute("user")==null)
		response.sendRedirect("login.jsp");
%>

<div class="sidebar">

	<h2>RecruitEase</h2>

	<a href="home.jsp">🏠 Home</a>
	<a href="viewjob">💼 Jobs</a>
	<a href="register.jsp">📝 Register</a>
	<a href="login.jsp">🔑 Login</a>
	<a href="#">📄 Applications</a>
	<a href="editjobseekerprofile?userId=${user.id}">👤 Profile</a>

</div>

<jsp:include page="navbar.jsp" />

<div class="dashboard">

	<!-- Top Banner Section -->
	<div class="top-section">

		<div class="welcome-section">

			<h1>Welcome Back, ${user.name}</h1>

			<p>
				Manage your profile, explore opportunities,
				and track your job applications from one place.
			</p>

		</div>

		

	</div>

	

	<!-- Quick Actions -->
	<div class="quick-actions">

		<h2>Quick Actions</h2>

		<div class="quick-actions-links">

			<a href="viewjob">
				💼 View Jobs
			</a>

			<a href="editjobseekerprofile?userId=${user.id}">
				👤 Update Profile
			</a>

			<a href="uploadresume">
				📋 Upload Resume
			</a>

			<a href="myapplications">
				📄 My Applications
			</a>

		</div>

	</div>

	<!-- Main Content Grid -->
	<div class="dashboard-grid">

		<!-- Recommended Jobs -->
		<div class="recommended-jobs">

			<h2>Recommended Jobs</h2>

			<ul>

				<li>
					Java Developer - Pune
				</li>

				<li>
					Full Stack Developer - Mumbai
				</li>

				<li>
					Data Analyst - Bangalore
				</li>

			</ul>

		</div>

		<!-- Recent Activity -->
		<div class="recent-activity">

			<h2>Recent Activity</h2>

			<ul>

				<li>
					No recent activity available.
				</li>

			</ul>

		</div>

		<!-- Resume Status -->
		<div class="resume-status">

			<h2>Resume Status</h2>

			<p>
				No resume uploaded yet.
			</p>

		</div>

		<!-- Notifications -->
		<div class="notifications">

			<h2>Notifications</h2>

			<ul>

				<li>
					No new notifications.
				</li>

			</ul>

		</div>

	</div>

	<!-- Bottom Full Width Section -->
	<div class="career-tips">

		<h2>Career Tips</h2>

		<ul>

			<li>
				Keep your resume updated.
			</li>

			<li>
				Apply to jobs regularly.
			</li>

			<li>
				Add relevant skills to your profile.
			</li>

			<li>
				Customize your resume for every job application.
			</li>

			<li>
				Build a strong LinkedIn profile.
			</li>

		</ul>

	</div>

</div>

</body>
</html>