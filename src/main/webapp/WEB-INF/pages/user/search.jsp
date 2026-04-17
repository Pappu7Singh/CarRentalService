<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.CarRentalService.model.Car" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Cars - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/pages/common/navbar.jsp" />

    <div class="container">
        <div class="page-header d-flex flex-wrap justify-between items-center" style="gap: 1rem;">
            <h2>Find Your Perfect Ride <i class="fa-solid fa-magnifying-glass" style="font-size: 1.5rem; color: var(--primary);"></i></h2>
            
            <form action="search" method="get" class="d-flex gap-2" style="max-width: 400px; width: 100%;">
                <input type="text" name="keyword" placeholder="Search by name, brand, model..." value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>" style="margin-bottom: 0;" />
                <button type="submit" class="btn btn-primary" style="white-space: nowrap;"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
            </form>
        </div>

        <% String message = (String) request.getAttribute("message"); 
           if (message != null) { %>
            <div class="alert alert-success mb-3"><%= message %></div>
        <% } %>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Price/Day</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Car> cars = (List<Car>) request.getAttribute("cars");
                    if (cars != null && !cars.isEmpty()) {
                        for (Car c : cars) {
                            boolean isAvailable = c.isAvailability();
                %>
                    <tr>
                        <td><strong><%= c.getName() %></strong></td>
                        <td><%= c.getBrand() %></td>
                        <td><%= c.getModel() %></td>
                        <td>$<%= c.getPricePerDay() %></td>
                        <td>
                            <% if (isAvailable) { %>
                                <span class="badge badge-success">Available</span>
                            <% } else { %>
                                <span class="badge badge-danger">Unavailable</span>
                            <% } %>
                        </td>
                        <td>
                            <% if (isAvailable) { %>
                                <a href="book-car?id=<%= c.getId() %>" class="btn btn-success btn-sm"><i class="fa-solid fa-key"></i> Book Now</a>
                            <% } else { %>
                                <button disabled class="btn btn-outline btn-sm" style="cursor: not-allowed; opacity: 0.5;"><i class="fa-solid fa-ban"></i> Unavailable</button>
                            <% } %>
                        </td>
                    </tr>
                <%
                        }
                    } else if (cars != null) {
                %>
                    <tr>
                        <td colspan="6" class="text-center text-muted py-4">No results found for your search. Try different keywords.</td>
                    </tr>
                <%
                    } else {
                %>
                    <tr>
                        <td colspan="6" class="text-center text-muted py-4">Enter a keyword to search for cars, or view all available models.</td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>