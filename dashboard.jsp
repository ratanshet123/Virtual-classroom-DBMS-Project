<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classroom Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.12.305/pdf.min.js"></script>

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

         #assign{
            padding-left: 17px;;
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

        .classroom-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .classroom-list li {
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 15px;
            background-color: #fff;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s;
        }

        .classroom-list li:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .classroom-list li a {
            text-decoration: none;
            color: #4285f4;
            font-weight: bold;
            transition: color 0.3s;
        }

        .classroom-list li a:hover {
            color: #333;
        }

        .assignments {
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
        }

        .assignment-item {
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s;
        }

        .assignment-item:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .grades {
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
        }

        .grade-item {
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s;
        }

        .grade-item:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        .file-input-container {
            position: relative;
            overflow: hidden;
            margin-top: 10px;
        }

        .file-input {
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
        }

        .file-input-label {
            display: inline-block;
            padding: 8px 16px;
            background-color: #4285f4;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .pdf-container {
            max-width: 100%;
            height: 600px;
            margin-top: 20px;
            overflow: auto;
        }
    </style>
</head>

<body>
    <header>
        <h1>Classroom Dashboard</h1>
    </header>

    <nav>
        <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="course.jsp"><i class="fas fa-book"></i> Course Announcements</a>
        <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </nav>

    <section id="courses">
        <h2>My Courses</h2>
        <ul class="classroom-list" id="enrolled-courses-list">
            <li>
                <span>Mathematics</span>
                <a href="javascript:void(0);" onclick="showCourseDetails('Mathematics')"><i
                        class="fas fa-chevron-right"></i> Details</a>
            </li>
            <li>
                <span>Science</span>
                <a href="javascript:void(0);" onclick="showCourseDetails('Science')"><i
                        class="fas fa-chevron-right"></i> Details</a>
            </li>
        </ul>
    </section>
    <h2 id="assign">Assignments</h2>
    <section id="assignments" class="assignments">
       
        <div id="pdf-viewer" class="pdf-container" style="display: none;"></div>
        <!-- Assignments will be dynamically added here -->
    </section>

    <footer>
        &copy; 2024 Classroom Dashboard
    </footer>

    <script>
        function displayEnrolledCourses() {
            var coursesContainer = document.getElementById('enrolled-courses-list');
            coursesContainer.innerHTML = '';

            var enrolledCourses = getEnrolledCourses();

            if (enrolledCourses.length > 0) {
                enrolledCourses.forEach(function (course) {
                    var listItem = document.createElement('li');

                    var courseNameSpan = document.createElement('span');
                    courseNameSpan.textContent = course;
                    listItem.appendChild(courseNameSpan);

                    var removeButton = document.createElement('button');
                    removeButton.textContent = 'Remove';
                    removeButton.addEventListener('click', function () {
                        confirmRemoveEnrolledCourse(course);
                    });
                    listItem.appendChild(removeButton);

                    coursesContainer.appendChild(listItem);
                });
            } else {
                coursesContainer.innerHTML = '<p>No enrolled courses yet.</p>';
            }
        }

        function confirmRemoveEnrolledCourse(courseName) {
            var confirmRemove = window.confirm(`Are you sure you want to remove the course "${courseName}"?`);

            if (confirmRemove) {
                removeEnrolledCourse(courseName);
            }
        }

        function enrollCourse(courseName) {
            var enrolledCourses = getEnrolledCourses();

            if (!enrolledCourses.includes(courseName)) {
                enrolledCourses.push(courseName);
                localStorage.setItem('enrolledCourses', JSON.stringify(enrolledCourses));
                alert(`Enrolled in ${courseName} successfully!`);
                displayEnrolledCourses(); // Update the displayed enrolled courses
            } else {
                alert(`You are already enrolled in ${courseName}.`);
            }
        }

        function removeEnrolledCourse(courseName) {
            var enrolledCourses = getEnrolledCourses();

            var index = enrolledCourses.indexOf(courseName);

            if (index !== -1) {
                enrolledCourses.splice(index, 1);
                localStorage.setItem('enrolledCourses', JSON.stringify(enrolledCourses));
                alert(`Removed ${courseName} from enrolled courses.`);
                displayEnrolledCourses(); // Update the displayed enrolled courses
            }
        }

        function getEnrolledCourses() {
            return JSON.parse(localStorage.getItem('enrolledCourses')) || [];
        }

        // Function to display assignments
        function displayAssignments() {
            var assignmentsContainer = document.getElementById('assignments');
            assignmentsContainer.innerHTML = '';

            var assignments = JSON.parse(localStorage.getItem('assignments')) || [];

            if (assignments.length > 0) {
                assignments.forEach(function (assignment, index) {
                    var assignmentItem = document.createElement('div');
                    assignmentItem.classList.add('assignment-item');

                    var titleSpan = document.createElement('span');
                    titleSpan.textContent = assignment.title;
                    assignmentItem.appendChild(titleSpan);

                    var dueDateSpan = document.createElement('span');
                    dueDateSpan.textContent = 'Due Date: ' + assignment.dueDate;
                    assignmentItem.appendChild(dueDateSpan);

                    var detailsLink = document.createElement('a');
                    detailsLink.href = 'javascript:void(0);';
                    detailsLink.textContent = 'Details';
                    detailsLink.addEventListener('click', function () {
                        showAssignmentDetails(index);
                    });
                    assignmentItem.appendChild(detailsLink);

                    assignmentsContainer.appendChild(assignmentItem);
                });
            } else {
                assignmentsContainer.innerHTML = '<p>No assignments added yet.</p>';
            }
        }

        // Call the functions when the page loads
        displayEnrolledCourses();
        displayAssignments();

        function showAssignmentDetails(index) {
            var pdfViewer = document.getElementById('pdf-viewer');
            pdfViewer.innerHTML = ''; // Clear previous content

            var assignments = JSON.parse(localStorage.getItem('assignments')) || [];
            var pdfPath = assignments[index].pdfPath;

            var pdfContainer = document.createElement('div');
            pdfContainer.classList.add('pdf-container');

            // Load and display PDF using pdf.js
            pdfjsLib.getDocument(pdfPath).promise.then(function (pdfDocument) {
                for (var pageNum = 1; pageNum <= pdfDocument.numPages; pageNum++) {
                    pdfDocument.getPage(pageNum).then(function (pdfPage) {
                        var canvas = document.createElement('canvas');
                        pdfContainer.appendChild(canvas);

                        var context = canvas.getContext('2d');
                        var viewport = pdfPage.getViewport({ scale: 1.5 });

                        canvas.width = viewport.width;
                        canvas.height = viewport.height;

                        pdfPage.render({ canvasContext: context, viewport: viewport });
                    });
                }
            });

            pdfViewer.appendChild(pdfContainer);
            pdfViewer.style.display = 'block';
        }

        // Function to show course details
        function showCourseDetails(courseName) {
            // Implement the logic to display course details as needed
            alert(`Details for the course "${courseName}"`);
        }

        // Call the functions when the page loads
        displayEnrolledCourses();
        displayAssignments();
    </script>
</body>

</html>
