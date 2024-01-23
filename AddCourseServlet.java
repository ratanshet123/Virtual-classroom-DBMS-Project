import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/dbms_project";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    // Database table name for courses
    private static final String COURSES_TABLE_NAME = "courses";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        	 try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            // Retrieve course details from the form
            String courseName = request.getParameter("courseName");
            String courseDescription = request.getParameter("courseDescription");

            // Validate input
            if (courseName == null || courseDescription == null || courseName.isEmpty() || courseDescription.isEmpty()) {
                out.println("Please provide both course name and description.");
                return;
            }

            // JDBC variables for opening, closing, and managing connection
            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                // The MySQL INSERT statement to add the course
                String query = "INSERT INTO " + COURSES_TABLE_NAME + " (courseName, courseDescription) VALUES (?, ?)";

                // Create a PreparedStatement object to execute the query
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, courseName);
                    preparedStatement.setString(2, courseDescription);

                    // Execute the query
                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        // Course added successfully
                        out.println("Course added successfully.");
                    } else {
                        // Course addition failed
                        out.println("Failed to add course. Please try again.");
                    }
                }
            } catch (SQLException e) {
                throw new ServletException("Database connection error", e);
            }
        }
    }
}
