package com.CarRentalService.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.Car;
import com.CarRentalService.service.CarService;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");

        CarService service = new CarService();

        // ❗ handle null (important)
        List<Car> cars;
        if (keyword != null && !keyword.trim().isEmpty()) {
            cars = service.searchCars(keyword);
        } else {
            cars = service.getAllCars(); // show all cars initially
        }

        req.setAttribute("cars", cars);

        req.getRequestDispatcher("/WEB-INF/pages/user/search.jsp")
           .forward(req, res);
    }
}