package com.CarRentalService.service;

import java.sql.*;

import com.CarRentalService.config.DBConfig;
import com.CarRentalService.model.Booking;

public class BookingService {

    public boolean createBooking(Booking booking) {
        try {
            Connection con = DBConfig.getConnection();

            String sql = "INSERT INTO bookings(user_id,car_id,start_date,end_date,total_price) VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getCarId());
            ps.setString(3, booking.getStartDate());
            ps.setString(4, booking.getEndDate());
            ps.setDouble(5, booking.getTotalPrice());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Booking Error: " + e.getMessage());
            return false;
        }
    }
 // GET BOOKINGS BY USER
    public java.util.List<Booking> getUserBookings(int userId) {

        java.util.List<Booking> list = new java.util.ArrayList<>();

        try {
            Connection con = DBConfig.getConnection();

            String sql = "SELECT * FROM bookings WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Booking b = new Booking();

                // ✅ IMPORTANT: all inside loop
                b.setId(rs.getInt("id"));
                b.setCarId(rs.getInt("car_id"));
                b.setStartDate(rs.getString("start_date"));
                b.setEndDate(rs.getString("end_date"));
                b.setTotalPrice(rs.getDouble("total_price"));
                b.setStatus(rs.getString("status"));

                list.add(b);
            }

        } catch (Exception e) {
            System.out.println("Fetch Booking Error: " + e.getMessage());
        }

        return list;
    }
 // CANCEL BOOKING
    public boolean cancelBooking(int id) {
        try {
            Connection con = DBConfig.getConnection();

            String sql = "UPDATE bookings SET status='CANCELLED' WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Cancel Error: " + e.getMessage());
            return false;
        }
    }
    public Booking getBookingById(int id) {

        Booking b = new Booking();

        try {
            Connection con = DBConfig.getConnection();

            String sql = "SELECT * FROM bookings WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                b.setId(rs.getInt("id"));
                b.setCarId(rs.getInt("car_id"));
            }

        } catch (Exception e) {
            System.out.println("Fetch Booking Error: " + e.getMessage());
        }

        return b;
    }
    public java.util.List<Booking> getAllBookings() {

        java.util.List<Booking> list = new java.util.ArrayList<>();

        try {
            Connection con = DBConfig.getConnection();

            String sql = "SELECT * FROM bookings";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Booking b = new Booking();

                b.setId(rs.getInt("id"));
                b.setUserId(rs.getInt("user_id"));
                b.setCarId(rs.getInt("car_id"));
                b.setStartDate(rs.getString("start_date"));
                b.setEndDate(rs.getString("end_date"));
                b.setTotalPrice(rs.getDouble("total_price"));
                b.setStatus(rs.getString("status"));

                list.add(b);
            }

        } catch (Exception e) {
            System.out.println("Fetch All Bookings Error: " + e.getMessage());
        }

        return list;
    }
}