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
            <h2>Admin Dashboard <i class="fa-solid fa-chart-pie" style="color: var(--primary); margin-left: 0.5rem;"></i></h2>
        </div>

        <div class="stats-grid">
            <a href="${pageContext.request.contextPath}/manage-cars" class="stat-card">
                <div class="stat-title"><i class="fa-solid fa-gears"></i> Manage Cars</div>
                <div class="mt-2 text-muted mb-3" style="font-size: 0.95rem;">View, edit or delete cars in the fleet.</div>
                <div class="btn btn-primary d-flex justify-center items-center" style="width: 100%;">Manage Cars <i class="fa-solid fa-arrow-right"></i></div>
            </a>
            
            <a href="${pageContext.request.contextPath}/add-car" class="stat-card">
                <div class="stat-title"><i class="fa-solid fa-plus-circle" style="color: var(--success);"></i> Add New Car</div>
                <div class="mt-2 text-muted mb-3" style="font-size: 0.95rem;">Expand your fleet with a new vehicle.</div>
                <div class="btn btn-success d-flex justify-center items-center" style="width: 100%;">Add Car <i class="fa-solid fa-arrow-right"></i></div>
            </a>

            <a href="${pageContext.request.contextPath}/admin-bookings" class="stat-card">
                <div class="stat-title"><i class="fa-solid fa-list-check"></i> View Bookings</div>
                <div class="mt-2 text-muted mb-3" style="font-size: 0.95rem;">Monitor user bookings and statuses.</div>
                <div class="btn btn-outline d-flex justify-center items-center" style="width: 100%;">View Bookings <i class="fa-solid fa-arrow-right"></i></div>
            </a>
        </div>
    </div>

</body>
</html>