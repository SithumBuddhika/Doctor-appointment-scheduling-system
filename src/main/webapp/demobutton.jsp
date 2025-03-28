<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="stylesdash.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
                       <button onclick="deleteAppoint(14)" class="btn btn-sm delete-btn">
                       		Delete <span class="btn-icon">✕</span>
                      </button>
                      
<script src="scriptdash.js"></script>
<script>
    // Departments are selected and the backend error messages are cleared upon reloading
    window.onload = function() {
        <% 
            // Retrieve the message from the session
            String message = (String) request.getSession().getAttribute("messageU");
            if (message != null) {
                // Clear the message from the session after retrieving it
                request.getSession().removeAttribute("messageU"); 
        %>
            alert("<%= message %>");
        <% 
            } 
        %>
    };
</script>
</body>
</html>