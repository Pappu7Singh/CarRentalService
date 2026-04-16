<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.CarRentalService.model.Car" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cars - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this car?")) {
                window.location.href = "${pageContext.request.contextPath}/delete-car?id=" + id;
            }
        }
    </script>
</head>
<body>

    <jsp:include page="/WEB-INF/pages/common/navbar.jsp" />

    <div class="container">
        <div class="page-header">
            <h2>Manage Cars</h2>
            <a href="${pageContext.request.contextPath}/add-car" class="btn btn-primary d-flex items-center gap-2">
                <span>➕</span> Add New Car
            </a>
        </div>

        <% String message = (String) request.getAttribute("message"); 
           if (message != null) { %>
            <div class="alert alert-success mb-3"><%= message %></div>
        <% } %>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Price/Day</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Car> cars = (List<Car>) request.getAttribute("cars");
                    if (cars != null && !cars.isEmpty()) {
                        for (Car c : cars) {
                %>
                    <tr>
                        <td><strong>#<%= c.getId() %></strong></td>
                        <td><%= c.getName() %></td>
                        <td><%= c.getBrand() %></td>
                        <td><%= c.getModel() %></td>
                        <td>$<%= c.getPricePerDay() %></td>
                        <td>
                            <div class="d-flex gap-2">
                                <a href="${pageContext.request.contextPath}/edit-car?id=<%= c.getId() %>" class="btn btn-outline btn-sm">Edit</a>
                                <button onclick="confirmDelete(<%= c.getId() %>)" class="btn btn-danger btn-sm">Delete</button>
                            </div>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6" class="text-center text-muted py-4">No cars available. Start by adding one.</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>