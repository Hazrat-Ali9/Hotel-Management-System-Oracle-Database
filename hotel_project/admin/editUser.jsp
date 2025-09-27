<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User - Admin</title>
    <style>
        body { font-family: Arial,sans-serif; margin:0; padding:0; background:#ecf0f1; }
        .container { max-width:500px; margin:50px auto; background:white; padding:20px; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.2);}
        input, select { width:100%; padding:10px; margin:10px 0; border-radius:5px; border:1px solid #ccc;}
        button { padding:10px 20px; background:#27ae60; color:white; border:none; border-radius:5px; cursor:pointer;}
        button:hover { background:#2ecc71; }
        a { text-decoration:none; color:#2980b9; }
    </style>
</head>
<body>
<div class="container">
<%
String userIdStr = request.getParameter("id");

if(userIdStr == null || userIdStr.trim().equals("")) {
    out.println("<p>No user selected. <a href='manageUsers.jsp'>Go back</a></p>");
} else {

    int userId = Integer.parseInt(userIdStr);
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String username = "", email = "", role = "";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");

        if("POST".equalsIgnoreCase(request.getMethod())) {
            // Update user
            String newUsername = request.getParameter("username");
            String newEmail = request.getParameter("email");
            String newRole = request.getParameter("user_role");

            ps = conn.prepareStatement("UPDATE Users SET username=?, email=?, user_role=? WHERE user_id=?");
            ps.setString(1, newUsername);
            ps.setString(2, newEmail);
            ps.setString(3, newRole);
            ps.setInt(4, userId);

            int updated = ps.executeUpdate();
            if(updated > 0) {
                out.println("<p>User updated successfully. <a href='manageUsers.jsp'>Back to Manage Users</a></p>");
            } else {
                out.println("<p>Update failed. <a href='manageUsers.jsp'>Back</a></p>");
            }
        } else {
            // Fetch user data
            ps = conn.prepareStatement("SELECT username, email, user_role FROM Users WHERE user_id=?");
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            if(rs.next()) {
                username = rs.getString("username");
                email = rs.getString("email");
                role = rs.getString("user_role");
            } else {
                out.println("<p>User not found. <a href='manageUsers.jsp'>Back</a></p>");
            }
        }

    } catch(Exception e) {
        out.println("<p>Error: "+e.getMessage()+"</p>");
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(ps != null) ps.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }

    // Only show form if user exists
    if(username != null && !username.equals("")) {
%>
<form method="post">
    <label>Username:</label>
    <input type="text" name="username" value="<%=username%>" required>

    <label>Email:</label>
    <input type="email" name="email" value="<%=email%>" required>

    <label>Role:</label>
    <select name="user_role">
        <option value="admin" <%= "admin".equals(role) ? "selected" : "" %>>Admin</option>
        <option value="user" <%= "user".equals(role) ? "selected" : "" %>>User</option>
    </select>

    <button type="submit">Update User</button>
</form>
<%
    } // end if username exists
} // end else for userIdStr null check
%>
</div>
</body>
</html>
