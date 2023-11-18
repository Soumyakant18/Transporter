<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>User Information</h2>
        
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String fullName = request.getParameter("fullName");
                String timing = request.getParameter("timing");
                String phoneNumber = request.getParameter("phoneNumber");
                String vehicleType = request.getParameter("vehicleType");

                String jdbcURL = "jdbc:mysql://localhost:3306/transport";
                String dbUsername = "root";
                String dbPassword = "root";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword);

                    String sql = "INSERT INTO userinformation (fullname, timing, phonenumber, vehicletype) VALUES (?, ?, ?, ?)";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setString(1, fullName);
                    statement.setString(2, timing);
                    statement.setString(3, phoneNumber);
                    statement.setString(4, vehicleType);

                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        out.println("A new user was inserted successfully!");
                        // You can redirect to a success page here if needed
                    }

                    statement.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>

        <form action="" method="post">
            <div class="form-group">
                <label for="fullName">Full Name:</label><br>
                <input type="text" class="form-control" id="fullName" name="fullName" required><br><br>
            </div>
            
            <div class="form-group">
                <label for="timing">Timing:</label><br>
                <input type="text" class="form-control" id="timing" name="timing" required><br><br>
            </div>
            
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label><br>
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required><br><br>
            </div>
            
            <div class="form-group">
                <label for="vehicleType">Vehicle Type:</label><br>
                <input type="text" class="form-control" id="vehicleType" name="vehicleType"><br><br>
            </div>
            
            <input type="submit" class="btn btn-primary" value="Submit">
        </form>
    </div>
</body>
</html>
