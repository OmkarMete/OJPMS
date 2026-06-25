<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecruitEase - Online Job Portal</title>

<link rel="stylesheet" href="assests/base.css">
<link rel="stylesheet" href="assests/navbar.css">
<link rel="stylesheet" href="assests/home.css">
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.4/dist/aos.css">
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

<!-- HERO SECTION -->
<section class="hero">

    <div class="container hero-grid">

        <!-- LEFT SIDE -->
        <div class="hero-left">

            <div class="hero-text">

                <h1>Welcome to <span>RecruitEase</span> </h1>

                <p>
                    Connect with top recruiters and explore thousands of
                    opportunities across India with RecruitEase.
                </p>

                
                

            </div>

            <!-- EXTRA INFO BLOCK -->
            <div class="hero-info">

                <div class="info-card">🚀 Fast Hiring Process</div>
                <div class="info-card">🔒 Secure Applications</div>
                <div class="info-card">📈 Career Growth Support</div>

            </div>

        </div>

        <!-- RIGHT SIDE (TRENDING JOBS) -->
        <div class="hero-right">

            <h2>🔥 Trending Jobs</h2>

            <div class="trending-grid">

                <div class="mini-card">
                    <h4>Java Developer</h4>
                    <p>Pune | Full Time</p>
                </div>

                <div class="mini-card">
                    <h4>Full Stack Developer</h4>
                    <p>Mumbai | Full Time</p>
                </div>

                <div class="mini-card">
                    <h4>Data Analyst</h4>
                    <p>Bangalore | Hybrid</p>
                </div>

            </div>

        </div>

    </div>

</section>

<!-- STATS -->
<section class="stats">

    <div class="container grid-4">

        <div class="card" data-aos="zoom-in">
            <h2>1000+</h2>
            <p>Jobs Available</p>
        </div>

        <div class="card" data-aos="zoom-in">
            <h2>250+</h2>
            <p>Recruiters</p>
        </div>

        <div class="card" data-aos="zoom-in">
            <h2>5000+</h2>
            <p>Candidates</p>
        </div>

        <div class="card" data-aos="zoom-in">
            <h2>800+</h2>
            <p>Placements</p>
        </div>

    </div>

</section>

<!-- FEATURED JOBS -->
<section class="featured">

    <div class="container">

        <h2>Featured Jobs</h2>

        <div class="grid-3">

            <div class="job-card" data-aos="fade-up">
                <h3>Java Developer</h3>
                <p>Pune | Full Time</p>
            </div>

            <div class="job-card" data-aos="fade-up">
                <h3>Full Stack Developer</h3>
                <p>Mumbai | Full Time</p>
            </div>

            <div class="job-card" data-aos="fade-up">
                <h3>Data Analyst</h3>
                <p>Bangalore | Hybrid</p>
            </div>

        </div>

    </div>

</section>

<!-- WHY SECTION -->
<section class="why">

    <div class="container">

        <h2>Why Choose RecruitEase?</h2>

        <div class="grid-3">

            <div class="job-card" data-aos="zoom-in">
                <h3>✔ Verified Jobs</h3>
                <p>All recruiters are verified.</p>
            </div>

            <div class="job-card" data-aos="zoom-in">
                <h3>⚡ Fast Apply</h3>
                <p>Apply in one click.</p>
            </div>

            <div class="job-card" data-aos="zoom-in">
                <h3>🔒 Secure Data</h3>
                <p>Your data is always protected.</p>
            </div>

        </div>

    </div>

</section>

<!-- FOOTER -->
<footer class="footer">

    <div class="container">

        <h3>RecruitEase</h3>
        <p>Connecting talent with opportunity.</p>

        <p>© 2026 RecruitEase. All Rights Reserved.</p>

    </div>

</footer>

<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>

<script>
AOS.init({
    duration:800,
    once:true
});
</script>

</body>
</html>