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
            <h2>Welcome, <%= user.getName() %> 👋</h2>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-title">Find a Ride</div>
                <div class="mt-2 text-muted mb-3">Looking for a car to rent? Browse our available fleet.</div>
                <a href="search" class="btn btn-primary d-flex justify-center items-center">Search Cars</a>
            </div>
            
            <div class="stat-card">
                <div class="stat-title">Your Bookings</div>
                <div class="mt-2 text-muted mb-3">View and manage your current and past car reservations.</div>
                <a href="my-bookings" class="btn btn-outline d-flex justify-center items-center">My Bookings</a>
            </div>
        </div>
    </div>

</body>
</html>