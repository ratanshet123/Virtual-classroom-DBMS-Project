<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Virtual Classroom</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, rgba(234, 233, 233, 0.8), rgba(27, 121, 65, 0.685));

            display: flex;
            flex-direction: column;
            min-height: 100vh;
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
            flex: 1;
        }

        h2 {
            color: #4285f4;
        }

        p {
            line-height: 1.6;
        }

        .features {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
            flex-wrap: wrap; /* Allow items to wrap to the next line */
        }

        .feature {
            text-align: center;
            max-width: 200px;
            margin: 20px;
            flex: 1; /* Equal width for all features */
        }

        .feature i {
            font-size: 2em;
            color: #4285f4;
        }

        .feature img {
            max-width: 100%;
            border-radius: 8px;
            margin-top: 15px;
        }

        footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <header>
        <h1>Virtual Classroom</h1>
    </header>

    <nav>
        <a href="teacherhome.jsp"><i class="fas fa-home"></i> Home</a>
       
        <a href="schedule.jsp"><i class="fas fa-graduation-cap"></i> Scheduler</a>
        <a href="teacherdashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="teacherprofile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </nav>

    <section>
        <h2>Welcome to Virtual Classroom</h2>
        <p>
            Explore a world of knowledge and opportunities with Virtual Classroom. Engage in a diverse range of courses,
            connect with educators, and enhance your learning experience.
        </p>
        <p>
            <strong>Key Features:</strong>
        </p>

        <div class="features">
            <div class="feature">
                <i class="fas fa-book"></i>
                <p>Wide Range of Courses</p>
                <img src="https://via.placeholder.com/150" alt="Courses">
            </div>
            <div class="feature">
                <i class="fas fa-chalkboard-teacher"></i>
                <p>Experienced Educators</p>
                <img src="https://via.placeholder.com/150" alt="Educators">
            </div>
            <div class="feature">
                <i class="fas fa-check-circle"></i>
                <p>Interactive Learning</p>
                <img src="https://via.placeholder.com/150" alt="Interactive Learning">
            </div>
            <div class="feature">
                <i class="fas fa-users"></i>
                <p>Community Engagement</p>
                <img src="https://via.placeholder.com/150" alt="Community Engagement">
            </div>
            <div class="feature">
                <i class="fas fa-laptop"></i>
                <p>Flexible Online Classes</p>
                <img src="https://via.placeholder.com/150" alt="Flexible Online Classes">
            </div>
           
        </div>
    </section>

    <footer>
        &copy; 2024 Virtual Classroom
    </footer>
</body>
</html>
