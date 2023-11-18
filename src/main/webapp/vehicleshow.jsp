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
        .management-section {
            width: 30vh; /* Set width to 20% of viewport height */
            background-color: #f8f9fa;
            height:100vh;
            padding: 10px;
            float: left; /* Align section to the left */
        }
        .management-section button {
           margin-bottom: 5px;
            width: 80%;
            padding: 8px;
            font-size: 14px;
             background-color: lightblue;
        }
        .card-container {
            margin-left: 20vh; /* Add space for the management section */
        }
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
            width: 300px; /* Set a width for the card */
            display: inline-block; /* Display cards in a row */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
             background-color: #D1EAF0;
        }
        /* Style the card's header (optional) */
        .card-header {
            font-weight: bold;
        }
        /* Style the card's body (optional) */
        .card-body {
            margin-top: 5px;
        }
    </style>
</head>
<body>

<div class="management-section">
  
    <button onclick="redirectToPage1()">Available</button>
    <button onclick="redirectToPage2()">Bookings</button>
        <button onclick="redirectToPage3()">Profile</button>
</div>

<div class="card-container">
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

    <h2>Vehicle availables</h2>

    <%
        while (resultSet.next()) {
    %>
        <div class="card">
            <div class="card-header">Vehicle Type</div>
            <div class="card-body"><%= resultSet.getString("vehicle_type") %></div>
            <div class="card-header">Price</div>
            <div class="card-body"><%= resultSet.getDouble("price") %></div>
            <div class="card-header">Destination</div>
            <div class="card-body"><%= resultSet.getString("destination") %></div>
            
            <button onclick="redtobook()">Book</button>
            <script>
            function redtobook() {
                window.location.href = "booking.jsp";
            }
            </script>
        </div>
    <%
        }
        // Close resources
        resultSet.close();
        preparedStatement.close();
        connection.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
    %>
</div>

<script>
    function redirectToPage1() {
        window.location.href = "vehicleshow.jsp";
    }

    function redirectToPage2() {
        window.location.href = "userinf.jsp";
    }
    function redirectToPage3() {
        window.location.href = "userprofile.jsp";
    }
</script>

</body>
</html>
