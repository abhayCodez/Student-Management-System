<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Your Marks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            width: 350px;
            background: white;
            padding: 20px;
            margin: 50px auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #28a745;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background: #218838;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Please confirm Your Marks</h2>
        <form method="post">
            Roll No: <input type="text" name="rollno" required>
            <button type="submit">Get Marks</button>
        </form>
    </div>

    <hr>

    <%
        // Get roll number from form input
        String rollnoStr = request.getParameter("rollno");

        if (rollnoStr != null && !rollnoStr.isEmpty()) {
            // Sanitize table name (Replace any special characters with "_")
            String tableName = "BCA" + rollnoStr.replaceAll("[^a-zA-Z0-9]", "_");

            // Database connection details
            String jdbcUrl = "jdbc:mysql://localhost:3306/sms?useSSL=false&allowPublicKeyRetrieval=true";
            String dbUser = "root";
            String dbPassword = "Divyabhay@54";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                // SQL Query to fetch student marks from the dynamically created table
                String sql = "SELECT * FROM " + tableName;
                pstmt = conn.prepareStatement(sql);

                // Execute query
                rs = pstmt.executeQuery();

                // Display marks if the table exists
                if (rs.next()) {
    %>
                    <div class="container">
                        <h3>Marks for Roll No: <%= rollnoStr %></h3>
                        <p><strong>Software Engineering:</strong> <%= rs.getInt("Software_Engineering") %></p>
                        <p><strong>Computer Architecture:</strong> <%= rs.getInt("Computer_Architecture") %></p>
                        <p><strong>Java:</strong> <%= rs.getInt("Java") %></p>
                        <p><strong>Accounts:</strong> <%= rs.getInt("Accounts") %></p>
                        <p><strong>Python:</strong> <%= rs.getInt("Python") %></p>
                    </div>
    <%
                } else {
                    out.println("<p style='color:red;'>No marks found for Roll No: " + rollnoStr + "</p>");
                }
            } catch (SQLException e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
        }
    %>

</body>
</html>
