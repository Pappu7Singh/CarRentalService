package com.CarRentalService.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.User;
import com.CarRentalService.service.UserService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    //  HANDLE PAGE LOAD (GET)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String error = request.getParameter("error");
        if ("invalid".equals(error)) {
            request.setAttribute("message", "Incorrect email or password. Please try again.");
        } else if ("empty".equals(error)) {
            request.setAttribute("message", "Email and password are required.");
        } else if ("true".equals(error)) {
            request.setAttribute("message", "An error occurred during login. Please try again.");
        }

        request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp")
               .forward(request, response);
    }

    //  HANDLE FORM SUBMIT (POST)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Server-side validation
        boolean hasError = false;
        
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("email_error", "Email is required");
            hasError = true;
        } else if (!email.matches("^\\S+@\\S+\\.\\S+$")) {
            request.setAttribute("email_error", "Enter a valid email");
            hasError = true;
        }
        
        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("password_error", "Password is required");
            hasError = true;
        }

        if (hasError) {
            request.setAttribute("email", email);
            request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp").forward(request, response);
            return;
        }

        UserService service = new UserService();
        User user = service.getUserByEmail(email);

        if (user == null) {
            request.setAttribute("email_error", "Email not found");
            request.setAttribute("email", email);
            request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp").forward(request, response);
        } else if (!user.getPassword().equals(password)) {
            request.setAttribute("password_error", "Incorrect password");
            request.setAttribute("email", email);
            request.getRequestDispatcher("WEB-INF/pages/auth/login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        }
    }
}