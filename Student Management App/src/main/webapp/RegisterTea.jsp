<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .welcome-window {
        	align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .login-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-container button:hover {
            background-color: #0056b3;
        }
        .login-container p {
            text-align: center;
            margin-top: 10px;
        }
        .login-container a {
            color: #007bff;
            text-decoration: none;
        }
        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
	
	
    <div class="login-container">
        <h1>Register</h1>
        <form action="RegisterTeacher" method="POST">
            <label for="username">Name</label>
            <input type="text" id="username" name="name" placeholder="Enter your name" required>
            
            <label for="ID">Id</label>
            <input type="text" id="password" name="Id" placeholder="Enter your Id"  required>
            
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>