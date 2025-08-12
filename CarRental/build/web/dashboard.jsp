<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Dashboard</title>
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

        .navbar {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 10px;
            text-align: center;
            margin-bottom: 20px;
        }

        .navbar a {
            color: #f00;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 18px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .dashboard-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 10px;
            width: 80%;
            margin: 40px auto;
            text-align: center;
        }

        h2 {
            font-size: 36px;
            color: #fff;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #fff;
            margin-bottom: 30px;
        }

        h3 {
            font-size: 28px;
            color: #fff;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #fff;
        }

        th {
            background-color: #f00;
        }

        td {
            background-color: rgba(255, 255, 255, 0.1);
        }

        a {
            color: #f00;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="cars">Car List</a>
        <a href="my-bookings">My Bookings</a>
        <a href="logout">Logout</a>
    </div>

    <div class="dashboard-container">
        <h2>Welcome, ${user.name}</h2>
        <p>Your email: ${user.email}</p>

        <h3>Your Bookings</h3>
        <table>
            <thead>
                <tr>
                    <th>Car Name</th>
                    <th>From Date</th>
                    <th>To Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${userBookings}">
                    <tr>
                        <td>${booking.carName}</td>
                        <td>${booking.fromDate}</td>
                        <td>${booking.toDate}</td>
                        <td>${booking.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="car-list">Browse Cars</a> | <a href="logout">Logout</a>
    </div>

</body>
</html>
