package com.CarRentalService.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.*;
import com.CarRentalService.service.*;

@WebServlet("/my-bookings")
public class MyBookingsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        BookingService service = new BookingService();
        List<Booking> bookings = service.getUserBookings(user.getId());

        req.setAttribute("bookings", bookings);

        req.getRequestDispatcher("/WEB-INF/pages/user/my-bookings.jsp")
           .forward(req, res);
    }
}