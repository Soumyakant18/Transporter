<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Information Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
      
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Management Section -->
          

            <!-- Main Content -->
            <div class="col-md-9">
                <div class="container mt-5">
                    <h2>Driver Information Form</h2>
                    <form action="driver-form.jsp" method="post">
                        <!-- Driver Information -->
                        <div class="form-group">
                            <label for="driverName">Driver Name:</label>
                            <input type="text" class="form-control" id="driverName" name="driverName" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="driverLicense">Driver License:</label>
                            <input type="text" class="form-control" id="driverLicense" name="driverLicense" required>
                        </div>

                        <!-- Vehicle Information -->
                        <div class="form-group">
                            <label for="vehicleType">Vehicle Type:</label>
                            <input type="text" class="form-control" id="vehicleType" name="vehicleType" required>
                        </div>

                        <div class="form-group">
                            <label for="price">Price:</label>
                            <input type="number" class="form-control" id="price" name="price" required>
                        </div>

                        <!-- Destination Information -->
                        <div class="form-group">
                            <label for="destination">Destination:</label>
                            <input type="text" class="form-control" id="destination" name="destination" required>
                        </div>
                        <input type="submit">
                
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%
    PreparedStatement preparedStatement=null;
    Connection connection=null;
  
    try {
        String driverName = request.getParameter("driverName");
        String driverLicense = request.getParameter("driverLicense");
        String vehicleType = request.getParameter("vehicleType");
        double price = Double.parseDouble(request.getParameter("price"));
        String destination = request.getParameter("destination");
      
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/transport";
        String jdbcUsername = "root";
        String jdbcPassword = "root";

        // Establish the database connection
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        String insertSQL = "INSERT INTO driver (driver_name, driver_license, vehicle_type, price, destination) VALUES (?, ?, ?, ?, ?)";

        preparedStatement = connection.prepareStatement(insertSQL);
        preparedStatement.setString(1, driverName);
        preparedStatement.setString(2, driverLicense);
        preparedStatement.setString(3, vehicleType);
        preparedStatement.setDouble(4, price);
        preparedStatement.setString(5, destination);

        // Execute the insert statement
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            // Display a success message on the same page

            out.println("<html><body><h2>Form submitted successfully!</h2></body></html>");
        } else {
            // Display an error message if insertion fails
          
            out.println("<html><body><h2>Error submitting the form. Please try again.</h2></body></html>");
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
    	
    %>


</body>
</html>
