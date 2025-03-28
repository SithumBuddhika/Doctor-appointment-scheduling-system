<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
	<link rel="stylesheet" href="loginPage/styles.css">
</head>
<body>
    <div class="login-container" style="background-image: url('/images/login-cover.jpg');">
        <h2 class="brand-name">Medison Hospital</h2>
        <h2>Login to Your Account</h2>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                
                <input type="text" id="username" name="username" placeholder="Username" required>
            </div>
            <div class="form-group">
                
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="login-btn">Login</button>
            <p class="error-message"><b>${errorMessage}</b></p>
        </form>
    </div>
    
    <script>
	    window.onload = function() {
	        <% 
	            // Retrieve the message from the session
	            String message = (String) request.getSession().getAttribute("messageLogout");
	            if (message != null) {
	                // Clear the message from the session after retrieving it
	                request.getSession().removeAttribute("messageLogout"); 
	        %>
	            alert("<%= message %>");
	        <% 
	            } 
	        %>
	    };
	</script>
</body>
</html>