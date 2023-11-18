<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .management-section {
            display: flex;
            flex-direction: column;
            justify-content: flex-start; /* Changed to flex-start */
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
            padding: 20px;
            margin-top: 10vh; /* Adjusted margin-top */
        }
        .management-section h1 {
            margin-bottom: 20px;
        }
        .management-section .button-container {
            display: flex;
            flex-direction: row;
            justify-content: center;
        }
        .management-section button {
            margin: 0 10px;
            padding: 8px 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="management-section">
    <h1>welcome back user</h1>
    <div class="button-container">
        <button onclick="redirectToPage1()" class="btn btn-primary">Availability</button>
        <button onclick="redirectToPage2()" class="btn btn-primary">Bookings</button>
    </div>
</div>

<script>
    function redirectToPage1() {
        window.location.href = "vehicleshow.jsp";
    }

    function redirectToPage2() {
        window.location.href = "user-form.jsp";
    }
</script>

</body>
</html>
