<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
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

        /* Style for the management section */
        .management-section {
            float: left;
            width: 15%;
            padding: 20px;
            background-color: #f8f9fa;
            height: 100vh;
        }
         .management-section button {
           margin-bottom: 5px;
            width: 80%;
            padding: 8px;
            font-size: 14px;
             background-color: lightblue;
        }

        /* Style for the table content */
        .table-content {
            margin-left: 20%; /* Adjust margin to accommodate the management section */
        }
    </style>
</head>
<body>
    <!-- Management Section -->
    <div class="management-section">
    
        <button onclick="redirectToPage1()">Available</button>
        <button onclick="redirectToPage2()">Bookings</button>
    </div>

    <!-- Table Content -->
    <div class="table-content">
        <h1>User Information:</h1>
        <table>
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Timing</th>
                    <th>Phone Number</th>
                    <th>Vehicle Type</th>
                    <!-- Add more columns if necessary -->
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
                    <!-- Access other columns in a similar way -->
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

    <script>
    function redirectToPage1() {
        window.location.href = "vehicleshow.jsp";
    }

    function redirectToPage2() {
        window.location.href = "userinf.jsp";
    }
    </script>
</body>
</html>
