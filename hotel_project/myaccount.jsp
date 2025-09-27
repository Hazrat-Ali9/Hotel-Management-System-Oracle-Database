<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Account - Hotel Management System</title>
    <style>
        body{font-family:Arial,sans-serif;margin:0;padding:0;background:#ecf0f1;}
        header{background:#34495e;color:white;padding:20px;text-align:center;}
        nav{background:#2c3e50;padding:10px;text-align:center;}
        nav a{color:white;text-decoration:none;margin:0 15px;font-weight:bold;}
        nav a:hover{color:#f1c40f;}
        .container{max-width:800px;margin:20px auto;padding:20px;background:white;border-radius:8px;box-shadow:0 2px 8px rgba(0,0,0,0.2);}
        input{width:100%;padding:10px;margin:10px 0;border-radius:5px;border:1px solid #ccc;}
        button{padding:10px 20px;background:#27ae60;color:white;border:none;border-radius:5px;cursor:pointer;}
        button:hover{background:#2ecc71;}
    </style>
</head>
<body>
<header>
    <h1>My Account</h1>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="rooms.jsp">Rooms</a>
        <a href="bookings.jsp">Bookings</a>
        <a href="reviews.jsp">Reviews</a>
        <a href="ratings.jsp">Ratings</a>
        <a href="searchresults.jsp">Search</a>
        <a href="logout.jsp">Logout</a>
    </nav>
</header>

<div class="container">
<%
    // Session থেকে username নাও
    String username = (String) session.getAttribute("username");
    if(username == null){
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");

        // শুধু session username এর data select করো
        pst = conn.prepareStatement("SELECT * FROM Users WHERE username=?");
        pst.setString(1, username);
        rs = pst.executeQuery();

        if(rs.next()){
%>
    <h2>Welcome, <%= rs.getString("username") %></h2>

    <form method="post" action="updateMyAccount.jsp">
        <label>Username:</label>
        <input type="text" name="username" value="<%= rs.getString("username") %>" readonly>

        <label>Email:</label>
        <input type="email" name="email" value="<%= rs.getString("email") %>" required>

        <button type="submit">Update Info</button>
    </form>
<%
        } else {
            out.println("<p>User data not found!</p>");
        }
    } catch(Exception e){
        out.println("<p>Error: "+e.getMessage()+"</p>");
    } finally {
        try{if(rs!=null) rs.close();}catch(Exception e){}
        try{if(pst!=null) pst.close();}catch(Exception e){}
        try{if(conn!=null) conn.close();}catch(Exception e){}
    }
%>
</div>
</body>
</html>
