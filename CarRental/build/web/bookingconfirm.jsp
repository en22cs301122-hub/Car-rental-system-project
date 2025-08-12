<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking Confirmed</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('images/car-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.85);
            padding: 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 0 20px rgba(255, 0, 0, 0.6);
        }

        h1 {
            color: #ff4d4d;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .btn {
            background-color: #ff4d4d;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #e60000;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Booking Confirmed!</h1>
    <p>Your car has been successfully booked. Enjoy your ride!</p>
    <a href="car-list" class="btn">Book Another Car</a>
</div>
</body>
</html>
