<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.CarRentalService.model.Car" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Car - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/pages/common/navbar.jsp" />

    <%
        Car car = (Car) request.getAttribute("car");
    %>

    <div class="container">
        <div class="page-header">
            <h2>Edit Car Details</h2>
            <a href="${pageContext.request.contextPath}/manage-cars" class="btn btn-outline">Back to Manage Cars</a>
        </div>
        
        <div class="card" style="max-width: 600px; margin: 0 auto;">
            <% String message = (String) request.getAttribute("message"); 
               if (message != null) { %>
                <div class="alert <%= message.toLowerCase().contains("success") ? "alert-success" : "alert-error" %> mb-3">
                    <%= message %>
                </div>
            <% } %>

            <form action="edit-car" method="post">
                <input type="hidden" name="id" value="<%= car.getId() %>" />

                <div class="form-group">
                    <label for="name">Car Name</label>
                    <input type="text" id="name" name="name" value="<%= car.getName() %>" required />
                </div>
                <div class="form-group">
                    <label for="brand">Brand</label>
                    <input type="text" id="brand" name="brand" value="<%= car.getBrand() %>" required />
                </div>
                <div class="form-group">
                    <label for="model">Model</label>
                    <input type="text" id="model" name="model" value="<%= car.getModel() %>" required />
                </div>
                <div class="form-group">
                    <label for="year">Year</label>
                    <input type="number" id="year" name="year" value="<%= car.getYear() %>" required />
                </div>
                <div class="form-group">
                    <label for="price">Price per day ($)</label>
                    <input type="number" id="price" name="price" value="<%= car.getPricePerDay() %>" step="0.01" required />
                </div>

                <div class="mt-4">
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Update Vehicle Details</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>