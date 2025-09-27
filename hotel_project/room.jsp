<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Room Details</title>
    <style>
        body{font-family:Arial,sans-serif;margin:0;padding:0;background:#ecf0f1;}
        header{background:#34495e;color:white;padding:20px;text-align:center;}
        nav{background:#2c3e50;padding:10px;text-align:center;}
        nav a{color:white;text-decoration:none;margin:0 15px;font-weight:bold;}
        nav a:hover{color:#f1c40f;}
        .container{max-width:800px;margin:20px auto;padding:20px;background:white;border-radius:8px;box-shadow:0 2px 8px rgba(0,0,0,0.2);}
        img{width:100%;height:400px;border-radius:5px;}
        .details{padding:10px;}
    </style>
</head>
<body>
<header>
    <h1>Room Details</h1>
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
String roomId = request.getParameter("room_id");
if(roomId != null){
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");

        int rId = Integer.parseInt(roomId);
        ps = conn.prepareStatement("SELECT * FROM Rooms WHERE room_id=?");
        ps.setInt(1, rId);
        rs = ps.executeQuery();

        if(rs.next()){
%>
    <img src="images/<%=rs.getString("image")%>" alt="<%=rs.getString("room_name")%>">
    <div class="details">
        <h2><%=rs.getString("room_name")%></h2>
        <p>Type: <%=rs.getString("room_type")%></p>
        <p>Price: ₹<%=rs.getInt("price")%></p>
        <p><%=rs.getString("description")%></p>
        <a href="checkout.jsp?room_id=<%=rs.getInt("room_id")%>">Book Now</a>
    </div>
<%
        } else {
            out.println("<p>Room not found.</p>");
        }
    } catch(Exception e){
        out.println("<p style='color:red;'>Error: "+e.getMessage()+"</p>");
    } finally{
        try{if(rs!=null) rs.close();}catch(Exception e){}
        try{if(ps!=null) ps.close();}catch(Exception e){}
        try{if(conn!=null) conn.close();}catch(Exception e){}
    }
} else {
    out.println("<p>Invalid Room ID.</p>");
}
%>
</div>
</body>
</html>
