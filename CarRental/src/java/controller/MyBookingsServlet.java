package controller;

import dao.BookingDAO;
import model.Booking;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class MyBookingsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // DEBUG LOG
        System.out.println(">>>> MyBookingsServlet loaded");

        HttpSession session = request.getSession(false);
        User user = (User) (session != null ? session.getAttribute("user") : null);

        // Check if user is logged in
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get user's bookings
        BookingDAO dao = new BookingDAO();
        List<Booking> bookings = dao.getBookingsByUserId(user.getId());

        request.setAttribute("user", user);
        request.setAttribute("userBookings", bookings);

        // Forward to dashboard.jsp or a dedicated bookings page
        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
