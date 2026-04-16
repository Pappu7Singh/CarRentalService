<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/pages/common/navbar.jsp" />

    <div class="container">
        <div class="page-header">
            <h2>Admin Dashboard</h2>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-title">Manage Cars</div>
                <div class="mt-2 text-muted mb-3">View, edit or delete cars in the fleet.</div>
                <a href="${pageContext.request.contextPath}/manage-cars" class="btn btn-primary d-flex justify-center items-center">Manage Cars</a>
            </div>
            
            <div class="stat-card">
                <div class="stat-title">Add New Car</div>
                <div class="mt-2 text-muted mb-3">Expand your fleet with a new vehicle.</div>
                <a href="${pageContext.request.contextPath}/add-car" class="btn btn-success d-flex justify-center items-center">Add Car</a>
            </div>

            <div class="stat-card">
                <div class="stat-title">View Bookings</div>
                <div class="mt-2 text-muted mb-3">Monitor user bookings and statuses.</div>
                <a href="${pageContext.request.contextPath}/admin-bookings" class="btn btn-outline d-flex justify-center items-center">View Bookings</a>
            </div>
        </div>
    </div>

</body>
</html>