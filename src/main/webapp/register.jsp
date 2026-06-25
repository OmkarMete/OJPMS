<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>OJPMS - Register</title>
<link rel="stylesheet" href="assests/register.css">
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

<jsp:include page="navbar.jsp"/>

<div class="form-container">

	<!-- Branding -->
	<div class="logo-section">
		<h2>OJPMS</h2>
		<p>Online Job Portal Management System</p>
	</div>

	<!-- Heading -->
	<h1>Create Your Account</h1>
	<p>
		Join OJPMS and connect with top recruiters and exciting career opportunities.
	</p>

	<!-- Registration Form -->
	<form action="register" method="post">

		<label>Full Name</label>
		<input type="text"
			   name="name"
			   placeholder="Enter Full Name"
			   required>

		<label>Email Address</label>
		<input type="email"
			   name="email"
			   placeholder="Enter Email Address"
			   required>

		<label>Password</label>
		<input type="password"
			   id="password"
			   name="password"
			   placeholder="Create Password"
			   required>

	
		<label>Register As</label>
		<select name="role" required>

			<option value="">
				Select Role
			</option>

			<option value="JOB_SEEKER">
				Job Seeker
			</option>

			<option value="RECRUITER">
				Recruiter
			</option>

		</select>

		<br><br>

		<input type="submit" value="Create Account">

	</form>

	

	<!-- Login Redirect -->
	<div class="login-link">

		<p>
			Already have an account?
			<a href="login.jsp">Login Here</a>
		</p>

	</div>

	<!-- Security Notice -->
	<div class="security-info">

		<p>
			🔒 Your information is securely stored and protected.
		</p>

	</div>

	<!-- Back Home -->
	<div class="back-home">

		<a href="home.jsp">
			← Back to Home
		</a>

	</div>

</div>


</body>
</html>
