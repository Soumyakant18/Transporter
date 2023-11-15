<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<button onclick="redirectToPage1()">Go to Page 1</button>
<button onclick="redirectToPage2()">Go to Page 2</button>

<script>
    function redirectToPage1() {
        window.location.href = "vehicleshow.jsp";
    }

    function redirectToPage2() {
        window.location.href = "booking.jsp";
    }
</script>

</body>
</html>
