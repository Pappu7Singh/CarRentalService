package com.CarRentalService.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.Booking;
import com.CarRentalService.service.BookingService;

@WebServlet("/admin-bookings")
public class AdminBookingsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        BookingService service = new BookingService();
        List<Booking> list = service.getAllBookings();

        req.setAttribute("bookings", list);

        req.getRequestDispatcher("/WEB-INF/pages/admin/admin-bookings.jsp")
           .forward(req, res);
    }
}