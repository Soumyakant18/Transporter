import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signin")
public class signin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public signin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        PrintWriter out=response.getWriter();
        try {
            String name = request.getParameter("username");
            String password = request.getParameter("password");
       
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database connection details with the correct database name
            String jdbcURL = "jdbc:mysql://localhost:3306/transport"; // Replace "your_database_name" with your actual database name
            String jdbcUsername = "root";
            String jdbcPassword = "root";
           

            // Establish the database connection
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String query = "SELECT * FROM users WHERE name = ? AND password = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                // Successful login
                String role = resultSet.getString("role");
                if ("driver".equals(role)) {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("driverdash.jsp");
                    dispatcher.forward(request, response); // Forward to the driver dashboard
                } else  {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("userdash.jsp");
                    dispatcher.forward(request, response); // Forward to the user dashboard
                }
        
            }else {
            	
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