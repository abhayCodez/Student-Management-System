<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
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
        <h2>Student Registration</h2>
        <form action="StudentRegistration" method="POST">
            <input type="text" name="name" placeholder="Enter Name" required>
            <input type="text" name="rollno" placeholder="Enter Roll No" required>
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="tel" name="phone" placeholder="Enter Phone Number" required>
            <button type="submit">Register</button>
        </form>
    </div>

</body>
</html>
    