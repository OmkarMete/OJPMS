<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@ page isELIgnored="false"%>

<html>
<head>
<meta charset="UTF-8">
<title>OJPMS - Post Job</title>
<link rel="stylesheet" href="assests/base.css">
<link rel="stylesheet" href="assests/post_job.css">
<link rel="stylesheet" href="assests/home.css">
</head>

<body>
<div class="sidebar">

    <h2>RecruitEase</h2>

    <a href="home.jsp">🏠 Home</a>
    <a href="viewjob">💼 Jobs</a>
    <a href="register.jsp">📝 Register</a>
    <a href="login.jsp">🔑 Login</a>
    <a href="#">📄 Applications</a>
    <a href="#">👤 Profile</a>

</div>
```
<jsp:include page="navbar.jsp" />

<%
	if(session.getAttribute("user")==null)
		response.sendRedirect("login.jsp");
%>

<div class="form-container">

	<!-- Page Heading -->
	<div class="page-header">

		<h1>Post New Job</h1>

		<p>
			Create a new job opportunity and connect with talented
			candidates through OJPMS.
		</p>

	</div>

	<!-- Job Posting Form -->
	<form action="postjob" method="post">

		<label>Job Title</label>
		<input type="text"
			   name="title"
			   placeholder="e.g. Java Developer"
			   required>

		<label>Job Description</label>
		<textarea name="description"
				  rows="6"
				  placeholder="Describe responsibilities, requirements and expectations"
				  required></textarea>

		<label>Location</label>
		<input type="text"
			   name="location"
			   placeholder="e.g. Pune, Maharashtra"
			   required>

		<label>Salary</label>
		<input type="number"
			   name="salary"
			   placeholder="Enter Salary"
			   required>

		<input type="submit" value="Post Job">

	</form>

	

	<!-- Quick Navigation -->
	<div class="quick-links">

		<a href="recruiter_dashboard.jsp">
			← Back to Dashboard
		</a>

	</div>

</div>
```

</body>
</html>
