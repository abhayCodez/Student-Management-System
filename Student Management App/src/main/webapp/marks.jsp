<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Marks</title>
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
        <h2>Enter Roll number</h2>
        <form action="giveMarks" method="POST">
            <input type="text" name="roll" placeholder="Enter Roll Number" required>
                    <h2>Enter Marks for 5 Subjects</h2>
            <input type="number" name="soft" placeholder="Marks for Software Engineering" required min="0" max="100">
            <input type="number" name="comp" placeholder="Marks for Computer Architecture" required min="0" max="100">
            <input type="number" name="java" placeholder="Marks for Java" required min="0" max="100">
            <input type="number" name="acc" placeholder="Marks for Accounts" required min="0" max="100">
            <input type="number" name="py" placeholder="Marks for Python" required min="0" max="100">
            <button type="submit">Submit</button>
        </form>
    </div>

</body>
</html>
