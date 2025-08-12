<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Car Rental System</title>
    <style>
        /* General Reset and Dark Theme */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            color: white;
            background: url('https://media.cdntoyota.co.za/toyotacms23/attachments/cm6jeri4c3ptpbhakts1dbnlb-1920x1080-2-1.desktop.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
        }

        .login-body {
            margin-top:150px;
            margin-right:800px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .form-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            width: 500px;
            text-align: center;
        }

        h2 {
            color: #fff;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            color: #f00;  /* Red accent color */
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #fff;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
        }

        button {
            background-color: #f00;  /* Red button */
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #d40000; /* Darker red on hover */
        }

        a {
            color: #f00;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body class="login-body">
    <div class="form-container">
        <h2>Login</h2>
        <form action="login" method="POST">
            <div class="form-group">
                <label for="username">Email:</label>
                <input type="text" id="username" name="email" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required />
            </div>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
</body>
</html>
