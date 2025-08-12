package controller;

import dao.CarDAO;
import model.Car;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class CarListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Instantiate the CarDAO to fetch available cars
        CarDAO dao = new CarDAO();
        
        // Fetch all available cars
        List<Car> cars = dao.getAllAvailableCars();

        // Set the list of cars as an attribute in the request
        request.setAttribute("availableCars", cars);

        // Forward to the car-list.jsp page to display the cars
        request.getRequestDispatcher("car-list.jsp").forward(request, response);
    }
}