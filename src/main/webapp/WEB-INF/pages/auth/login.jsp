<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Car Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container d-flex justify-center items-center" style="min-height: 100vh;">
        <div class="card auth-form" style="width: 100%; margin: 0; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);">
            <div class="text-center mb-4">
                <i class="fa-solid fa-car-side" style="color: var(--primary); font-size: 2.5rem; margin-bottom: 1rem;"></i>
                <h2>Welcome Back</h2>
            </div>
            
            <% String message = (String) request.getAttribute("message"); 
               if (message != null) { %>
                <div class="alert alert-error mb-3"><%= message %></div>
            <% } %>

            <form action="login" method="post">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required />
                </div>
                <button type="submit" class="btn btn-primary" style="width: 100%; font-size: 1.1rem; padding: 0.8rem;"><i class="fa-solid fa-right-to-bracket"></i> Login to Account</button>
                
                <div class="text-center mt-3">
                    <p class="text-muted">Don't have an account? <a href="register">Sign up here</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>