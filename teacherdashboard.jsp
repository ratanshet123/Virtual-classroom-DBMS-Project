<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classroom Dashboard</title>
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

        #addedCourses {
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
        }

        #added-courses-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        #added-courses-list li {
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s;
        }

        #added-courses-list li:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        #added-courses-list li span {
            margin-right: 10px;
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
        .assignment-list .assignment-item span {
            flex: 1;
        }

        .assignment-list .assignment-item a {
            margin-left: 10px;
            color: #4285f4;
            text-decoration: none;
            cursor: pointer;
        }

        .assignment-list .assignment-item a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Classroom Dashboard</h1>
    </header>

    <nav>
        <a href="teacherhome.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="teachercourse.jsp"><i class="fas fa-book"></i> Course Announcements</a>
        <a href="teacherprofile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </nav>

    <section id="courses">
        <h2>Add Courses</h2>
        <form id="addCourseForm" action="AddCourseServlet" method="post">
            <label for="courseName">Course Name:</label>
            <input type="text" id="courseName" name="courseName" required>
    
            <label for="courseDescription">Course Description:</label>
            <textarea id="courseDescription" name="courseDescription" rows="4" required></textarea>
            <button type="submit">Add Course</button>
          
    
          <!--  <button type="button" onclick="addCourse()">Add Course</button>  -->
        </form>
        <ul class="classroom-list" id="enrolled-courses-list">
            <!-- Display enrolled courses here -->
        </ul>
    </section>

    <!-- <section id="addedCourses">
        <h2>Added Courses</h2>
        <ul class="classroom-list" id="added-courses-list">
            Display added courses here
        </ul>
    </section> -->

    <section id="assignments" class="assignments">
        <h2>Add Assignments</h2>
        <form id="addAssignmentForm" action="AddAssignmentServlet" method=post>
            <label for="assignmentTitle">Assignment Title:</label>
            <input type="text" id="assignmentTitle" name="assignmentTitle" required>

            <label for="dueDate">Due Date:</label>
            <input type="date" id="dueDate" name="dueDate" required>
            
              <label for="CourseName1">Course Name:</label>
            <input type="text" id="CourseName1" name="CourseName1" required>
            
            <button type="submit"> <!-- onclick="addAssignment()" -->Add Assignment</button>

            <!-- <div class="file-input-container">
                <input type="file" id="assignmentFile" class="file-input" name="assignmentFile" accept=".pdf" required>
                <label for="assignmentFile" class="file-input-label">Upload PDF File</label>
                <button type="button" onclick="addAssignment()">Add Assignment</button>
            </div> -->
        </form>
      
        </section>
    

    <footer>
        &copy; 2024 Classroom Dashboard
    </footer>
    
  <!--   <script>
        function addCourse() {
            var courseName = document.getElementById('courseName').value;
            var courseDescription = document.getElementById('courseDescription').value;

            // Validate input
            if (!courseName || !courseDescription) {
                alert('Please enter both course name and description.');
                return;
            }

            // Perform the actual addition of the course
            var newCourse = {
                name: courseName,
                description: courseDescription
            };

            // Retrieve existing courses from local storage
            var existingCourses = JSON.parse(localStorage.getItem('courses')) || [];

            // Add the new course
            existingCourses.push(newCourse);

            // Store the updated courses back in local storage
            localStorage.setItem('courses', JSON.stringify(existingCourses));

            // Optionally, you can clear the form fields
            document.getElementById('courseName').value = '';
            document.getElementById('courseDescription').value = '';

            // Display the updated course list
            displayEnrolledCourses();
            displayAddedCourses();
        }

        // Function to display enrolled courses
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

        // Function to display added courses by the teacher
        function displayAddedCourses() {
            var coursesContainer = document.getElementById('added-courses-list');
            coursesContainer.innerHTML = '';

            var addedCourses = JSON.parse(localStorage.getItem('courses')) || [];

            if (addedCourses.length > 0) {
                addedCourses.forEach(function (course) {
                    var listItem = document.createElement('li');

                    var courseNameSpan = document.createElement('span');
                    courseNameSpan.textContent = course.name;
                    listItem.appendChild(courseNameSpan);

                    var removeButton = document.createElement('button');
                    removeButton.textContent = 'Remove';
                    removeButton.addEventListener('click', function () {
                        confirmRemoveCourse(course.name);
                    });
                    listItem.appendChild(removeButton);

                    coursesContainer.appendChild(listItem);
                });
            } else {
                coursesContainer.innerHTML = '<p>No added courses yet.</p>';
            }
        }

        // Function to remove an enrolled course
        function removeEnrolledCourse(courseName) {
            var enrolledCourses = getEnrolledCourses();

            // Filter out the course to be removed
            var updatedCourses = enrolledCourses.filter(function (course) {
                return course !== courseName;
            });

            // Store the updated courses back in local storage
            localStorage.setItem('enrolledCourses', JSON.stringify(updatedCourses));

            // Display the updated course list
            displayEnrolledCourses();
        }

        // Function to confirm enrolled course removal
        function confirmRemoveEnrolledCourse(courseName) {
            var confirmRemove = confirm(`Are you sure you want to remove the enrolled course "${courseName}"?`);

            if (confirmRemove) {
                removeEnrolledCourse(courseName);
            }
        }

        // Function to remove an added course
        function removeCourse(courseName) {
            var existingCourses = JSON.parse(localStorage.getItem('courses')) || [];

            // Filter out the course to be removed
            var updatedCourses = existingCourses.filter(function (course) {
                return course.name !== courseName;
            });

            // Store the updated courses back in local storage
            localStorage.setItem('courses', JSON.stringify(updatedCourses));

            // Display the updated course list
            displayAddedCourses();

            // Also update the enrolled courses list on the Enroll Page
            displayEnrolledCourses();
        }

        // Function to confirm course removal
        function confirmRemoveCourse(courseName) {
            var confirmRemove = confirm(`Are you sure you want to remove the course "${courseName}"?`);

            if (confirmRemove) {
                removeCourse(courseName);
            }
        }

        // Rest of your existing JavaScript code...

        // Function to display added courses on the page
        function displayAddedCoursesOnPage() {
            var coursesContainer = document.getElementById('added-courses-list');
            coursesContainer.innerHTML = '';

            var addedCourses = JSON.parse(localStorage.getItem('courses')) || [];

            if (addedCourses.length > 0) {
                addedCourses.forEach(function (course) {
                    var listItem = document.createElement('li');

                    var courseNameSpan = document.createElement('span');
                    courseNameSpan.textContent = course.name;
                    listItem.appendChild(courseNameSpan);

                    var courseDescriptionSpan = document.createElement('span');
                    courseDescriptionSpan.textContent = course.description;
                    listItem.appendChild(courseDescriptionSpan);

                    var removeButton = document.createElement('button');
                    removeButton.textContent = 'Remove';
                    removeButton.addEventListener('click', function () {
                        confirmRemoveCourseFromPage(course.name);
                    });
                    listItem.appendChild(removeButton);

                    coursesContainer.appendChild(listItem);
                });
            } else {
                coursesContainer.innerHTML = '<p>No added courses yet.</p>';
            }
        }

        // Function to remove an added course from the "Added Courses" section
        function removeCourseFromPage(courseName) {
            var addedCourses = JSON.parse(localStorage.getItem('courses')) || [];

            // Filter out the course to be removed
            var updatedCourses = addedCourses.filter(function (course) {
                return course.name !== courseName;
            });

            // Store the updated courses back in local storage
            localStorage.setItem('courses', JSON.stringify(updatedCourses));

            // Display the updated course list on the page
            displayAddedCoursesOnPage();

            // Also update the enrolled courses list on the Enroll Page
            displayEnrolledCourses();
        }

        // Function to confirm course removal from the "Added Courses" section
        function confirmRemoveCourseFromPage(courseName) {
            var confirmRemove = confirm(`Are you sure you want to remove the course "${courseName}"?`);

            if (confirmRemove) {
                removeCourseFromPage(courseName);
            }
        }

        // Call the function to display added courses on the page when the page loads
        displayAddedCoursesOnPage();
        function addAssignment() {
            var assignmentTitle = document.getElementById('assignmentTitle').value;
            var dueDate = document.getElementById('dueDate').value;
            var assignmentFile = document.getElementById('assignmentFile').files[0];

            // Validate input
            if (!assignmentTitle || !dueDate || !assignmentFile) {
                alert('Please fill in all fields.');
                return;
            }

            // Perform the actual addition of the assignment
            var newAssignment = {
                title: assignmentTitle,
                dueDate: dueDate,
                file: assignmentFile.name  // Save only the file name for simplicity
            };

            // Retrieve existing assignments from local storage
            var existingAssignments = JSON.parse(localStorage.getItem('assignments')) || [];

            // Add the new assignment
            existingAssignments.push(newAssignment);

            // Store the updated assignments back in local storage
            localStorage.setItem('assignments', JSON.stringify(existingAssignments));

            // Clear the form fields
            document.getElementById('assignmentTitle').value = '';
            document.getElementById('dueDate').value = '';
            document.getElementById('assignmentFile').value = '';

            // Display the updated assignment list
            displayAssignments();
        }

        function displayAssignments() {
            var assignmentsContainer = document.getElementById('assignment-list');
            assignmentsContainer.innerHTML = '';

            var assignments = JSON.parse(localStorage.getItem('assignments')) || [];

            if (assignments.length > 0) {
                assignments.forEach(function (assignment) {
                    var assignmentItem = document.createElement('div');
                    assignmentItem.classList.add('assignment-item');

                    var titleSpan = document.createElement('span');
                    titleSpan.textContent = assignment.title;
                    assignmentItem.appendChild(titleSpan);

                    var dueDateSpan = document.createElement('span');
                    dueDateSpan.textContent = 'Due Date: ' + assignment.dueDate;
                    assignmentItem.appendChild(dueDateSpan);

                    var downloadLink = document.createElement('a');
                    downloadLink.href = assignment.file;  // Assume the file is in the same directory
                    downloadLink.textContent = 'Download PDF';
                    assignmentItem.appendChild(downloadLink);

                    assignmentsContainer.appendChild(assignmentItem);
                });
            } else {
                assignmentsContainer.innerHTML = '<p>No assignments added yet.</p>';
            }
        }

        // Call the function to display assignments when the page loads
        displayAssignments();
        function removeAssignment(index) {
            var existingAssignments = JSON.parse(localStorage.getItem('assignments')) || [];

            // Ensure index is within bounds
            if (index >= 0 && index < existingAssignments.length) {
                // Remove the assignment at the specified index
                var removedAssignment = existingAssignments.splice(index, 1)[0];

                // Store the updated assignments back in local storage
                localStorage.setItem('assignments', JSON.stringify(existingAssignments));

                // Display the updated assignment list
                displayAssignments();

                // Also update the assignment list on the student's dashboard
                updateStudentDashboard(removedAssignment);
            }
        }

        // Function to confirm assignment removal
        function confirmRemoveAssignment(index) {
            var confirmRemove = confirm('Are you sure you want to remove this assignment?');

            if (confirmRemove) {
                removeAssignment(index);
            }
        }

        // Function to update the student's dashboard after an assignment is removed
        function updateStudentDashboard(removedAssignment) {
            // Assume there is a function on the student's dashboard called updateAssignments
            // that updates the displayed assignments
            if (window.opener && window.opener.updateAssignments) {
                window.opener.updateAssignments(removedAssignment);
            }
        }

        // Function to display assignments on the page
        function displayAssignments() {
            var assignmentsContainer = document.getElementById('assignment-list');
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

                    var removeLink = document.createElement('a');
                    removeLink.textContent = 'Remove';
                    removeLink.addEventListener('click', function () {
                        confirmRemoveAssignment(index);
                    });
                    assignmentItem.appendChild(removeLink);

                    assignmentsContainer.appendChild(assignmentItem);
                });
            } else {
                assignmentsContainer.innerHTML = '<p>No assignments added yet.</p>';
            }
        }

        // Call the function to display assignments when the page loads
        displayAssignments();
    </script> -->
</body>
</html>
