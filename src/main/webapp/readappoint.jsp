<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.model.Appointment" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="stylesdash.css">
<script src="https://kit.fontawesome.com/d77fca0f98.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- Check if the user is logged in -->
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("username") == null){
		response.sendRedirect("login.jsp");
	}
%>
<body>
	<div class="container">
        <h1 class="title">Doctor Appointment Dashboard <i class="fa-solid fa-notes-medical"></i></h1>
        <button class="btndd" onclick="window.location.href='createAppointment.jsp'"><i class="fa-solid fa-book"></i>Scheduler</button>
        <div class="tabs">
            <div class="tabs-list">
                <button class="tab-trigger" data-day="Monday"><a href="readappoint?day=Monday&docID=<%= session.getAttribute("username") %>">Monday</a></button>
                <button class="tab-trigger" data-day="Tuesday"><a href="readappoint?day=Tuesday&docID=<%= session.getAttribute("username") %>">Tuesday</a></button>
                <button class="tab-trigger" data-day="Wednesday"><a href="readappoint?day=Wednesday&docID=<%= session.getAttribute("username") %>">Wednesday</a></button>
                <button class="tab-trigger" data-day="Thursday"><a href="readappoint?day=Thursday&docID=<%= session.getAttribute("username") %>">Thursday</a></button>
                <button class="tab-trigger" data-day="Friday"><a href="readappoint?day=Friday&docID=<%= session.getAttribute("username") %>">Friday</a></button>
                <button class="tab-trigger" data-day="Saturday"><a href="readappoint?day=Saturday&docID=<%= session.getAttribute("username") %>">Saturday</a></button>
                <button class="tab-trigger" data-day="Sunday"><a href="readappoint?day=Sunday&docID=<%= session.getAttribute("username") %>">Sunday</a></button>
            </div>
            <div id="tab-content" class="tab-content">
                <div id="appointmentsContainer">
    <% 
        // Check if appointments list is not empty
        if (request.getAttribute("appointments") != null) {
            List <Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
           
            String day = (String) request.getAttribute("day");
    %>
        <div class="card-header">

                    <p class="card-description">
                        <h3><i class="fa-solid fa-calendar-day"></i> <%= day %> </h3>
                        <p><%= appointments.size() %> Appointments Scheduled   <i class="fa-solid fa-house-medical-circle-check"></i></p>
                    </p>
        </div>
        <% for (Appointment appointment : appointments) { %>
            <div class="appointment-card">
                <form id="updform" action="updatea" method="post">
                    
                <div class="appointment-card" > 
	           		<div class="appointment-details">
	                       <div class="appointment-time">
	                       <input type="hidden" name="appID" value="<%= appointment.getAppID() %>" />
	                           <span class="bold">Time:</span> 
	                           <input type="time" id="startTime" class="inline-edit" name="startTime" required  value="<%= appointment.getStartTime() %>"/ > - 
	                           <input type="time" id="endTime" class="inline-edit" name="endTime" value="<%= appointment.getEndTime() %>" />
	                       </div>
	                       <span class="appointment-status">
	                           <span class="bold">Status:</span>
	                           <input type="text" id="status" name="status" class="inline-edit" required value="<%= appointment.getStatus() %>" />
	                       </span>
	                </div>
	                <div class="appointment-info">
	                     <span class="bold">Duration:</span> 
	                     <input type="number" id="duration" name="duration" class="inline-edit" required value="<%= appointment.getAppointmentDuration() %>" />  mins |
	                     <span class="bold">Break Time:</span> 
	                     <input type="time" id="breakTime" class="inline-edit" name="breakTime" value="<%= appointment.getBreakTime() %>" />
	                </div>
	                <div class="appointment-info">
	                     <span class="bold">Date :</span> 
	                     <input type="date" id="date" name="date" class="inline-edit" required value="<%= appointment.getDate() %>" />
	                     <p id="errorMessage" class="error" style="color: red;"></p> <!-- Error message container -->
	                </div>
	                <div class="appointment-actions">
                       <button type="submit" onclick="updvalidateForm(event)" class="btn btn-sm update-btn">
                           Update <span class="btn-icon">⚙</span>
                       </button>
                       <button class="btn btn-sm delete-btn">
	                       <a href="delapp?appID=<%= appointment.getAppID() %>" onclick="return confirm('Are you sure you want to delete this appointment?');">
	                       		Delete <span class="btn-icon">✕</span>
	                       </a>
                       </button>
                      
                   	</div>
              	</div>
                                
                </form>
                
            </div>
            
        <% } %>
    <% 
        }
    %>
</div>

            </div>
            
        </div>

        
    </div>
            
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