<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Virtual Classroom</title>
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
    background: url(https://images.unsplash.com/photo-1580582932707-520aed937b7b?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D) ; 
    
}

        form {
            background: linear-gradient( rgba(17, 234, 57, 0.7), rgba(8, 5, 197, 0.6));
            position: relative;
            margin: auto;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
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
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .login-link {
            margin-top: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form action="SignUpServlet" method="post">
        <h2>Sign Up</h2>
        <label for="userType">User Type:</label>
        <select id="userType" name="userType" required>
            <option value="student">Student</option>
            <option value="teacher">Teacher</option>
        </select><br><br>


        <label for="newUsername">Username:</label>
        <input type="text" id="newUsername" name="newUsername" required>

        <label for="newPassword">Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" required>

        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" required>
        
         <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>


        <button type="submit">Sign Up</button>

        
  </form>


            
 </body>
 </html>

        
