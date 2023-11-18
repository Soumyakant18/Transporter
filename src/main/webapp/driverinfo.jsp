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
    <style>
        /* Style to remove border lines */
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: none;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
        }
    </style>
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

        // Handling deletion if a request parameter is present
        String deleteID = request.getParameter("deleteID");
        if (deleteID != null) {
            String deleteSQL = "DELETE FROM driver WHERE id=?";
            PreparedStatement deleteStatement = connection.prepareStatement(deleteSQL);
            deleteStatement.setString(1, deleteID);
            deleteStatement.executeUpdate();
            deleteStatement.close();
        }

        // Query to retrieve driver information from the database
        String selectSQL = "SELECT * FROM driver";
        PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
        ResultSet resultSet = preparedStatement.executeQuery();
%>

<h2>Driver Information</h2>

<table>
    <thead>
        <tr>
            <th>Driver Name</th>
            <th>Driver License</th>
            <th>Vehicle Type</th>
            <th>Price</th>
            <th>Destination</th>
            <th>Action</th>
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
                    <td>
                        <form action="" method="post">
                            <input type="hidden" name="deleteID" value="<%= resultSet.getString("id") %>">
                            <button class="btn" type="submit">Delete</button>
                        </form>
                    </td>
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