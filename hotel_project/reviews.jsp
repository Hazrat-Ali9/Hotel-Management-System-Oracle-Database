<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reviews - Hotel Management System</title>
    <style>
        body{font-family:Arial,sans-serif;margin:0;padding:0;background:#ecf0f1;}
        header{background:#34495e;color:white;padding:20px;text-align:center;}
        .review{background:white;padding:10px;margin:10px;border-radius:5px;box-shadow:0 1px 4px rgba(0,0,0,0.2);}
        .review h4{margin:0;}
        .review p{margin:5px 0;}
    </style>
</head>
<body>
<header>
    <h1>Reviews</h1>
</header>
<div class="container">
<%
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");
    stmt=conn.createStatement();
    String query="SELECT u.username,r.room_name,rev.review,rev.rating_date FROM Ratings rev " +
                 "JOIN Users u ON rev.user_id=u.user_id " +
                 "JOIN Rooms r ON rev.room_id=r.room_id";
    rs=stmt.executeQuery(query);
    while(rs.next()){
%>
<div class="review">
    <h4><%=rs.getString("username")%> - <%=rs.getString("room_name")%></h4>
    <p>Review: <%=rs.getString("review")%></p>
    <p>Date: <%=rs.getDate("rating_date")%></p>
</div>
<%
    }
}catch(Exception e){ out.println("<p>Error: "+e.getMessage()+"</p>"); }
finally{ try{if(rs!=null)rs.close();}catch(Exception e){} try{if(stmt!=null)stmt.close();}catch(Exception e){} try{if(conn!=null)conn.close();}catch(Exception e){} }
%>
</div>
</body>
</html>
