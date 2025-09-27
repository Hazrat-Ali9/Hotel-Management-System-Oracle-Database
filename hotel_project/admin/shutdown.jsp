<%@ page import="java.sql.*" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Admin - Shutdown System</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #ecf0f1;
                margin: 0;
                padding: 0;
                text-align: center;
            }

            .container {
                margin-top: 100px;
            }

            button {
                padding: 15px 30px;
                background: #e74c3c;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            button:hover {
                background: #c0392b;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h2>Shutdown System</h2>
            <form method="post">
                <button type="submit">Shutdown</button>
            </form>
            <% if(request.getMethod().equalsIgnoreCase("POST")){ out.println("<p>System shutdown initiated!</p>");
                // Optionally you can trigger server shutdown script here
                }
                %>
        </div>
    </body>

    </html>