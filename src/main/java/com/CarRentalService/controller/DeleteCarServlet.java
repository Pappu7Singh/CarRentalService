package com.CarRentalService.controller;

import java.io.IOException;

import com.CarRentalService.service.CarService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-car")
public class DeleteCarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        CarService service = new CarService();
        service.deleteCar(id);

        res.sendRedirect("manage-cars");
    }
}