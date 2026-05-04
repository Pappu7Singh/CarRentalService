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
                <div class="alert alert-error mb-3"><i class="fa-solid fa-circle-exclamation" style="margin-right: 8px;"></i> <%= message %></div>
            <% } %>

            <% 
               String emailError = (String) request.getAttribute("email_error");
               String passwordError = (String) request.getAttribute("password_error");
               String enteredEmail = (String) request.getAttribute("email");
               if (enteredEmail == null) enteredEmail = "";
            %>

            <form action="login" method="post" id="loginForm" novalidate>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required 
                           class="<% if(emailError != null) out.print("is-invalid"); %>"
                           value="<%= enteredEmail %>" />
                    <div class="invalid-feedback" id="emailError" style="<% if(emailError != null) out.print("display:block;"); %>">
                        <%= emailError != null ? emailError : "" %>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required 
                           class="<% if(passwordError != null) out.print("is-invalid"); %>" />
                    <div class="invalid-feedback" id="passwordError" style="<% if(passwordError != null) out.print("display:block;"); %>">
                        <%= passwordError != null ? passwordError : "" %>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" style="width: 100%; font-size: 1.1rem; padding: 0.8rem;"><i class="fa-solid fa-right-to-bracket"></i> Login to Account</button>
                
                <div class="text-center mt-3">
                    <p class="text-muted">Don't have an account? <a href="register">Sign up here</a></p>
                </div>
            </form>

            <script>
                document.getElementById('loginForm').addEventListener('submit', function(event) {
                    let isValid = true;
                    const email = document.getElementById('email');
                    const password = document.getElementById('password');
                    const emailErrorDiv = document.getElementById('emailError');
                    const passwordErrorDiv = document.getElementById('passwordError');
                    
                    // Reset styling
                    email.classList.remove('is-invalid');
                    password.classList.remove('is-invalid');
                    emailErrorDiv.style.display = 'none';
                    passwordErrorDiv.style.display = 'none';
                    
                    if (!email.value.trim()) {
                        email.classList.add('is-invalid');
                        emailErrorDiv.innerText = 'Email is required';
                        emailErrorDiv.style.display = 'block';
                        isValid = false;
                    } else if (!/^\S+@\S+\.\S+$/.test(email.value)) {
                        email.classList.add('is-invalid');
                        emailErrorDiv.innerText = 'Enter a valid email';
                        emailErrorDiv.style.display = 'block';
                        isValid = false;
                    }
                    
                    if (!password.value.trim()) {
                        password.classList.add('is-invalid');
                        passwordErrorDiv.innerText = 'Password is required';
                        passwordErrorDiv.style.display = 'block';
                        isValid = false;
                    }
                    
                    if (!isValid) {
                        event.preventDefault(); // Stop form submission if invalid
                    }
                });
                
                // Real-time validation removal on input
                document.querySelectorAll('#loginForm input').forEach(input => {
                    input.addEventListener('input', function() {
                        this.classList.remove('is-invalid');
                        const errorDiv = this.id === 'email' ? document.getElementById('emailError') : document.getElementById('passwordError');
                        if (errorDiv) {
                            errorDiv.style.display = 'none';
                        }
                    });
                });
            </script>
        </div>
    </div>
</body>
</html>