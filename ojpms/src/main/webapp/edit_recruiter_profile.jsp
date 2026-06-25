<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Job</title>

<link rel="stylesheet" href="assests/base.css">
<link rel="stylesheet" href="assests/edit_job.css">
<link rel="stylesheet" href="assests/home.css">

</head>

<body>

<jsp:include page="navbar.jsp"/>

<%
	if(session.getAttribute("user")==null)
		response.sendRedirect("login.jsp");
%>

<div class="form-container">

	<h1>Edit Profile</h1>

	<form action="udpaterecruiterprofile" method="post">

		<input type="hidden" name="id" value="${user.id}">

		<label>User Name</label>
		<input type="text" name="name" value="${user.name}" required>

		<label>Email</label>
		<textarea name="email" rows="5" required>${user.email}</textarea>

		<label>Password</label>
		<input type="password" name="password" value="${user.password}" required>

		<input type="submit" value="Edit Profile">

	</form>

</div>

</body>
</html>