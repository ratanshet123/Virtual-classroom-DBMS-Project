<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Scheduling</title>
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

        .schedule-form {
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

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
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

        .announcement {
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s;
        }

        .announcement:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
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
        <h1>Class Scheduling</h1>
    </header>

    <nav>
        <a href="teacherhome.jsp"><i class="fas fa-chevron-left"></i> Back to Home</a>
       
    </nav>

    <section>
        <div class="schedule-form">
            <h2>Schedule a Virtual Class</h2>
            <form id="scheduleForm" method="post">
            
                <label for="course">Course:</label>
                <select id="course" name="course" required>
                    <option value="math">Mathematics</option>
                    <option value="science">Science</option>
                </select>

                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>

                <label for="time">Time:</label>
                <input type="time" id="time" name="time" required>

                <label for="meeting-link">Meeting Link:</label>
                <input type="text" id="meeting-link" name="meeting-link" placeholder="Enter virtual meeting link" required>

                <button type="button" onclick="scheduleClass()">Schedule Class</button>
            </form>
        </div>
    </section>

    <footer>
        &copy; 2024 Class Scheduling
    </footer>

    <script>
        function scheduleClass() {
            // Get form data
            var course = document.getElementById('course').value;
            var date = document.getElementById('date').value;
            var time = document.getElementById('time').value;
            var meetingLink = document.getElementById('meeting-link').value;

            // Simulate sending announcement to students
            var enrolledStudents = getEnrolledStudents(course);
            var announcement = `A new class for ${course} has been scheduled on ${date} at ${time}. Join using the following link: ${meetingLink}`;

            // Show a popup with the announcement
            alert(announcement);

            // Store announcement in local storage for each enrolled student
            enrolledStudents.forEach(studentId => {
                var studentAnnouncementsKey = `announcements_${studentId}`;
                var studentAnnouncements = JSON.parse(localStorage.getItem(studentAnnouncementsKey)) || [];
                studentAnnouncements.push(announcement);
                localStorage.setItem(studentAnnouncementsKey, JSON.stringify(studentAnnouncements));
            });

            // Redirect to the Course Page (optional)
            // window.location.href = 'course.html';
        }

        function getEnrolledStudents(course) {
            // In a real scenario, this information would be retrieved from a database
            // Here, we simulate that two students are enrolled for each course
            if (course === 'math') {
                return [1, 2]; // Student IDs
            } else if (course === 'science') {
                return [2, 3]; // Student IDs
            } else {
                return [];
            }
        }
    </script>
</body>
</html>
