<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Page</title>
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
        h2 a{
            text-decoration: none ;
            color: #4285f4;
        }
        h2 a:hover{
            color: aqua ;
           
        }

        .course-content {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .announcement-container {
            margin-bottom: 20px;
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

        .forum {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
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
        <h1>Course Page</h1>
    </header>

    <nav>
        <a href="teacherdashboard.jsp"><i class="fas fa-chevron-left"></i> Back to Dashboard</a>
    </nav>

    <section>
        <div class="course-content">
            <h2>Course Materials</h2>
            <!-- Display course materials here -->
        </div>

        <div class="course-content">
            <h2>Announcements</h2>
            <div class="announcement-container" id="announcementsSection">
                <!-- Announcements will be dynamically added here using JavaScript -->
            </div>
        </div>
    </section>

    <footer>
        &copy; 2024 Course Page
    </footer>

    <script>
        // Function to display class announcements on the course page
        function displayClassAnnouncements() {
            var announcementsSection = document.getElementById('announcementsSection');
            announcementsSection.innerHTML = ''; // Clear existing content

            var enrolledStudents = getEnrolledStudents(); // Retrieve enrolled students

            enrolledStudents.forEach(studentId => {
                var studentAnnouncementsKey = `announcements_${studentId}`;
                var studentAnnouncements = JSON.parse(localStorage.getItem(studentAnnouncementsKey)) || [];

                studentAnnouncements.forEach(announcement => {
                    var announcementContainer = document.createElement('div');
                    announcementContainer.classList.add('announcement-container');

                    var announcementElement = document.createElement('div');
                    announcementElement.classList.add('announcement');
                    announcementElement.textContent = announcement;

                    announcementContainer.appendChild(announcementElement);
                    announcementsSection.appendChild(announcementContainer);
                });
            });
        }
        displayClassAnnouncements();
        function getEnrolledStudents() {
            return [1, 2, 3]; 
        }
    </script>

</body>
</html>
