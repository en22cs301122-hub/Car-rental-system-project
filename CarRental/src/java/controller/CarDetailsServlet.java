import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import model.Car;
import dao.CarDAO;

@WebServlet("/CarDetailsServlet")
public class CarDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // CarDAO instance to fetch car data
    private CarDAO carDAO;

    public void init() {
        carDAO = new CarDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve carId from request
        String carIdParam = request.getParameter("id");
        
        if (carIdParam != null) {
            try {
                // Parse carId to integer
                int carId = Integer.parseInt(carIdParam);

                // Fetch car details from database
                Car car = carDAO.getCarById(carId);

                // Check if the car exists
                if (car != null) {
                    // Set car object as a request attribute
                    request.setAttribute("car", car);
                    
                    // Forward to car.jsp
                    RequestDispatcher dispatcher = request.getRequestDispatcher("car.jsp");
                    dispatcher.forward(request, response);
                } else {
                    // If car not found, show an error page or message
                    request.setAttribute("error", "Car not found!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }

            } catch (NumberFormatException e) {
                // Handle invalid carId format
                request.setAttribute("error", "Invalid car ID format!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // If no carId is provided, redirect to the cars listing page
            response.sendRedirect("cars.jsp");
        }
    }

    // Optionally, implement doPost if needed for form submission, but for now, doGet should suffice
}
