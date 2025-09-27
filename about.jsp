<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About Us - THA Hotel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin:0;
            padding:0;
            background:#f4f4f9;
            display:flex;
            flex-direction:column;
            min-height:100vh;
        }
        header {
            background:#2c3e50;
            color:white;
            padding:15px;
            text-align:center;
        }
        nav {
            background:#34495e;
            padding:10px;
            text-align:center;
        }
        nav a {
            color:white;
            text-decoration:none;
            margin:0 15px;
            font-weight:bold;
        }
        nav a:hover {
            color:#f1c40f;
        }

        /* Card style for content */
        .container, .map-card {
            max-width:900px;
            margin:30px auto;
            padding:25px 30px;
            background: linear-gradient(135deg, #ffffff, #eaf0f8);
            border-radius:12px;
            box-shadow:0 4px 15px rgba(0,0,0,0.1);
            line-height:1.7;
            color:#333;
        }
        .container h2, .map-card h2 {
            text-align:center;
            margin-bottom:20px;
            color:#2c3e50;
            font-size:28px;
            font-weight:600;
        }
        .container p {
            font-size:17px;
            margin-bottom:15px;
        }

        .map-card iframe {
            width:100%;
            height:350px;
            border:0;
            border-radius:8px;
        }

        /* Footer */
        footer { 
            background:#2c3e50; 
            color:white; 
            padding:30px 20px; 
            text-align:center; 
            margin-top:auto;
        }
        .footer-content { 
            max-width:1200px; 
            margin:0 auto; 
            display:flex; 
            flex-wrap:wrap; 
            justify-content:space-between; 
        }
        .footer-column { 
            flex:1 1 250px; 
            margin:10px; 
            text-align:left; 
        }
        .footer-column h3 { 
            margin-bottom:10px; 
            color:#f1c40f; 
        }
        .footer-column a { 
            color:white; 
            text-decoration:none; 
            display:block; 
            margin:5px 0; 
        }
        .footer-column a:hover { 
            color:#f1c40f; 
        }
        .social-icons a {
            display:inline-flex; 
            align-items:center; 
            justify-content:center; 
            width:45px; 
            height:45px; 
            margin:5px; 
            background:#34495e; 
            border-radius:50%; 
            color:white; 
            font-size:20px; 
            transition: all 0.3s ease; 
            text-decoration:none;
        }
        .social-icons a:hover { 
            background:#f1c40f; 
            color:#34495e; 
            transform:scale(1.2); 
        }

        /* Responsive */
        @media screen and (max-width:768px){
            .container, .map-card{
                width:95%;
                margin:20px auto;
            }
            .footer-content{
                flex-direction:column; 
                text-align:center; 
            }
            .footer-column{ flex:1 1 100%; margin:10px 0; }
        }
    </style>
</head>
<body>

<header>
    <h1>About THA Hotel</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="rooms.jsp">Rooms</a>
    <a href="facilities.jsp">Facilities</a>
    <a href="about.jsp">About</a>
    <a href="contact.jsp">Contact</a>
</nav>

<!-- Our Story Card -->
<div class="container">
    <h2>Our Story</h2>
    <p>Welcome to THA Hotel, your premier destination for luxury stays and exceptional hospitality. We offer a wide range of services to ensure a comfortable and memorable experience for all our guests.</p>
    <p>Our goal is to make your stay enjoyable, convenient, and unforgettable. From modern amenities to personalized services, our hotel strives to meet all your needs, whether you are traveling for business or leisure.</p>
    <p>Book with us today and experience excellence in every aspect of your stay at our Mohakhali location in Dhaka.</p>
</div>

<!-- Location Card -->
<div class="map-card">
    <h2>Our Location</h2>
    <iframe 
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3651.9875144823927!2d90.38777241543305!3d23.78063568459339!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8bf3e80f3ad%3A0xc77ff6c013d7f728!2sMohakhali%2C%20Dhaka!5e0!3m2!1sen!2sbd!4v1695432020000!5m2!1sen!2sbd" 
        allowfullscreen="" 
        loading="lazy" 
        referrerpolicy="no-referrer-when-downgrade">
    </iframe>
</div>

<!-- Footer -->
<footer>
    <div class="footer-content">
        <div class="footer-column">
            <h3>Quick Links</h3>
            <a href="index.jsp">Home</a>
            <a href="rooms.jsp">Rooms</a>
            <a href="facilities.jsp">Facilities</a>
            <a href="about.jsp">About</a>
            <a href="contact.jsp">Contact</a>
        </div>
        <div class="footer-column">
            <h3>Contact Info</h3>
            <p>Email: info@hotel.com</p>
            <p>Phone: +880123456789</p>
            <p>Address: Dhaka, Bangladesh</p>
        </div>
        <div class="footer-column">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a href="#" target="_blank" title="Instagram"><i class="fab fa-instagram"></i></a>
                <a href="#" target="_blank" title="TikTok"><i class="fab fa-tiktok"></i></a>
                <a href="#" target="_blank" title="YouTube"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
    <p style="margin-top:20px;">
        &copy; 2025 THA Hotel. All Rights Reserved. | 
        Emergency Contact: <a href="tel:+880123456789" style="color:white;">+880123456789</a>
    </p>
</footer>

</body>
</html>
