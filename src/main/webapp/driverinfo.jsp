<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Information</title>
</head>
<body>

<%
    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/transport";
        String jdbcUsername = "root";
        String jdbcPassword = "root";

        // Establish the database connection
        Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // Query to retrieve driver information from the database
        String selectSQL = "SELECT * FROM driver";
        PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
        ResultSet resultSet = preparedStatement.executeQuery();
%>

<h2>Driver Information</h2>

<table border="1">
    <thead>
        <tr>
            <th>Driver Name</th>
            <th>Driver License</th>
            <th>Vehicle Type</th>
            <th>Price</th>
            <th>Destination</th>
        </tr>
    </thead>
    <tbody>
        <%
            while (resultSet.next()) {
        %>
                <tr>
                    <td><%= resultSet.getString("driver_name") %></td>
                    <td><%= resultSet.getString("driver_license") %></td>
                    <td><%= resultSet.getString("vehicle_type") %></td>
                    <td><%= resultSet.getDouble("price") %></td>
                    <td><%= resultSet.getString("destination") %></td>
                </tr>
        <%
            }
        %>
    </tbody>
</table>

<%
        // Close resources
        resultSet.close();
        preparedStatement.close();
        connection.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>

</body>
</html>
