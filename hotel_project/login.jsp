<%@ page import="java.sql.*" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Login - Hotel Management System</title>
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

                p.error {
                    color: red;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h2>Login</h2>
                <form method="post">
                    <input type="text" name="username" placeholder="Username" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <button type="submit">Login</button>
                </form>
                <% if(request.getMethod().equalsIgnoreCase("POST")){ String username=request.getParameter("username");
                    String password=request.getParameter("password"); Connection conn=null; PreparedStatement pst=null;
                    ResultSet rs=null; try{ Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");
                    pst=conn.prepareStatement("SELECT * FROM Users WHERE username=? AND password=?"); pst.setString(1,
                    username); pst.setString(2, password); rs=pst.executeQuery(); if(rs.next()){
                    session.setAttribute("username", username); response.sendRedirect("myaccount.jsp"); }else{
                    out.println("<p class='error'>Invalid username or password</p>");
                    }
                    }catch(Exception e){ out.println("<p class='error'>Error: "+e.getMessage()+"</p>"); }
                    finally{ try{if(rs!=null) rs.close();}catch(Exception e){}
                    try{if(pst!=null)pst.close();}catch(Exception e){} try{if(conn!=null)conn.close();}catch(Exception
                    e){} }
                    }
                    %>
            </div>
        </body>

        </html>