<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Rental - ${car.brand} ${car.model}</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">CarRent</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="cars.jsp">Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Car Details Section -->
    <div class="container my-5">
        <div class="row">
            <div class="col-lg-6">
                <img src="${car.imageUrl}" alt="${car.brand} ${car.model}" class="img-fluid rounded">
            </div>
            <div class="col-lg-6">
                <h2>${car.brand} ${car.model}</h2>
                <p><strong>Description:</strong> ${car.description}</p>
                <p><strong>Price per Day:</strong> $${car.pricePerDay}</p>
                <p><strong>Availability:</strong> ${car.availability ? "Available" : "Not Available"}</p>
                
                <!-- Booking Form -->
                <h4 class="my-4">Book Now</h4>
                <form action="BookCarServlet" method="POST">
                    <input type="hidden" name="carId" value="${car.id}">
                    
                    <div class="mb-3">
                        <label for="startDate" class="form-label">Pick-up Date</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="endDate" class="form-label">Drop-off Date</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Confirm Booking</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="bg-dark text-white text-center py-4">
        <p>&copy; 2025 CarRent | All Rights Reserved</p>
        <p>Follow us: 
            <a href="#" class="text-white"><i class="fab fa-facebook"></i></a> 
            <a href="#" class="text-white"><i class="fab fa-twitter"></i></a> 
            <a href="#" class="text-white"><i class="fab fa-instagram"></i></a>
        </p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>