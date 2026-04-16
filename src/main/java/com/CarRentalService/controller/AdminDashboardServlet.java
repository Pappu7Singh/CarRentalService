package com.CarRentalService.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.User;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("../login");
            return;
        }

        User user = (User) session.getAttribute("user");

        // ❗ Role check
        if (!"ADMIN".equals(user.getRole())) {
            response.sendRedirect("../home");
            return;
        }

        request.getRequestDispatcher("../WEB-INF/pages/admin/dashboard.jsp")
               .forward(request, response);
    }
}