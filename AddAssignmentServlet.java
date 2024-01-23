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

@WebServlet("/AddAssignmentServlet")
public class AddAssignmentServlet extends HttpServlet {
    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/dbms_project";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    // JDBC variables for opening, closing, and managing connection
    private static Connection connection;

    // Method to get a database connection
    private Connection getDatabaseConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String assignmentTitle = request.getParameter("assignmentTitle");
        String dueDate = request.getParameter("dueDate");
        String courseName = request.getParameter("CourseName1");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Assuming you have a method to get the database connection
            try (Connection connection = getDatabaseConnection()) {
                // Insert assignment into the database
                String query = "INSERT INTO assignments (AssignmentTitle, DueDate, CName) VALUES (?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, assignmentTitle);
                    preparedStatement.setString(2, dueDate);
                    preparedStatement.setString(3, courseName);
                    preparedStatement.executeUpdate();
                }

                // Send a response to the client
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<html><body><h2>Assignment added successfully!</h2></body></html>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions, log errors, etc.
            e.printStackTrace();

            // Send an error response to the client
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding assignment to the database.");
        } finally {
            // Close the connection in the finally block to ensure it's always closed
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
