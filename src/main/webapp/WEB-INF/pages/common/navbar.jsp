<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.CarRentalService.model.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    String userRole = (loggedInUser != null) ? loggedInUser.getRole() : "";
%>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/" class="navbar-brand">
        <i class="fa-solid fa-car-side" style="color: var(--primary);"></i> DriveLux
    </a>
    <div class="navbar-nav">
        <% if ("ADMIN".equalsIgnoreCase(userRole)) { %>
            <span class="nav-welcome">Welcome, <span><%= loggedInUser.getName() %></span></span>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/manage-cars" class="nav-link"><i class="fa-solid fa-car"></i> Cars</a>
            <a href="${pageContext.request.contextPath}/admin-bookings" class="nav-link"><i class="fa-solid fa-calendar-check"></i> Bookings</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        <% } else if ("USER".equalsIgnoreCase(userRole)) { %>
            <span class="nav-welcome">Welcome, <span><%= loggedInUser.getName() %></span></span>
            <a href="${pageContext.request.contextPath}/home" class="nav-link"><i class="fa-solid fa-house"></i> Home</a>
            <a href="${pageContext.request.contextPath}/search" class="nav-link"><i class="fa-solid fa-magnifying-glass"></i> Find a Car</a>
            <a href="${pageContext.request.contextPath}/my-bookings" class="nav-link"><i class="fa-solid fa-calendar-days"></i> My Bookings</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        <% } else { %>
            <a href="${pageContext.request.contextPath}/login" class="nav-link"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
            <a href="${pageContext.request.contextPath}/register" class="btn btn-primary btn-sm"><i class="fa-solid fa-user-plus"></i> Register</a>
        <% } %>
    </div>
</nav>