package com.CarRentalService.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.CarRentalService.config.DBConfig;
import com.CarRentalService.model.User;

public class UserService {

    // REGISTER
    public boolean register(User user) {
        try {
            Connection con = DBConfig.getConnection();

            String sql = "INSERT INTO users(name,email,phone,password,role) VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, "USER");

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println("Register Error: " + e.getMessage());
            return false;
        }
    }

    // LOGIN
    public User login(String email, String password) {
        try {
            Connection con = DBConfig.getConnection();

            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setRole(rs.getString("role"));
                return user;
            }

        } catch (Exception e) {
            System.out.println("Login Error: " + e.getMessage());
        }
        return null;
    }
}