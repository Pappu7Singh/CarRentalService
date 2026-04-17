<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.CarRentalService.model.Booking" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script>
        function confirmCancel(id) {
            if (confirm("Are you sure you want to cancel this booking?")) {
                window.location.href = "${pageContext.request.contextPath}/cancel-booking?id=" + id;
            }
        }
    </script>
</head>
<body>

    <jsp:include page="/WEB-INF/pages/common/navbar.jsp" />

    <div class="container">
        <div class="page-header">
            <h2>My Bookings <i class="fa-solid fa-calendar-days" style="color: var(--primary); margin-left: 0.5rem;"></i></h2>
            <a href="${pageContext.request.contextPath}/search" class="btn btn-outline"><i class="fa-solid fa-car"></i> Book Another Car</a>
        </div>

        <% String message = (String) request.getAttribute("message"); 
           if (message != null) { %>
            <div class="alert alert-success mb-3"><%= message %></div>
        <% } %>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Car ID</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th>Action</th>
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
                        <td>Car <%= b.getCarId() %></td>
                        <td><%= b.getStartDate() %></td>
                        <td><%= b.getEndDate() %></td>
                        <td>$<%= b.getTotalPrice() %></td>
                        <td><span class="badge <%= badgeClass %>"><%= status %></span></td>
                        <td>
                            <% if ("BOOKED".equalsIgnoreCase(status) || "PENDING".equalsIgnoreCase(status)) { %>
                                <button onclick="confirmCancel(<%= b.getId() %>)" class="btn btn-danger btn-sm"><i class="fa-solid fa-xmark"></i> Cancel</button>
                            <% } else { %>
                                <span class="text-muted">-</span>
                            <% } %>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="7" class="text-center text-muted py-4">You have no bookings yet. Go find a ride!</td>
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