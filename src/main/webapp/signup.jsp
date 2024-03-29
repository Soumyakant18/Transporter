<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Website</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Anton, sans-serif;
            background-color: black;
        }
        .container {
        margin-top:170px;
            width: 600px;
            margin: 170px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #B6B6B4;
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            width: 50%;
            padding: 10px;
            background-color: red;
            color: white;
            border: none;
          margin-left:140px;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #EA3C53;
        }
        .header {
            background-color: red;
            color: #fff;
            text-align: center;
            padding: 10px;
        }
        .header a {
            color: #fff;
            text-decoration: none;
            margin: 10px;
        }
        .radiochoice{
        padding : 20px;
        margin-left:205px;
        }
        
    </style>
</head>
<body>
    <div class="header">
        <a href="index.jsp">Home</a>
        <a href="signin.jsp">Sign In</a>
        <a href="signup.jsp">Sign Up</a>
    </div>
    <div class="container">
        <h2>Registration</h2>
        <form action="signup" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name1" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
          <div class = "radiochoice">Driver <input type="radio" name="role" value="driver" id="driver">
User <input type="radio" name="role" value="user" id="user">
</div>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
