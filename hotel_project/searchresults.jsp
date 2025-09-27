<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results - Hotel Management System</title>
    <style>
        body{font-family:Arial,sans-serif;margin:0;padding:0;background:#f4f4f9;}
        header{background:#2c3e50;color:white;padding:15px;text-align:center;}
        nav{background:#34495e;padding:10px;text-align:center;}
        nav a{color:white;text-decoration:none;margin:0 15px;font-weight:bold;}
        nav a:hover{color:#f1c40f;}
        .search-form{margin:20px auto;text-align:center;}
        .search-form input[type="text"]{width:300px;padding:8px;border-radius:5px;border:1px solid #ccc;}
        .search-form button{padding:8px 15px;border:none;background:#27ae60;color:white;border-radius:5px;cursor:pointer;}
        .search-form button:hover{background:#2ecc71;}
        .rooms-container{max-width:1000px;margin:30px auto;display:flex;flex-wrap:wrap;gap:20px;justify-content:center;}
        .room-card{background:white;padding:15px;border-radius:8px;box-shadow:0 2px 8px rgba(0,0,0,0.2);width:300px;text-align:center;}
        .room-card img{width:100%;height:200px;border-radius:8px;}
        .room-card h3{margin:10px 0;}
        .room-card p{font-size:16px;color:#555;}
        .room-card a{display:inline-block;margin-top:10px;padding:10px 15px;background:#27ae60;color:white;text-decoration:none;border-radius:5px;}
        .room-card a:hover{background:#2ecc71;}
        footer{background:#2c3e50;color:white;text-align:center;padding:10px;margin-top:20px;}
    </style>
</head>
<body>

<header>
    <h1>Hotel Management System</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="rooms.jsp">Rooms</a>
    <a href="facilities.jsp">Facilities</a>
    <a href="about.jsp">About</a>
    <a href="contact.jsp">Contact</a>
</nav>

<div class="search-form">
    <form action="searchresults.jsp" method="get">
        <input type="text" name="keyword" placeholder="Search rooms..." required>
        <button type="submit">Search</button>
    </form>
</div>

<div class="rooms-container">
<%
    String keyword = request.getParameter("keyword");
    if(keyword == null || keyword.trim().equals("")){
        out.println("<p style='text-align:center;'>Please enter a keyword to search.</p>");
    } else {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");

            // Make sure column names match your database
            ps = conn.prepareStatement(
                "SELECT * FROM Rooms WHERE LOWER(room_name) LIKE ? OR LOWER(room_type) LIKE ?"
            );
            ps.setString(1, "%" + keyword.toLowerCase() + "%");
            ps.setString(2, "%" + keyword.toLowerCase() + "%");

            rs = ps.executeQuery();

            while(rs.next()){
%>
    <div class="room-card">
        <img src="<%=rs.getString("image")%>" alt="<%=rs.getString("room_name")%>">
        <h3><%=rs.getString("room_name")%></h3>
        <p>Type: <%=rs.getString("room_type")%></p>
        <p>Price: ₹<%=rs.getInt("price")%></p>
        <a href="room.jsp?room_id=<%=rs.getInt("room_id")%>">View Details</a>
    </div>
<%
            }
        } catch(Exception e){
            out.println("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally{
            try{if(rs!=null) rs.close();}catch(Exception e){}
            try{if(ps!=null) ps.close();}catch(Exception e){}
            try{if(conn!=null) conn.close();}catch(Exception e){}
        }
    }
%>
</div>

<footer>
    <p>&copy; 2025 Hotel Management System. All Rights Reserved.</p>
</footer>

</body>
</html>
