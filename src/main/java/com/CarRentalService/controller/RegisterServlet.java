package com.CarRentalService.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.User;
import com.CarRentalService.service.UserService;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    // ✅ LOAD PAGE
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("WEB-INF/pages/auth/register.jsp")
               .forward(request, response);
    }

    // ✅ HANDLE FORM
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setPassword(request.getParameter("password"));

        UserService service = new UserService();

        if (service.register(user)) {
            response.sendRedirect("login");
        } else {
            response.sendRedirect("register?error=true");
        }
    }
}