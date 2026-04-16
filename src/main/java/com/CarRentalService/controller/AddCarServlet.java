package com.CarRentalService.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.Car;
import com.CarRentalService.service.CarService;

@WebServlet("/add-car")
public class AddCarServlet extends HttpServlet {

    // LOAD PAGE
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/pages/admin/add-car.jsp")
           .forward(req, res);
    }

    // HANDLE FORM
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        Car car = new Car();

        car.setName(req.getParameter("name"));
        car.setBrand(req.getParameter("brand"));
        car.setModel(req.getParameter("model"));
        car.setYear(Integer.parseInt(req.getParameter("year")));
        car.setPricePerDay(Double.parseDouble(req.getParameter("price")));
        car.setAvailability(true);

        CarService service = new CarService();

        if (service.addCar(car)) {
            res.sendRedirect("manage-cars");
        } else {
            res.sendRedirect("add-car?error=true");
        }
    }
}