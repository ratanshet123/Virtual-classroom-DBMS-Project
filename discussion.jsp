<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discussion Forum</title>
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

        .discussion-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            width: 70%;
            margin: 0 auto;
        }

        .message {
            border: 1px solid #ddd;
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 8px;
        }

        .message .user-info {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .reply-form {
            margin-top: 20px;
        }

        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
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
        <h1>Discussion Forum</h1>
    </header>

    <nav>
        <a href="dashboard.jsp"><i class="fas fa-chevron-left"></i> Back to Dashboard</a>
    </nav>

    <section>
        <div class="discussion-container">
            <h2>Course: Mathematics</h2>

            <div class="message">
                <div class="user-info">John Doe</div>
                <p>This is the initial post in the discussion forum. Feel free to reply and share your thoughts!</p>
            </div>

            <div class="message">
                <div class="user-info">Jane Smith</div>
                <p>I agree with John. Let's discuss more about the course material and upcoming assignments.</p>
                <div class="reply-form">
                    <textarea placeholder="Type your reply here..." rows="4"></textarea>
                    <button type="button">Reply</button>
                </div>
            </div>

            <!-- Add more messages and replies as needed -->

            <div class="reply-form">
                <textarea placeholder="Type your message here..." rows="4"></textarea>
                <button type="button">Post Message</button>
            </div>
        </div>
    </section>

    <footer>
        &copy; 2024 Discussion Forum
    </footer>
</body>
</html>
