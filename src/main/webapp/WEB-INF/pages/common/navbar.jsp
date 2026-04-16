<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.CarRentalService.model.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
    String userRole = (loggedInUser != null) ? loggedInUser.getRole() : "";
%>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/" class="navbar-brand">
        🚗 DriveLux
    </a>
    <div class="navbar-nav">
        <% if ("admin".equals(userRole)) { %>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link">Dashboard</a>
            <a href="${pageContext.request.contextPath}/manage-cars" class="nav-link">Cars</a>
            <a href="${pageContext.request.contextPath}/admin-bookings" class="nav-link">Bookings</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Logout</a>
        <% } else if ("user".equals(userRole)) { %>
            <a href="${pageContext.request.contextPath}/home" class="nav-link">Home</a>
            <a href="${pageContext.request.contextPath}/search" class="nav-link">Find a Car</a>
            <a href="${pageContext.request.contextPath}/my-bookings" class="nav-link">My Bookings</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Logout</a>
        <% } else { %>
            <a href="${pageContext.request.contextPath}/login" class="nav-link">Login</a>
            <a href="${pageContext.request.contextPath}/register" class="btn btn-primary btn-sm">Register</a>
        <% } %>
    </div>
</nav>