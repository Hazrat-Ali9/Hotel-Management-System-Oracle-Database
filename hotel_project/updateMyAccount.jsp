<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Update My Account - Hotel Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #ecf0f1;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #34495e;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #2ecc71;
        }

        p.message {
            color: green;
        }

        p.error {
            color: red;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: #34495e;
        }

        a:hover {
            color: #2ecc71;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Update Account</h2>

        <%
            // Session check
            if(session == null || session.getAttribute("username") == null){
                response.sendRedirect("login.jsp");
                return;
            }

            String usernameSession = (String) session.getAttribute("username");
            String message = "";
            String error = "";

            String currentUsername = "";
            String currentEmail = "";
            String currentPassword = "";

            Connection conn = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");

                // Load current user info first
                pst = conn.prepareStatement("SELECT username, email, password FROM users WHERE username=?");
                pst.setString(1, usernameSession);
                rs = pst.executeQuery();
                if(rs.next()){
                    currentUsername = rs.getString("username");
                    currentEmail = rs.getString("email");
                    currentPassword = rs.getString("password");
                }
                if(rs != null) { rs.close(); pst.close(); }

                // Form submit
                if(request.getMethod().equalsIgnoreCase("POST")){
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");

                    // Fix for ORA-01407: if password blank, keep old password
                    if(password == null || password.trim().isEmpty()){
                        password = currentPassword;
                    }

                    pst = conn.prepareStatement("UPDATE users SET username=?, email=?, password=? WHERE username=?");
                    pst.setString(1, username);
                    pst.setString(2, email);
                    pst.setString(3, password);
                    pst.setString(4, usernameSession);

                    int rows = pst.executeUpdate();
                    if(rows > 0){
                        message = "Account updated successfully!";
                        session.setAttribute("username", username); // update session
                        currentUsername = username;
                        currentEmail = email;
                        currentPassword = password;
                    } else {
                        error = "Update failed!";
                    }
                }

            } catch(Exception e){
                error = "Error: " + e.getMessage();
            } finally {
                try { if(rs != null) rs.close(); } catch(Exception e){}
                try { if(pst != null) pst.close(); } catch(Exception e){}
                try { if(conn != null) conn.close(); } catch(Exception e){}
            }
        %>

        <p class="message"><%= message %></p>
        <p class="error"><%= error %></p>

        <form method="post">
            <input type="text" name="username" value="<%= currentUsername %>" placeholder="Username" required>
            <input type="email" name="email" value="<%= currentEmail %>" placeholder="Email" required>
            <input type="password" name="password" value="<%= currentPassword %>" placeholder="Password" required>
            <button type="submit">Update</button>
        </form>

        <a href="logout.jsp">Logout</a>
    </div>
</body>

</html>
