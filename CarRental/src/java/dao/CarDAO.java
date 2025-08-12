package dao;

import java.sql.*;
import java.util.*;
import model.Car;
import db.DBConnector;

public class CarDAO {

    // Get all available cars
    public List<Car> getAllAvailableCars() {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM cars WHERE available = 1";

        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setDescription(rs.getString("description"));
                car.setPricePerDay(rs.getDouble("price_per_day"));
                car.setAvailable(rs.getBoolean("available"));
                car.setImageUrl(rs.getString("image_url"));
                cars.add(car);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cars;
    }

    // Get a car by its ID
    public Car getCarById(int carId) {
        String sql = "SELECT * FROM cars WHERE id = ?";

        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, carId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setDescription(rs.getString("description"));
                car.setPricePerDay(rs.getDouble("price_per_day"));
                car.setAvailable(rs.getBoolean("available"));
                car.setImageUrl(rs.getString("image_url"));
                return car;
            }
            

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // Return null if car with given ID is not found
    }

    // Update car availability
    public void updateAvailability(int carId, boolean available) {
        String sql = "UPDATE cars SET available = ? WHERE id = ?";

        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setBoolean(1, available);
            stmt.setInt(2, carId);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
