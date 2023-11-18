<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Apply the same style as before */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .management-section {
            display: flex;
            flex-direction: column;
            justify-content: start;
            align-items: flex-start;
            height: 100vh;
            background-color: #f8f9fa;
            padding-left: 20px;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .management-section button {
            margin-bottom: 5px;
            width: 80%;
            padding: 8px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Management Section -->
            <div class="col-md-3 management-section">
               
                <button onclick="home()" class="btn btn-primary">Home</button>
                <button onclick="adddriver()" class="btn btn-primary">Add Driver</button>
                <button onclick="showDriverInfo()" class="btn btn-primary">Show Driver Info</button>
                <button onclick="seebookings()" class="btn btn-primary">Bookings</button>
       
            </div>

            <!-- Main Content -->
            <div class="col-md-9">
                <h1>User Information:</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Full Name</th>
                            <th>Timing</th>
                            <th>Phone Number</th>
                            <th>Vehicle Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            String jdbcURL = "jdbc:mysql://localhost:3306/transport";
                            String dbUsername = "root";
                            String dbPassword = "root";

                            Connection connection = null;
                            PreparedStatement statement = null;
                            ResultSet resultSet = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                connection = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword);

                                String sql = "SELECT * FROM userinformation";
                                statement = connection.prepareStatement(sql);
                                resultSet = statement.executeQuery();

                                while (resultSet.next()) {
                        %>
                                    <tr>
                                        <td><%= resultSet.getString("fullname") %></td>
                                        <td><%= resultSet.getString("timing") %></td>
                                        <td><%= resultSet.getString("phonenumber") %></td>
                                        <td><%= resultSet.getString("vehicletype") %></td>
                                    </tr>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (resultSet != null) {
                                        resultSet.close();
                                    }
                                    if (statement != null) {
                                        statement.close();
                                    }
                                    if (connection != null) {
                                        connection.close();
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function adddriver() {
            window.location.href = 'driver-form.jsp';
        }
        function showDriverInfo() {
            window.location.href = 'driverinfo.jsp';
        }
        

        function seebookings() {
            window.location.href = 'driverseen.jsp';
        }
        function home() {
            window.location.href = 'driverdash.jsp';
        }
    </script>
</body>
</html>
