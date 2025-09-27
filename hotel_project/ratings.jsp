<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ratings - Hotel Management System</title>
    <style>
        body { font-family: Arial,sans-serif; margin:0; padding:0; background:#ecf0f1; }
        header { background:#34495e; color:white; padding:20px; text-align:center; }
        table { width:100%; border-collapse:collapse; margin-top:20px; }
        th, td { border:1px solid #ccc; padding:10px; text-align:center; }
        th { background:#2c3e50; color:white; }
        .container { max-width:900px; margin:20px auto; padding:20px; background:white; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.2); }
    </style>
</head>
<body>
<header>
    <h1>Ratings</h1>
</header>
<div class="container">
    <table>
        <tr>
            <th>Username</th>
            <th>Room</th>
            <th>Rating</th>
            <th>Date</th>
        </tr>
        <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");

            String query = "SELECT u.username, r.room_name, rev.rating, rev.review_date " +
                           "FROM Reviews rev " +
                           "JOIN Users u ON rev.user_id = u.user_id " +
                           "JOIN Rooms r ON rev.room_id = r.room_id";

            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("room_name") %></td>
            <td><%= rs.getInt("rating") %></td>
            <td><%= rs.getDate("review_date") %></td>
        </tr>
        <%
            }
        } catch(Exception e){
            out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e){}
            try { if(stmt != null) stmt.close(); } catch(Exception e){}
            try { if(conn != null) conn.close(); } catch(Exception e){}
        }
        %>
    </table>
</div>
</body>
</html>
