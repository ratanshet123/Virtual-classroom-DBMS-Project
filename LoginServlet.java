import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/dbms_project";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    // Database table name for signup
    private static final String SIGNUP_TABLE_NAME = "signup";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            // Get form data
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // JDBC variables for opening, closing, and managing connection
            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                // The MySQL SELECT statement to check login
                String query = "SELECT usertype FROM " + SIGNUP_TABLE_NAME + " WHERE username = ? AND password = ?";

                // Create a PreparedStatement object to execute the query
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, username);
                    preparedStatement.setString(2, password);

                    // Execute the query
                    ResultSet resultSet = preparedStatement.executeQuery();

                    if (resultSet.next()) {
                        String userType = resultSet.getString("usertype");
                        if ("student".equals(userType)) {
                            // Redirect to student home page
                            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                            dispatcher.forward(request, response);
                        } else if ("teacher".equals(userType)) {
                            // Redirect to teacher home page
                            RequestDispatcher dispatcher = request.getRequestDispatcher("teacherhome.jsp");
                            dispatcher.forward(request, response);
                        } else {
                            out.println("<html><body><h2>Invalid user type. Please sign up with a valid user type.</h2></body></html>");
                        }
                    } else {
                        out.println("<html><body><h2>Login Failed. Please sign up.</h2></body></html>");
                    }
                }
            } catch (SQLException e) {
                throw new ServletException("Database connection error", e);
            }
        }
    }
}
