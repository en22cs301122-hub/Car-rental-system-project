package controller;

import dao.BookingDAO;
import model.Booking;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the logged-in user from the session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // If user is not logged in, redirect to login page
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Fetch the bookings related to the user
        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> userBookings = bookingDAO.getBookingsByUserId(user.getId());

        // Set user and bookings as request attributes
        request.setAttribute("user", user);
        request.setAttribute("userBookings", userBookings);

        // Forward the request to the dashboard.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
