package com.CarRentalService.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.service.CarService;

@WebServlet("/manage-cars")
public class CarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        CarService service = new CarService();
        req.setAttribute("cars", service.getAllCars());

        req.getRequestDispatcher("/WEB-INF/pages/admin/manage-cars.jsp")
           .forward(req, res);
    }
}