<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Car - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/pages/common/navbar.jsp" />

    <div class="container">
        <div class="page-header">
            <h2>Add New Car</h2>
            <a href="${pageContext.request.contextPath}/manage-cars" class="btn btn-outline">Back to Manage Cars</a>
        </div>
        
        <div class="card" style="max-width: 600px; margin: 0 auto;">
            <% String message = (String) request.getAttribute("message"); 
               if (message != null) { %>
                <div class="alert <%= message.toLowerCase().contains("success") ? "alert-success" : "alert-error" %> mb-3">
                    <%= message %>
                </div>
            <% } %>

            <form action="add-car" method="post">
                <div class="form-group">
                    <label for="name">Car Name</label>
                    <input type="text" id="name" name="name" placeholder="e.g. Camry" required />
                </div>
                <div class="form-group">
                    <label for="brand">Brand</label>
                    <input type="text" id="brand" name="brand" placeholder="e.g. Toyota" required />
                </div>
                <div class="form-group">
                    <label for="model">Model</label>
                    <input type="text" id="model" name="model" placeholder="e.g. XSE" required />
                </div>
                <div class="form-group">
                    <label for="year">Year</label>
                    <input type="number" id="year" name="year" placeholder="e.g. 2024" required />
                </div>
                <div class="form-group">
                    <label for="price">Price per day ($)</label>
                    <input type="number" id="price" name="price" placeholder="e.g. 50.00" step="0.01" required />
                </div>

                <div class="mt-4">
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Add Car to Fleet</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>