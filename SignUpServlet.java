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

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/dbms_project";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    // Database table name
    private static final String TABLE_NAME = "signup";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Register the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get form data
            String userType = request.getParameter("userType");
            String newUsername = request.getParameter("newUsername");
            String newPassword = request.getParameter("newPassword");
            String department = request.getParameter("department");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");

            // JDBC variables for opening, closing, and managing connection
            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                // The MySQL INSERT statement
                String query = "INSERT INTO " + TABLE_NAME + " (Usertype, username, password, department, phone, email) VALUES (?, ?, ?, ?, ?,?)";

                // Create a PreparedStatement object to execute the query
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, userType);
                    preparedStatement.setString(2, newUsername);
                    preparedStatement.setString(3, newPassword);
                    preparedStatement.setString(4, department);
                    preparedStatement.setString(5, phone);
                    preparedStatement.setString(6, email);

                    // Execute the query and retrieve the generated keys (if any)
                    int affectedRows = preparedStatement.executeUpdate();

                    if (affectedRows > 0) {
                        out.println("<html><body><h2>Sign Up Successful!</h2><a href='Login page.jsp'>Go to login page</a></body></html>");
                    } else {
                        out.println("<html><body><h2>Error occurred during Sign Up. Please try again.</h2></body></html>");
                    }
                }
            } catch (SQLException e) {
                throw new ServletException("Database connection error", e);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
