package com.CarRentalService.controller;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.*;
import com.CarRentalService.service.*;

@WebServlet("/book-car")
public class BookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int carId = Integer.parseInt(req.getParameter("id"));

        CarService carService = new CarService();
        Car car = carService.getCarById(carId);

        req.setAttribute("car", car);

        req.getRequestDispatcher("/WEB-INF/pages/user/booking.jsp")
           .forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        int carId = Integer.parseInt(req.getParameter("carId"));
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");

        double pricePerDay = Double.parseDouble(req.getParameter("price"));
        long diff = java.sql.Date.valueOf(endDate).getTime() - java.sql.Date.valueOf(startDate).getTime();
        long days = (diff / (1000 * 60 * 60 * 24)) + 1;

        double totalPrice = pricePerDay * days;

        Booking booking = new Booking();
        booking.setUserId(user.getId());
        booking.setCarId(carId);
        booking.setStartDate(startDate);
        booking.setEndDate(endDate);
        booking.setTotalPrice(totalPrice);

        BookingService service = new BookingService();

        if (service.createBooking(booking)) {
        	CarService carService = new CarService();
        	carService.updateAvailability(carId, false);
            res.sendRedirect("home");
        } else {
            res.sendRedirect("book-car?id=" + carId + "&error=true");
        }
    }
}