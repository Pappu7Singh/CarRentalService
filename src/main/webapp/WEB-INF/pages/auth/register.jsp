<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container d-flex justify-center items-center" style="min-height: 100vh;">
        <div class="card auth-form" style="width: 100%; margin: 0;">
            <h2 class="text-center mb-4">Create an Account</h2>
            
            <% String message = (String) request.getAttribute("message"); 
               if (message != null) { %>
                <div class="alert alert-error mb-3"><%= message %></div>
            <% } %>

            <form action="register" method="post">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" placeholder="John Doe" required />
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="john@example.com" required />
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" placeholder="+1 234 567 890" required />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Create a strong password" required />
                </div>
                <button type="submit" class="btn btn-primary" style="width: 100%;">Register Account</button>
                
                <div class="text-center mt-3">
                    <p class="text-muted">Already have an account? <a href="login.jsp">Login here</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>