package com.CarRentalService.service;

import java.sql.*;
import java.util.*;

import com.CarRentalService.config.DBConfig;
import com.CarRentalService.model.Car;

public class CarService {

    // ADD CAR
    public boolean addCar(Car car) {
        try {
            Connection con = DBConfig.getConnection();

            String sql = "INSERT INTO cars(name,brand,model,year,price_per_day,availability) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, car.getName());
            ps.setString(2, car.getBrand());
            ps.setString(3, car.getModel());
            ps.setInt(4, car.getYear());
            ps.setDouble(5, car.getPricePerDay());
            ps.setBoolean(6, car.isAvailability());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Add Car Error: " + e.getMessage());
            return false;
        }
    }

    // GET ALL CARS
    public List<Car> getAllCars() {
        List<Car> list = new ArrayList<>();

        try {
            Connection con = DBConfig.getConnection();
            String sql = "SELECT * FROM cars";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setName(rs.getString("name"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setYear(rs.getInt("year"));
                car.setPricePerDay(rs.getDouble("price_per_day"));
                car.setAvailability(rs.getBoolean("availability"));

                list.add(car);
            }

        } catch (Exception e) {
            System.out.println("Fetch Error: " + e.getMessage());
        }
        return list;
    }

    // DELETE CAR
    public boolean deleteCar(int id) {
        try {
            Connection con = DBConfig.getConnection();
            String sql = "DELETE FROM cars WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            return false;
        }
    }
    
 // GET CAR BY ID
    public Car getCarById(int id) {
        try {
            Connection con = DBConfig.getConnection();
            String sql = "SELECT * FROM cars WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setName(rs.getString("name"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setYear(rs.getInt("year"));
                car.setPricePerDay(rs.getDouble("price_per_day"));
                car.setAvailability(rs.getBoolean("availability"));
                return car;
            }

        } catch (Exception e) {
            System.out.println("Get Car Error: " + e.getMessage());
        }
        return null;
    }

    // UPDATE CAR
    public boolean updateCar(Car car) {
        try {
            Connection con = DBConfig.getConnection();

            String sql = "UPDATE cars SET name=?, brand=?, model=?, year=?, price_per_day=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, car.getName());
            ps.setString(2, car.getBrand());
            ps.setString(3, car.getModel());
            ps.setInt(4, car.getYear());
            ps.setDouble(5, car.getPricePerDay());
            ps.setInt(6, car.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Update Error: " + e.getMessage());
            return false;
        }
    }
    
 // SEARCH CARS
    public List<Car> searchCars(String keyword) {
        List<Car> list = new ArrayList<>();

        try {
            Connection con = DBConfig.getConnection();

            String sql = "SELECT * FROM cars WHERE name LIKE ? OR brand LIKE ? OR model LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);

            String key = "%" + keyword + "%";

            ps.setString(1, key);
            ps.setString(2, key);
            ps.setString(3, key);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setName(rs.getString("name"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setYear(rs.getInt("year"));
                car.setPricePerDay(rs.getDouble("price_per_day"));
                car.setAvailability(rs.getBoolean("availability"));

                list.add(car);
            }

        } catch (Exception e) {
            System.out.println("Search Error: " + e.getMessage());
        }

        return list;
    }
    public void updateAvailability(int carId, boolean status) {
        try {
            Connection con = DBConfig.getConnection();

            String sql = "UPDATE cars SET availability=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setBoolean(1, status);
            ps.setInt(2, carId);

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Availability Error: " + e.getMessage());
        }
    }
}