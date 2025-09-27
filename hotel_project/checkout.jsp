<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout - Hotel Management System</title>
    <style>
        body{font-family:Arial,sans-serif;background:#ecf0f1;margin:0;padding:0;}
        .container{width:500px;margin:50px auto;padding:20px;background:white;border-radius:8px;box-shadow:0 2px 8px rgba(0,0,0,0.2);}
        input, select{width:100%;padding:10px;margin:10px 0;border-radius:5px;border:1px solid #ccc;}
        button{padding:10px 20px;background:#34495e;color:white;border:none;border-radius:5px;cursor:pointer;}
        button:hover{background:#2ecc71;}
        p.success{color:green;}
    </style>
</head>
<body>
<div class="container">
<h2>Checkout</h2>
<%
String roomId = request.getParameter("room_id");
String username = (String)session.getAttribute("username");
if(username==null){ response.sendRedirect("login.jsp"); }
if(request.getMethod().equalsIgnoreCase("POST")){
    String checkin=request.getParameter("checkin");
    String checkout=request.getParameter("checkout");
    Connection conn=null;
    PreparedStatement pst=null;
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");
        // get user_id
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery("SELECT user_id FROM Users WHERE username='"+username+"'");
        int user_id=0;
        if(rs.next()){ user_id=rs.getInt("user_id"); }
        pst=conn.prepareStatement("INSERT INTO Bookings(booking_id,user_id,room_id,check_in,check_out) VALUES(Bookings_seq.NEXTVAL,?,?,TO_DATE(?,'YYYY-MM-DD'),TO_DATE(?,'YYYY-MM-DD'))");
        pst.setInt(1,user_id);
        pst.setInt(2,Integer.parseInt(roomId));
        pst.setString(3,checkin);
        pst.setString(4,checkout);
        int i=pst.executeUpdate();
        if(i>0){ out.println("<p class='success'>Booking successful!</p>"); }
    }catch(Exception e){ out.println("<p>Error: "+e.getMessage()+"</p>"); }
    finally{ try{if(pst!=null)pst.close();}catch(Exception e){} try{if(conn!=null)conn.close();}catch(Exception e){} }
}
%>
<form method="post">
    <label>Check-in Date</label>
    <input type="date" name="checkin" required>
    <label>Check-out Date</label>
    <input type="date" name="checkout" required>
    <button type="submit">Book Now</button>
</form>
</div>
</body>
</html>
