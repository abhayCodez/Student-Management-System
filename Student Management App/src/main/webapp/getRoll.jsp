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
    <title>Student Details</title>
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
            background: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Enter Roll Number to Get Student Details</h2>
        <form method="post">
            <input type="text" name="rollno" placeholder="Enter Roll Number" required>
            <button type="submit">Get Details</button>
        </form>
        <hr>

        <% 
            String roll = request.getParameter("rollno");

            if (roll != null && !roll.isEmpty()) {
                String jdbcUrl = "jdbc:mysql://localhost:3306/sms";
                String dbUser = "root";
                String dbPassword = "Divyabhay@54";

                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    // Load MySQL JDBC Driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection
                    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                    // Use WHERE clause to fetch only relevant student
                    String query = "SELECT * FROM student WHERE rollno = ?";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, roll);
                    rs = ps.executeQuery();

                    if (rs.next()) {
        %>
                        <h3>Student Details:</h3>
                        <p><strong>Name:</strong> <%= rs.getString("name") %></p>
                        <p><strong>Email:</strong> <%= rs.getString("email") %></p>
                        <p><strong>Phone:</strong> <%= rs.getString("phone") %></p>
        <%
                    } else {
                        out.println("<p style='color:red;'>No student found with Roll No: " + roll + "</p>");
                    }
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    // Close resources
                    if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                    if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
                }
            }
        %>
    </div>

</body>
</html>
