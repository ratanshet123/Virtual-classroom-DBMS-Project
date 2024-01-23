<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Virtual Classroom</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f4f4f4;
            background: url(https://images.unsplash.com/photo-1497864149936-d3163f0c0f4b?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
        }

        form {
            background: linear-gradient( rgba(17, 212, 234, 0.7), rgba(197, 5, 108, 0.6)); /* Added gradient background */
            padding: 30px; /* Increased the size of the form */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px; /* Increased the width of the form */
            text-align: center;
            margin-right: 20px; /* Added margin to the right */
            height: 60vh; /* Increased the height of the form */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            left: 200px;
            right:10px;
        }

        h1 {
            font-size: 2em;
            color: #ffffff;
            margin-bottom: 20px;
            text-align: left;
        }

        .room{
            position: relative;
            left: 150px;
            right: 0;
            bottom: 40px;
            font-family: cursive;
            font-size: 6cap;
            background: linear-gradient(to right, #038cf5, #09f97d); /* Added gradient color to the text */
            -webkit-background-clip: text;
            color: transparent;
           
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: larger;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #1c30e4;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .signup-link {
            margin-top: 15px;
            font-size: 14px;
            color: #f3f4f1; /* Updated color of the signup link */
        }
        .signup-link a {
            color: #ffffff; /* Updated color of the signup link */
            text-decoration: underline; /* Added underline to the signup link */
        }
        .signup-link a:hover {
            color: #2e1f1f; /* Updated hover color of the signup link */
        }
       
    </style>
</head>
<body>
    <h1 class="room">Virtual Classroom</h1>
    <form action="LoginServlet " method="post" onsubmit="return loginUser()">
        
        <h2>Login</h2>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Login</button>

        <p class="signup-link">Don't have an account? <a href="signup.jsp">Sign up</a></p>
    </form>
   
</body>
</html>
