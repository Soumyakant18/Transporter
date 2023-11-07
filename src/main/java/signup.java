import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class signup extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public signup() {
        super();
    }

   

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            String name = request.getParameter("name1");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database connection details
            String jdbcURL = "jdbc:mysql://localhost:3306/transport";
            String jdbcUsername = "root";
            String jdbcPassword = "root";

            // Establish the database connection
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String insertSQL = "INSERT INTO users (name, email, password,role) VALUES (?, ?, ?,?)";
            
            preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.setString(4, role);
            
           
            
            
            // Execute the insert statement
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Redirect to a success page after successful registration
                RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
                rd.forward(request, response);
            } else {
                // Display an error message if registration fails
                PrintWriter out = response.getWriter();
                out.println("User registration failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
    }
}
