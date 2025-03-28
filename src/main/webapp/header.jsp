<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="headerPage/styles_header.css">
</head>
<body>
	<header class="headerhd">
            <div class="headerhd-content">
            	<div>
                    <a href="doctorShiftPage.jsp" class="logo">medi<span>son</span></a>
                </div>
                <div class="auth-buttons">
                    <% 	if (session.getAttribute("username") != null) { 
				    %>		
						    <form action="LogoutServlet" method="post">
					    		<button type="submit" id="logout" class="btnhd">logout</button>
			    			</form>
				    		<a href="doctorDashboard.jsp" class="btnhd"><%= session.getAttribute("username") %></a>
				    <% 	} else { 
				    %>		<a href="login.jsp" class="btnhd">SignIn</a>
				       	 	<a href="register.jsp" class="btnhd">SignOut</a>
				    <% 	} 
				    %>
                </div>
            </div>
    </header>
</body>
</html>


