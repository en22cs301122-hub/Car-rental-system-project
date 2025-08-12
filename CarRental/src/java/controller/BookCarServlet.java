package controller;

import dao.BookingDAO;
import dao.CarDAO;
import model.Booking;
import model.Car;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class BookCarServlet extends HttpServlet {

    // Handle GET request to display the car details
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int carId = Integer.parseInt(request.getParameter("carId"));

        CarDAO carDAO = new CarDAO();
        Car car = carDAO.getCarById(carId);

        request.setAttribute("car", car);
        request.getRequestDispatcher("book.jsp").forward(request, response);
    }

    // Handle POST request to create a booking
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        int carId = Integer.parseInt(request.getParameter("carId"));
        Date fromDate = Date.valueOf(request.getParameter("fromDate"));
        Date toDate = Date.valueOf(request.getParameter("toDate"));

        Booking booking = new Booking();
        booking.setUserId(user.getId());
        booking.setCarId(carId);
        booking.setFromDate(fromDate);
        booking.setToDate(toDate);
        booking.setStatus("pending");

        BookingDAO bookingDAO = new BookingDAO();
        CarDAO carDAO = new CarDAO();

        boolean isBookingCreated = bookingDAO.createBooking(booking);

        if (isBookingCreated) {
            carDAO.updateAvailability(carId, false);
            request.getRequestDispatcher("bookingconfirm.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Booking failed. Please try again.");
            request.getRequestDispatcher("book.jsp").forward(request, response);
        }
    }
}
