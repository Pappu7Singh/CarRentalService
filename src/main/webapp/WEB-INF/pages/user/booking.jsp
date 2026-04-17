<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.CarRentalService.model.Car" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Car - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/pages/common/navbar.jsp" />

    <%
        Car car = (Car) request.getAttribute("car");
    %>

    <div class="container">
        <div class="page-header">
            <h2>Complete Your Booking <i class="fa-solid fa-clipboard-check"></i></h2>
            <a href="${pageContext.request.contextPath}/search" class="btn btn-outline"><i class="fa-solid fa-arrow-left"></i> Back to Search</a>
        </div>
        
        <div class="card" style="max-width: 600px; margin: 0 auto;">
            <% String message = (String) request.getAttribute("message"); 
               if (message != null) { %>
                <div class="alert alert-error mb-3"><%= message %></div>
            <% } %>

            <div class="mb-4" style="padding-bottom: 1.5rem; border-bottom: 1px solid var(--border);">
                <h3 class="mb-1"><i class="fa-solid fa-car-side" style="margin-right: 0.5rem; color: var(--primary);"></i><%= car.getName() %> <span class="badge badge-info" style="font-weight: 500; font-size: 0.8rem; margin-left: 0.5rem;"><%= car.getYear() %></span></h3>
                <p class="text-muted" style="margin-left: 2rem;"><i class="fa-solid fa-tag" style="margin-right: 0.3rem;"></i><%= car.getBrand() %> &bull; <%= car.getModel() %></p>
                <div class="mt-2" style="font-size: 1.5rem; font-weight: 700; color: var(--primary); text-shadow: 0 0 10px rgba(212, 175, 55, 0.4); margin-left: 2rem;">
                    $<%= car.getPricePerDay() %> <span style="font-size: 0.9rem; font-weight: 400; color: var(--text-muted); text-shadow: none;">/ day</span>
                </div>
            </div>

            <form action="book-car" method="post">
                <input type="hidden" name="carId" value="<%= car.getId() %>" />
                <input type="hidden" name="price" value="<%= car.getPricePerDay() %>" />

                <div class="d-flex gap-3 flex-wrap mb-3">
                    <div class="form-group" style="flex: 1; min-width: 200px;">
                        <label for="startDate">Pick-up Date</label>
                        <input type="date" id="startDate" name="startDate" required />
                    </div>
                    <div class="form-group" style="flex: 1; min-width: 200px;">
                        <label for="endDate">Drop-off Date</label>
                        <input type="date" id="endDate" name="endDate" required />
                    </div>
                </div>

                <div class="mt-4">
                    <button type="submit" class="btn btn-success" style="width: 100%; font-weight: 600; padding: 1rem; font-size: 1.1rem;"><i class="fa-solid fa-circle-check"></i> Confirm & Pay at Counter</button>
                    <p class="text-center text-muted mt-2" style="font-size: 0.85rem;"><i class="fa-solid fa-shield-halved"></i> No payment required today. Secure reservation.</p>
                </div>
            </form>
        </div>
    </div>

</body>
</html>