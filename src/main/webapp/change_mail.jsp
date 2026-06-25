<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Change Email</title>

<link rel="stylesheet" href="assests/base.css">
<link rel="stylesheet" href="assests/home.css">
<link rel="stylesheet" href="assests/reset.css">



</head>

<body>

<!-- SIDEBAR -->
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

    <h1>Change Email</h1>

    <p class="form-subtitle">

        Enter your new email address.

    </p>

    <form action="changeemail"
          method="post">

        <label>Current Email</label>

        <input type="email"
               value="${sessionScope.user.email}"
               readonly>

        <label>New Email</label>

        <input type="email"
               name="newEmail"
               required>

        <input type="submit"
               value="Send OTP">

    </form>

    <p class="error">${error}</p>

</div>

</body>

</html>