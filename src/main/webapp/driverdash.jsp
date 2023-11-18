<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .management-section {
            display: flex;
            flex-direction: column;
            justify-content: start;
            align-items: flex-start;
            height: 100vh; /* Adjust as needed */
           
            background-color: #f8f9fa; /* Adjust background color */
            padding-left: 20px;
             padding-top: 20px;
              padding-bottom: 20px;
             
        }
        .management-section button {
        
            margin-bottom: 5px; /* Adjusted spacing */
            width: 80%;
            padding: 8px; /* Reduced button padding */
            font-size: 14px; /* Reduced font size */
        }
        .container-fluid{
        margin-top:10px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Management Section -->
            <div class="col-md-3 management-section">
               
                <button onclick="adddriver()" class="btn btn-primary">Add Driver</button>
                <button onclick="showDriverInfo()" class="btn btn-primary">Show Driver Info</button>
                <button onclick="seebookings()" class="btn btn-primary">Bookings</button>
            </div>

            <!-- Main Content -->
            <div class="col-md-9">
                <div class="container mt-5">
                    <h1>welcomeback admin</h1>
                    <!-- Your existing content -->
                </div>
            </div>
        </div>
    </div>

    <script>
        function adddriver() {
            // Redirect to another page (replace 'yourpage.jsp' with the actual page URL)
            window.location.href = 'driver-form.jsp';
        }
        function showDriverInfo() {
            // Redirect to another page (replace 'yourpage.jsp' with the actual page URL)
            window.location.href = 'driverinfo.jsp';
        }

        function seebookings() {
            // Redirect to another page (replace 'yourpage.jsp' with the actual page URL)
            window.location.href = 'driverseen.jsp';
        }
    </script>
</body>
</html>
