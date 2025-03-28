<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.model.Appointment" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="stylesdash.css">
<script src="https://kit.fontawesome.com/d77fca0f98.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- Check if the user is logged in -->
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("username") == null){
			response.sendRedirect("login.jsp");
		}
	%>
	<div class="container">
        <h1 class="title">Doctor Appointment Dashboard <i class="fa-solid fa-notes-medical"></i></h1>
        <button class="btndd" onclick="window.location.href='createAppointment.jsp'"><i class="fa-solid fa-book"></i>Scheduler</button>
        <div class="tabs">
            <div class="tabs-list">
                <button class="tab-trigger active" data-day="Monday"><a href="readappoint?day=Monday&docID=<%= session.getAttribute("username") %>">Monday</a></button>
                <button class="tab-trigger" data-day="Tuesday"><a href="readappoint?day=Tuesday&docID=<%= session.getAttribute("username") %>">Tuesday</a></button>
                <button class="tab-trigger" data-day="Wednesday"><a href="readappoint?day=Wednesday&docID=<%= session.getAttribute("username") %>">Wednesday</a></button>
                <button class="tab-trigger" data-day="Thursday"><a href="readappoint?day=Thursday&docID=<%= session.getAttribute("username") %>">Thursday</a></button>
                <button class="tab-trigger" data-day="Friday"><a href="readappoint?day=Friday&docID=<%= session.getAttribute("username") %>">Friday</a></button>
                <button class="tab-trigger" data-day="Saturday"><a href="readappoint?day=Saturday&docID=<%= session.getAttribute("username") %>">Saturday</a></button>
                <button class="tab-trigger" data-day="Sunday"><a href="readappoint?day=Sunday&docID=<%= session.getAttribute("username") %>">Sunday</a></button>
            </div>
            <div id="tab-content" class="tab-content">
                <!-- Tab content will be dynamically inserted here -->
            </div>
        </div>
    </div>
    
<script src="scriptdash.js"></script>
</body>
</html>