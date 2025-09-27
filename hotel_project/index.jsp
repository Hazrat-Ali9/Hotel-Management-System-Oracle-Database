<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>THA Hotel - Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body { font-family: Arial, sans-serif; margin:0; padding:0; background:#ecf0f1; display:flex; flex-direction:column; min-height:100vh; }
        header { background:#34495e; color:white; padding:20px; text-align:center; }
        nav { background:#2c3e50; padding:10px; text-align:center; }
        nav a { color:white; text-decoration:none; margin:0 15px; font-weight:bold; }
        nav a:hover { color:#f1c40f; }

        .container { max-width:1200px; margin:20px auto; padding:20px; background:white; border-radius:8px; flex:1; display:flex; flex-wrap:wrap; justify-content:space-between; gap:20px; }

        .room-card {
            background:#fafafa;
            border-radius:8px;
            box-shadow:0 2px 6px rgba(0,0,0,0.15);
            flex:1 1 calc(30% - 20px); /* 3 per row */
            max-width:350px;
            text-align:center;
            transition: transform 0.3s;
            display:flex;
            flex-direction:column;
        }
        .room-card:hover { transform: scale(1.05); }
        .room-card img { width:100%; height:220px; border-radius:8px; object-fit:cover; }
        .room-card h3 { margin:10px 0; color:#2c3e50; }
        .room-card p { margin:5px 0; }
        .room-card a { margin-top:auto; display:inline-block; margin-bottom:15px; text-decoration:none; color:#fff; background:#34495e; padding:8px 15px; border-radius:5px; }
        .room-card a:hover { background:#f1c40f; }

        /* Responsive */
        @media(max-width:1024px){ .room-card { flex:1 1 calc(48% - 20px); } }
        @media(max-width:768px){ .room-card { flex:1 1 100%; } }

        /* Search Bar */
        .search-footer { background:#2c3e50; padding:15px; text-align:center; margin-top:20px; }
        .search-footer input[type="text"] { width:250px; padding:8px; border-radius:5px; border:none; }
        .search-footer button { padding:8px 15px; border:none; background:#27ae60; color:white; border-radius:5px; cursor:pointer; }
        .search-footer button:hover { background:#2ecc71; }

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

        @media(max-width:768px){ .footer-content{ flex-direction:column; text-align:center; } .footer-column{ flex:1 1 100%; margin:10px 0; } }
    </style>
</head>
<body>

<header>
    <h1>Welcome to THA Hotel</h1>
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
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");
            stmt = conn.createStatement();

            rs = stmt.executeQuery("SELECT * FROM Rooms ORDER BY room_id");
            while(rs.next()){
    %>
        <div class="room-card">
            <img src="images/<%= rs.getString("image") %>" alt="<%= rs.getString("room_name") %>">
            <h3><%= rs.getString("room_name") %></h3>
            <p>Type: <%= rs.getString("room_type") %></p>
            <p>Price: ₹<%= rs.getInt("price") %></p>
            <a href="room.jsp?room_id=<%= rs.getInt("room_id") %>">View Details</a>
        </div>
    <%
            }
        } catch(Exception e){
            out.println("<p style='color:red;text-align:center;'>Error: "+e.getMessage()+"</p>");
        } finally {
            try{ if(rs!=null) rs.close(); } catch(Exception e){}
            try{ if(stmt!=null) stmt.close(); } catch(Exception e){}
            try{ if(conn!=null) conn.close(); } catch(Exception e){}
        }
    %>
</div>

<div class="search-footer">
    <form action="searchresults.jsp" method="get">
        <input type="text" name="keyword" placeholder="Search rooms..." required>
        <button type="submit">Search</button>
    </form>
</div>

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
