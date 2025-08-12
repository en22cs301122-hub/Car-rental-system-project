<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Rental Service</title>
    
    <!-- Bootstrap and custom CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    
    <!-- FontAwesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">CarRent</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="cars.jsp">Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Banner Section -->
    <div class="container-fluid banner bg-dark text-white py-5">
        <div class="container text-center">
            <h1>Find the Perfect Car for Your Journey</h1>
            <p>Rent a car at the best prices. Fast, easy, and convenient.</p>
            <a href="car.jsp" class="btn btn-primary btn-lg">Browse Cars</a>
        </div>
    </div>

    <!-- Featured Cars Section -->
    <div class="container my-5">
        <h2 class="text-center mb-4">Our Featured Cars</h2>
        <div class="row">
            <!-- Fetch and display car data dynamically from the backend -->
            <c:forEach var="car" items="${featuredCars}">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card shadow-sm">
                        <img src="${car.imageUrl}" class="card-img-top" alt="${car.brand} ${car.model}">
                        <div class="card-body">
                            <h5 class="card-title">${car.brand} ${car.model}</h5>
                            <p class="card-text">${car.description}</p>
                            <a href="bookCar.jsp?id=${car.id}" class="btn btn-primary">Rent Now</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Blog Section -->
    <div class="container my-5">
        <h2 class="text-center mb-4">Latest News & Tips</h2>
        <div class="row">
            <c:forEach var="post" items="${latestPosts}">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card">
                        <img src="${post.imageUrl}" class="card-img-top" alt="${post.title}">
                        <div class="card-body">
                            <h5 class="card-title">${post.title}</h5>
                            <p class="card-text">${post.summary}</p>
                            <a href="blogPost.jsp?id=${post.id}" class="btn btn-secondary">Read More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
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

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript (if needed) -->
    <script src="js/main.js"></script>
</body>
</html>
