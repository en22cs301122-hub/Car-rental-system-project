<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Car - Car Rental System</title>
    <style>
        /* General Page Styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #121212;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #1f1f1f;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        h2 {
            color: #ff6f61; /* Red Accent */
            text-align: center;
            margin-bottom: 20px;
        }

        /* Car Details Section */
        .car-details {
            text-align: center;
            margin-bottom: 30px;
        }

        .car-details h3 {
            font-size: 24px;
            color: #fff;
            margin-bottom: 10px;
        }

        .car-details p {
            font-size: 18px;
            color: #bbb;
            margin-bottom: 10px;
        }

        /* Form Styling */
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        form label {
            font-size: 16px;
            color: #ff6f61; /* Red Accent */
        }

        form input {
            padding: 10px;
            font-size: 16px;
            background-color: #333;
            border: 1px solid #444;
            border-radius: 4px;
            color: #fff;
            width: 100%;
            max-width: 350px;
        }

        form input[type="date"] {
            cursor: pointer;
        }

        /* Button Styling */
        .btn-book {
            background-color: #ff6f61; /* Red Accent */
            color: #fff;
            border: none;
            padding: 12px 24px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-book:hover {
            background-color: #e25f50;
        }

        /* Error Message */
        .error-message {
            background-color: #e25f50;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Book Your Car</h2>
        <div class="car-details">
            <!-- Display car information -->
            <h3>${car.brand} ${car.model}</h3>
            <p>Price per day: ₹${car.pricePerDay}</p>
            <p>Model: ${car.description}</p>

            <!-- Booking Form -->
            <form action="book-car" method="post">
                <input type="hidden" name="carId" value="${car.id}">

                <label for="fromDate">From Date:</label>
                <input type="date" name="fromDate" required>

                <label for="toDate">To Date:</label>
                <input type="date" name="toDate" required>

                <button type="submit" class="btn-book">Book Now</button>
            </form>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="error-message">${error}</div>
            </c:if>
        </div>
    </div>
</body>
</html>
