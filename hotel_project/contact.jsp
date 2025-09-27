<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact - Hotel Management System</title>
    <style>
        body{font-family:Arial,sans-serif;margin:0;padding:0;background:#ecf0f1;}
        header{background:#34495e;color:white;padding:20px;text-align:center;}
        nav{background:#2c3e50;padding:10px;text-align:center;}
        nav a{color:white;text-decoration:none;margin:0 15px;font-weight:bold;}
        nav a:hover{color:#f1c40f;}
        .container{max-width:800px;margin:20px auto;padding:20px;background:white;border-radius:8px;box-shadow:0 2px 8px rgba(0,0,0,0.2);}
        input, textarea{width:100%;padding:10px;margin:10px 0;border-radius:5px;border:1px solid #ccc;}
        button{padding:10px 20px;background:#34495e;color:white;border:none;border-radius:5px;cursor:pointer;}
        button:hover{background:#2ecc71;}
    </style>
</head>
<body>
<header>
    <h1>Contact Us</h1>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="rooms.jsp">Rooms</a>
        <a href="facilities.jsp">Facilities</a>
        <a href="about.jsp">About</a>
        <a href="contact.jsp">Contact</a>
        <a href="login.jsp">Login</a>
        <a href="signup.jsp">Sign Up</a>
    </nav>
</header>
<div class="container">
    <h2>Get in Touch</h2>
    <form method="post">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
        <button type="submit">Send Message</button>
    </form>
    <%
        if(request.getMethod().equalsIgnoreCase("POST")){
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String message=request.getParameter("message");
            out.println("<p>Thank you, "+name+". Your message has been received.</p>");
            // Optionally insert into DB table "ContactMessages"
        }
    %>
</div>
</body>
</html>
