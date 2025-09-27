<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Contact Messages</title>
    <style>
        body{font-family:Arial,sans-serif;background:#ecf0f1;padding:20px;}
        table{width:100%;border-collapse:collapse;background:white;box-shadow:0 2px 8px rgba(0,0,0,0.2);}
        th, td{border:1px solid #ccc;padding:10px;text-align:left;}
        th{background:#34495e;color:white;}
    </style>
</head>
<body>
<h2>Contact Messages</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Subject</th>
        <th>Message</th>
        <th>Date</th>
    </tr>
<%
    Connection conn=null;
    Statement st=null;
    ResultSet rs=null;

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","a12345");

        st = conn.createStatement();
        rs = st.executeQuery("SELECT contact_id, name, email, subject, message, contact_date FROM Contact ORDER BY contact_date DESC");

        while(rs.next()){
%>
    <tr>
        <td><%= rs.getInt("contact_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("subject") %></td>
        <td><%= rs.getString("message") %></td>
        <td><%= rs.getDate("contact_date") %></td>
    </tr>
<%
        }
    }catch(Exception e){
%>
    <tr><td colspan="6" style="color:red;">Error: <%= e.getMessage() %></td></tr>
<%
    }finally{
        try{ if(rs!=null) rs.close(); }catch(Exception e){}
        try{ if(st!=null) st.close(); }catch(Exception e){}
        try{ if(conn!=null) conn.close(); }catch(Exception e){}
    }
%>
</table>
</body>
</html>
