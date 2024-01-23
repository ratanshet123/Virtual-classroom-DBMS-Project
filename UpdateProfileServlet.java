import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user input from the request
        String fullName = request.getParameter("full-name");
        String email = request.getParameter("email");
        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");

        // Add user details to the student_profiles table
        boolean isProfileAdded = addProfileToDatabase(fullName, email);

        // Update password in the users table if the current password matches
        boolean isPasswordUpdated = updatePasswordInDatabase(email, currentPassword, newPassword);

        // Send response to the client
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (isProfileAdded && isPasswordUpdated) {
            out.println("<html><body><h2>Profile updated successfully!</h2></body></html>");
        } else {
            out.println("<html><body><h2>Error updating profile.</h2></body></html>");
        }
    }

    private boolean addProfileToDatabase(String fullName, String email) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/dbms_project";
        String dbUser = "root";
        String dbPassword = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
                // Assuming you have a table named 'student_profiles'
                String insertQuery = "INSERT INTO profiles (fullname, email) VALUES (?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                    preparedStatement.setString(1, fullName);
                    preparedStatement.setString(2, email);

                    int rowsInserted = preparedStatement.executeUpdate();
                    return rowsInserted > 0;
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean updatePasswordInDatabase(String email, String currentPassword, String newPassword) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/dbms_project";
        String dbUser = "root";
        String dbPassword = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
                // Assuming you have a table named 'users'
                String selectQuery = "SELECT password FROM signup WHERE email = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
                    preparedStatement.setString(1, email);

                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            String storedPassword = resultSet.getString("password");
                            if (currentPassword.equals(storedPassword)) {
                                // Update the password in the 'users' table
                                String updateQuery = "UPDATE signup SET password = ? WHERE email = ?";
                                try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
                                    updateStatement.setString(1, newPassword);
                                    updateStatement.setString(2, email);

                                    int rowsUpdated = updateStatement.executeUpdate();
                                    return rowsUpdated > 0;
                                }
                            }
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }
}
