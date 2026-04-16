package com.CarRentalService.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.Car;
import com.CarRentalService.service.CarService;

@WebServlet("/edit-car")
public class UpdateCarServlet extends HttpServlet {

    // LOAD EDIT PAGE
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        CarService service = new CarService();
        Car car = service.getCarById(id);

        req.setAttribute("car", car);

        req.getRequestDispatcher("/WEB-INF/pages/admin/edit-car.jsp")
           .forward(req, res);
    }

    // UPDATE CAR
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        Car car = new Car();

        car.setId(Integer.parseInt(req.getParameter("id")));
        car.setName(req.getParameter("name"));
        car.setBrand(req.getParameter("brand"));
        car.setModel(req.getParameter("model"));
        car.setYear(Integer.parseInt(req.getParameter("year")));
        car.setPricePerDay(Double.parseDouble(req.getParameter("price")));

        CarService service = new CarService();

        if (service.updateCar(car)) {
            res.sendRedirect("manage-cars");
        } else {
            res.sendRedirect("edit-car?id=" + car.getId() + "&error=true");
        }
    }
}