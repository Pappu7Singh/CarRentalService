<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.CarRentalService.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/pages/common/navbar.jsp" />

    <%
        User user = (User) session.getAttribute("user");
    %>

    <div class="container">
        <div class="page-header">
            <h2>Welcome <span style="color: var(--text-main); font-weight: 500;"><%= user.getName() %></span> <i class="fa-solid fa-hand-sparkles" style="color: var(--primary);"></i></h2>
        </div>

        <div class="stats-grid">
            <a href="search" class="stat-card">
                <div class="stat-title"><i class="fa-solid fa-car"></i> Find a Ride</div>
                <div class="mt-2 text-muted mb-3" style="font-size: 0.95rem;">Looking for a car to rent? Browse our available fleet of luxury and sport vehicles.</div>
                <div class="btn btn-primary d-flex justify-center items-center" style="width: 100%;">Search Cars <i class="fa-solid fa-arrow-right"></i></div>
            </a>
            
            <a href="my-bookings" class="stat-card">
                <div class="stat-title"><i class="fa-solid fa-calendar-check"></i> Your Bookings</div>
                <div class="mt-2 text-muted mb-3" style="font-size: 0.95rem;">View and manage your current and past car reservations.</div>
                <div class="btn btn-outline d-flex justify-center items-center" style="width: 100%;">My Bookings <i class="fa-solid fa-arrow-right"></i></div>
            </a>
        </div>
    </div>

</body>
</html>