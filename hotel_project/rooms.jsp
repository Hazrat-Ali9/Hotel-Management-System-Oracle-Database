<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rooms - Hotel Management System</title>
    <!-- Font Awesome CDN for social media icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body{
            font-family:Arial,sans-serif;
            margin:0;
            padding:0;
            background:#ecf0f1;
            display:flex;
            flex-direction:column;
            min-height:100vh;
        }
        header{
            background:#34495e;
            color:white;
            padding:20px;
            text-align:center;
        }
        nav{
            background:#2c3e50;
            padding:10px;
            text-align:center;
        }
        nav a{
            color:white;
            text-decoration:none;
            margin:0 15px;
            font-weight:bold;
        }
        nav a:hover{color:#f1c40f;}

        .container{
            max-width:1200px;
            margin:20px auto;
            padding:20px;
            background:white;
            border-radius:8px;
            box-shadow:0 2px 8px rgba(0,0,0,0.2);
            flex:1;
        }

        .room-list{
            display:flex;
            flex-wrap:wrap;
            justify-content:space-between;
        }

        .room-card{
            flex:1 1 calc(30% - 20px);
            margin:10px;
            padding:10px;
            background:#fafafa;
            border-radius:5px;
            text-align:center;
            box-shadow:0 1px 4px rgba(0,0,0,0.2);
            transition:transform 0.2s;
        }
        .room-card:hover{
            transform:scale(1.05);
        }

        .room-card img{
            width:100%;
            height:200px;
            border-radius:5px;
            object-fit:cover;
        }

        /* ---------- Responsive Design ---------- */
        @media (max-width:1024px){
            .room-card{
                flex:1 1 calc(48% - 20px);
            }
        }
        @media (max-width:768px){
            .room-card{
                flex:1 1 100%;
            }
        }

        /* ---------- Footer Style ---------- */
        footer{
            background:#2c3e50;
            color:white;
            padding:30px 20px;
            text-align:center;
        }
        .footer-container{
            max-width:1200px;
            margin:0 auto;
            display:flex;
            flex-wrap:wrap;
            justify-content:space-between;
            text-align:left;
        }
        .footer-column{
            flex:1 1 250px;
            margin:10px;
        }
        .footer-column h3{
            margin-bottom:10px;
            color:#f1c40f;
        }
        .footer-column a{
            color:white;
            text-decoration:none;
            display:block;
            margin:5px 0;
        }
        .footer-column a:hover{
            color:#f1c40f;
        }
        .social-icons a{
            margin:0 10px;
            font-size:24px;
            color:white;
            text-decoration:none;
        }
        .social-icons a:hover{
            color:#f1c40f;
        }
        .copyright{
            margin-top:20px;
            font-size:14px;
            color:#bbb;
            text-align:center;
        }
    </style>
</head>
<body>
<header>
    <h1>Rooms</h1>
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
    <h2>Available Rooms</h2>
    <div class="room-list">
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
            <img src="images/<%=rs.getString("image")%>" alt="<%=rs.getString("room_name")%>">
            <h3><%=rs.getString("room_name")%></h3>
            <p>Type: <%=rs.getString("room_type")%></p>
            <p>Price: ₹<%=rs.getInt("price")%></p>
            <p><%=rs.getString("description")%></p>
            <a href="room.jsp?room_id=<%=rs.getInt("room_id")%>">View Details</a>
        </div>
    <%
        }
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: "+e.getMessage()+"</p>");
    } finally {
        try{ if(rs!=null) rs.close(); } catch(Exception e){}
        try{ if(stmt!=null) stmt.close(); } catch(Exception e){}
        try{ if(conn!=null) conn.close(); } catch(Exception e){}
    }
    %>
    </div>
</div>

<!-- Footer Section -->
<footer>
    <div class="footer-container">
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
            <p>Phone: +880 1234 567890</p>
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
    <div class="copyright">
        &copy; 2025 Hotel Management System | All Rights Reserved
    </div>
</footer>
</body>
</html>
