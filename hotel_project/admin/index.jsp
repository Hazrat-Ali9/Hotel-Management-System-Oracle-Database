<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #ecf0f1;
            margin: 0;
            padding: 0;
        }

        header {
            background: #34495e;
            color: white;
            padding: 20px;
            text-align: center;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }

        nav a:hover {
            color: #f1c40f;
        }

        .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
    </style>
</head>

<body>
    <header>
        <h1>Admin Dashboard</h1>
        <nav>
            <a href="rooms.jsp">Manage Rooms</a>
            <a href="users.jsp">Manage Users</a>
            <a href="bookings.jsp">View Bookings</a>
            <a href="reviews.jsp">View Reviews</a>
            <a href="contactDashboard.jsp">Contact Messages</a> <!-- New Link -->
            <a href="logout.jsp">Logout</a> <!-- or Shutdown -->
        </nav>
    </header>
    <div class="container">
        <h2 style="color: black;">Welcome, Admin!</h2>
        <p>Select an option from the navigation bar to manage the system.</p>
    </div>
</body>

</html>
