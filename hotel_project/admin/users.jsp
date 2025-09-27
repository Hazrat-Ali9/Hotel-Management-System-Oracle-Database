<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Users</title>
    <style>
        body { font-family: Arial, sans-serif; margin:0; padding:0; background:#ecf0f1; }
        table { width:100%; border-collapse: collapse; margin-top:20px; }
        th, td { border:1px solid #ccc; padding:10px; text-align:center; }
        th { background:#2c3e50; color:white; }
        a { text-decoration: none; color: #2980b9; }
        a:hover { text-decoration: underline; }
        td.error { color: red; }
        p.message { color: green; font-weight: bold; text-align:center; }
    </style>
</head>
<body>
<h2>Manage Users</h2>

<%
    // Show message if any (from deleteUser.jsp)
    String msg = request.getParameter("msg");
    if(msg != null){
%>
<p class="message"><%= msg %></p>
<%
    }
%>

<table>
<tr>
    <th>User ID</th>
    <th>Username</th>
    <th>Email</th>
    <th>Role</th>
    <th>Actions</th>
</tr>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "a12345");
    stmt = conn.createStatement();

    rs = stmt.executeQuery("SELECT user_id, username, email, user_role FROM Users");

    while(rs.next()) {
        int userId = rs.getInt("user_id");
        String username = rs.getString("username");
        String email = rs.getString("email");
        String role = rs.getString("user_role");
%>
<tr>
    <td><%= userId %></td>
    <td><%= username %></td>
    <td><%= email %></td>
    <td><%= role %></td>
    <td>
        <a href="editUser.jsp?id=<%= userId %>">Edit</a> | 
        <a href="deleteUser.jsp?id=<%= userId %>" onclick="return confirm('Are you sure?')">Delete</a>
    </td>
</tr>
<%
    }
} catch(Exception e) {
%>
<tr>
    <td colspan="5" class="error">Error: <%= e.getMessage() %></td>
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
