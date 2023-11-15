<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>This is Driver Management</h1>

        <div style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
            <a href="driver-form.jsp" class="btn btn-primary">Add Driver</a>
            <button onclick="showDriverInfo()">Show Driver Information</button>
        </div>
    </div>

    <script>
        function showDriverInfo() {
            // Redirect to another page (replace 'yourpage.jsp' with the actual page URL)
            window.location.href = 'driverinfo.jsp';
        }
    </script>
</body>
</html>
