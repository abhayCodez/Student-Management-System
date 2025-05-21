<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student E.R.P</title>
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
            width: 300px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Welcome to Student E.R.P</h2>
        <p>Check your marks by clicking the button below:</p>
        <a href="CheckMarks.jsp" class="btn">Check Your Marks</a>
    </div>

</body>
</html>
    