<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Bookings</title>
    <style>
        body{font-family:Arial,sans-serif;margin:0;padding:0;background:#ecf0f1;}
        table{width:100%;border-collapse:collapse;margin-top:20px;}
        th, td{border:1px solid #ccc;padding:10px;text-align:center;}
        th{background:#2c3e50;color:white;}
    </style>
</head>
<body>
<h2>All Bookings</h2>
<table>
<tr>
    <th>Booking ID</th>
    <th>Username</th>
    <th>Room</th>
    <th>Check-in</th>
    <th>Check-out</th>
</tr>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "a12345");
    stmt = conn.createStatement();
    rs = stmt.executeQuery(
        "SELECT b.booking_id, u.username, r.room_name, b.check_in, b.check_out " +
        "FROM Bookings b " +
        "JOIN Users u ON b.user_id = u.user_id " +
        "JOIN Rooms r ON b.room_id = r.room_id"
    );

    while(rs.next()) {
%>
<tr>
    <td><%= rs.getInt("booking_id") %></td>
    <td><%= rs.getString("username") %></td>
    <td><%= rs.getString("room_name") %></td>
    <td><%= rs.getDate("check_in") %></td>
    <td><%= rs.getDate("check_out") %></td>
</tr>
<%
    }
} catch(Exception e) {
%>
<tr>
    <td colspan="5" style="color:red;">Error: <%= e.getMessage() %></td>
</tr>
<%
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e) {}
    try { if(stmt != null) stmt.close(); } catch(Exception e) {}
    try { if(conn != null) conn.close(); } catch(Exception e) {}
}
%>
</table>
</body>
</html>
