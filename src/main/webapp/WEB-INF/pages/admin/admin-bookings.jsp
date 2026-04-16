<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.CarRentalService.model.Booking" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Bookings - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <jsp:include page="/WEB-INF/pages/common/navbar.jsp" />

    <div class="container">
        <div class="page-header">
            <h2>All Bookings (Admin)</h2>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline">Back to Dashboard</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>User ID</th>
                        <th>Car ID</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Total Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<Booking> list = (List<Booking>) request.getAttribute("bookings");
                    if (list != null && !list.isEmpty()) {
                        for (Booking b : list) {
                            String status = b.getStatus();
                            String badgeClass = "badge-info";
                            if ("BOOKED".equalsIgnoreCase(status)) badgeClass = "badge-success";
                            else if ("CANCELLED".equalsIgnoreCase(status)) badgeClass = "badge-danger";
                            else if ("PENDING".equalsIgnoreCase(status)) badgeClass = "badge-warning";
                %>
                    <tr>
                        <td><strong>#<%= b.getId() %></strong></td>
                        <td>User <%= b.getUserId() %></td>
                        <td>Car <%= b.getCarId() %></td>
                        <td><%= b.getStartDate() %></td>
                        <td><%= b.getEndDate() %></td>
                        <td>$<%= b.getTotalPrice() %></td>
                        <td><span class="badge <%= badgeClass %>"><%= status %></span></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="7" class="text-center text-muted py-4">No bookings found</td>
                    </tr>
                <%  } %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>