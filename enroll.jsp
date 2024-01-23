<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enroll Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, rgba(234, 233, 233, 0.8), rgba(27, 121, 65, 0.685));

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

        .enroll-button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .enroll-button:hover {
            background-color: #45a049;
        }

        footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            
        }
        footer a{
            color: #fff;
            text-decoration: none;
        }
        .course-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            align-items: center;
        }

        .course {
            text-align: center;
            margin: 15px;
        }

        .course img {
            max-width: 100px;
            max-height: 100px;
            margin-bottom: 10px;
        }

        .course-description {
            font-size: 14px;
            color: #666;
        }
        
        .search-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-input {
            padding: 10px;
            width: 60%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .search-button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <header>
        <h1>Enroll Page</h1>
    </header>
    <nav>
        <a href="home.jsp"><i class="fas fa-chevron-left"></i> Back to Home</a>
    </nav>

    <section>
        <div class="search-container">
            <form action="EnrollServlet" method="post">
                <input type="text" id="searchInput" name="searchInput" class="search-input" placeholder="Search for a course...">
                <button class="search-button" type="submit">Search</button>
            </form>
        </div>

        <h2>Enroll in a Course</h2>
        <div class="course-container">
            <!-- Courses fetched from the database will be included here -->
        </div>
    </section>

    <footer>
        &copy; 2024 Enroll Page <br>
    </footer>
</body>
</html>
  <!--   <script>
        function enrollCourse(courseName) {
            var enrolledCourses = getEnrolledCourses();

            if (!enrolledCourses.includes(courseName)) {
                enrolledCourses.push(courseName);
                localStorage.setItem('enrolledCourses', JSON.stringify(enrolledCourses));
                alert(`Enrolled in ${courseName} successfully!`);
                displayCourses(); // Update the displayed courses
            } else {
                alert(`You are already enrolled in ${courseName}.`);
            }
        }

        function getEnrolledCourses() {
            return JSON.parse(localStorage.getItem('enrolledCourses')) || [];
        }

        function addCourse() {
            var courseName = prompt('Enter the course name:');
            var courseDescription = prompt('Enter the course description:');
            var courseImage = prompt('Enter the URL of the course image:');

            if (courseName && courseDescription && courseImage) {
                var courses = getCourses();
                courses.push({ name: courseName, description: courseDescription, image: courseImage });
                localStorage.setItem('courses', JSON.stringify(courses));

                alert('Course added successfully!');
                displayCourses(); // Update the displayed courses
            } else {
                alert('Invalid input. Please provide all details.');
            }
        }

        function getCourses() {
            return JSON.parse(localStorage.getItem('courses')) || [];
        }

        function displayCourses() {
            var courseContainer = document.getElementById('courseContainer');
            courseContainer.innerHTML = '';

            var courses = getCourses();

            if (courses.length > 0) {
                courses.forEach(function (course) {
                    var courseItem = document.createElement('div');
                    courseItem.classList.add('course');

                    var courseImage = document.createElement('img');
                    courseImage.src = course.image;
                    courseImage.alt = `${course.name} Image`;
                    courseImage.style.maxWidth = '100px';
                    courseImage.style.maxHeight = '100px';
                    courseItem.appendChild(courseImage);

                    var courseName = document.createElement('p');
                    courseName.textContent = course.name;
                    courseItem.appendChild(courseName);

                    var courseDescription = document.createElement('p');
                    courseDescription.classList.add('course-description');
                    courseDescription.textContent = course.description;
                    courseItem.appendChild(courseDescription);

                    var enrollButton = document.createElement('button');
                    enrollButton.classList.add('enroll-button');
                    enrollButton.textContent = 'Enroll';
                    enrollButton.onclick = function () {
                        enrollCourse(course.name);
                    };
                    courseItem.appendChild(enrollButton);

                    courseContainer.appendChild(courseItem);
                });
            } else {
                // Display a message when no courses are available
                courseContainer.innerHTML = '<p>No courses available for enrollment.</p>';
            }
        }

        // Call the function to display courses when the page loads
        displayCourses();
    </script> -->
<!-- </body>
</html>
 -->