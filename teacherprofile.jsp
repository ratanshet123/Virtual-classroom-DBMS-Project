<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            background-color: #4285f4;
            color: #fff;
            padding: 15px;
            text-align: center;
        }

        nav {
            background-color: #333;
            padding: 10px;
            text-align: center;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 10px;
            margin: 0 10px;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #4285f4;
        }

        section {
            padding: 20px;
        }

        h2 {
            color: #4285f4;
        }

        .profile-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            width: 50%;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: larger;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .profile-picture {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .profile-picture img {
            border-radius: 50%;
            margin-right: 15px;
        }

        .change-password-form {
            margin-top: 20px;
        }

        .password-info {
            margin-bottom: 10px;
        }

        button {
            background-color: #4285f4;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #356bcd;
        }

        footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <h1>User Profile</h1>
    </header>

    <nav>
        <a href="teacherdashboard.jsp"><i class="fas fa-chevron-left"></i> Back to Dashboard</a>
    </nav>

    <section>
        <div class="profile-container">
            <h2>Teacher Profile</h2>

            <div class="profile-picture">
                <img id="profile-picture-preview" src="" alt="Profile Picture" width="80" height="80">
                <div>
                    <label for="profile-picture">Change Profile Picture:</label>
                    <input type="file" id="profile-picture" name="profile-picture" accept="image/*" onchange="previewProfilePicture()">
                </div>
            </div>
            <label for="full-name">Full Name:</label>
            <input type="text" id="full-name" name="full-name" value="John Doe" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="john.doe@example.com" required>

            <div class="change-password-form">
                <h2>Change Password</h2>

               

                <label for="current-password">Current Password:</label>
                <input type="password" id="current-password" name="current-password">

                <label for="new-password">New Password:</label>
                <input type="password" id="new-password" name="new-password">

                <label for="confirm-password">Confirm New Password:</label>
                <input type="password" id="confirm-password" name="confirm-password">

                <button type="button" onclick="profileUpdate()">Save Changes</button>
            </div>
        </div>
    </section>

    <footer>
        &copy; 2024 User Profile
    </footer>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var storedProfilePicture = localStorage.getItem('profilePicture');
            var preview = document.getElementById('profile-picture-preview');

            if (storedProfilePicture) {
                preview.src = storedProfilePicture;
            }
        });

        function previewProfilePicture() {
            var input = document.getElementById('profile-picture');
            var preview = document.getElementById('profile-picture-preview');

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    preview.src = e.target.result;

                    // Save profile picture to localStorage
                    localStorage.setItem('profilePicture', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        function profileUpdate() {
            alert("Profile updated and Password changed successfully!");
        }
    </script>
</body>
</html>
