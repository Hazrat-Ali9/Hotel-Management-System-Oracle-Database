<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Facilities - THA Hotel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body { font-family:Arial,sans-serif; margin:0; padding:0; background:#f4f4f9; display:flex; flex-direction:column; min-height:100vh; }
        header { background:#2c3e50; color:white; padding:15px; text-align:center; }
        nav { background:#34495e; padding:10px; text-align:center; }
        nav a { color:white; text-decoration:none; margin:0 15px; font-weight:bold; }
        nav a:hover { color:#f1c40f; }

        .content { max-width:1200px; margin:20px auto; padding:20px; background:white; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.2); flex:1; }
        h2{text-align:center;color:#2c3e50;margin-bottom:30px;}

        /* Facilities Grid */
        .facilities-grid {
            display:flex;
            flex-wrap:wrap;
            gap:20px;
            justify-content:center;
        }
        .facility-card {
            background:#fafafa;
            border-radius:10px;
            box-shadow:0 2px 6px rgba(0,0,0,0.15);
            padding:30px 20px;
            flex:1 1 calc(30% - 40px); /* 3 per row */
            max-width:300px;
            text-align:center;
            font-size:18px;
            transition: transform 0.3s;
        }
        .facility-card:hover { transform: scale(1.05); }
        .facility-card i { font-size:40px; margin-bottom:15px; color:#2c3e50; }

        /* Responsive */
        @media(max-width:1024px){ .facility-card { flex:1 1 calc(45% - 40px); } }
        @media(max-width:768px){ .facility-card { flex:1 1 100%; } }

        /* Footer */
        footer { background:#2c3e50; color:white; padding:30px 20px; text-align:center; }
        .footer-content { max-width:1200px; margin:0 auto; display:flex; flex-wrap:wrap; justify-content:space-between; }
        .footer-column { flex:1 1 250px; margin:10px; text-align:left; }
        .footer-column h3 { margin-bottom:10px; color:#f1c40f; }
        .footer-column a { color:white; text-decoration:none; display:block; margin:5px 0; }
        .footer-column a:hover { color:#f1c40f; }

        /* Social icons */
        .social-icons a {
            display:inline-flex; align-items:center; justify-content:center; width:45px; height:45px; margin:5px; background:#34495e; border-radius:50%; color:white; font-size:20px; transition: all 0.3s ease; text-decoration:none;
        }
        .social-icons a:hover { background:#f1c40f; color:#34495e; transform:scale(1.2); }

        /* Responsive footer */
        @media(max-width:768px){ .footer-content{ flex-direction:column; text-align:center; } .footer-column{ flex:1 1 100%; margin:10px 0; } }
    </style>
</head>
<body>

<header>
    <h1>Our Facilities</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="rooms.jsp">Rooms</a>
    <a href="facilities.jsp">Facilities</a>
    <a href="about.jsp">About</a>
    <a href="contact.jsp">Contact</a>
</nav>

<div class="content">
    <h2>Hotel Facilities</h2>
    <div class="facilities-grid">
        <div class="facility-card"><i class="fas fa-wifi"></i> Free Wi-Fi in all rooms</div>
        <div class="facility-card"><i class="fas fa-utensils"></i> Multi-cuisine Restaurant</div>
        <div class="facility-card"><i class="fas fa-swimmer"></i> Swimming Pool</div>
        <div class="facility-card"><i class="fas fa-dumbbell"></i> Gym & Fitness Center</div>
        <div class="facility-card"><i class="fas fa-parking"></i> Free Parking</div>
        <div class="facility-card"><i class="fas fa-spa"></i> Spa and Wellness Center</div>
        <div class="facility-card"><i class="fas fa-concierge-bell"></i> 24/7 Room Service</div>
    </div>
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
