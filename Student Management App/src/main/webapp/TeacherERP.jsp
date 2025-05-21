<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher E.R.P</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin-top: 100px;
        }
        .container {
            background: white;
            padding: 30px;
            width: 350px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        .btn {
            display: block;
            padding: 12px;
            background: #007bff;
            color: white;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
            transition: 0.3s;
            margin: 10px 0;
        }
        .btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Welcome to Teacher E.R.P</h2>
        <p>Manage student records efficiently:</p>

        <a href="RegisterStd.jsp" class="btn">📌 Register New Students</a>
        <a href="getRoll.jsp" class="btn">📌 View Student Details</a>
        <a href="marks.jsp" class="btn">📌 Assign Marks</a>
    </div>

</body>
</html>
