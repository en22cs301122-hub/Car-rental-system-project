<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Cars - Car Rental System</title>
    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', sans-serif;
    background: url('https://plus.unsplash.com/premium_photo-1686730540270-93f2c33351b6?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2FyJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D') no-repeat center center fixed;
    background-size: cover;
    color: white;
    min-height: 100vh;
}

.container {
    max-width: 1200px;
    margin: auto;
    padding: 40px 20px;
    background-color: rgba(0, 0, 0, 0.7);
    border-radius: 16px;
    box-shadow: 0 0 20px rgba(255, 0, 0, 0.3);
}

h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #f00;
}

.car-list {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;
}

.car-item {
    background-color: #111;
    border: 1px solid #f00;
    padding: 20px;
    border-radius: 12px;
    text-align: center;
    transition: transform 0.3s, box-shadow 0.3s;
}

.car-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 0 15px #f00;
}

.car-item h3 {
    color: #fff;
    margin-bottom: 10px;
}

.car-item p {
    margin: 8px 0;
    color: #ddd;
}

.btn-book {
    display: inline-block;
    margin-top: 15px;
    padding: 10px 20px;
    background-color: #f00;
    color: #fff;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
    transition: background-color 0.3s;
}

.btn-book:hover {
    background-color: #d40000;
}
.car-image {
    width: 300px;
    height: 180px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 15px;
    display: block;
    margin-left: auto;
    margin-right: auto;
    box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
}

</style>
</head>
<body>
    <div class="container">
        <h2>Available Cars for Rent</h2>
        <div class="car-list">
            <!-- Loop through the list of cars -->
            <c:forEach var="car" items="${availableCars}">
                <div class="car-item">
                    <c:if test="${car.imageUrl != null && !car.imageUrl.isEmpty()}">
                        <img src="${car.imageUrl}" alt="${car.brand} ${car.model}" class="car-image">
                    </c:if>
                    <h3>${car.brand} ${car.model}</h3>
                    <p>Price per day: ₹${car.pricePerDay}</p>
                    <p>Availability: ${car.available ? 'Available' : 'Not Available'}</p>
                    <a href="book-car?carId=${car.id}" class="btn-book">Book Now</a>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
