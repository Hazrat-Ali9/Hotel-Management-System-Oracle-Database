<%@ page import="java.sql.*" %>
<%
    String userId = request.getParameter("id");
    String message = "";

    if(userId != null){
        Connection conn = null;
        PreparedStatement pst = null;

        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");

            pst = conn.prepareStatement("DELETE FROM Users WHERE user_id=?");
            pst.setInt(1, Integer.parseInt(userId));

            int rows = pst.executeUpdate();
            if(rows > 0){
                message = "User deleted successfully!";
            } else {
                message = "User not found!";
            }

        } catch(Exception e){
            message = "Error: " + e.getMessage();
        } finally {
            try{ if(pst != null) pst.close(); } catch(Exception e){}
            try{ if(conn != null) conn.close(); } catch(Exception e){}
        }
    }

    // Redirect back to users.jsp with message
    response.sendRedirect("users.jsp?msg=" + java.net.URLEncoder.encode(message,"UTF-8"));
%>
