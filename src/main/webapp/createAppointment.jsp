<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="styles.css">
<script src="https://kit.fontawesome.com/d77fca0f98.js" crossorigin="anonymous"></script>
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
	    <h1 class="title">Doctor's Appointment Scheduler Form  <i class="fa-solid fa-user-doctor"></i> </h1>
	    <button class="dashboard-btn" onclick="window.location.href='doctorDashboard.jsp'">Appointment Dashboard       <i class="fa-solid fa-chart-simple"></i></button>
	</div>

    <div class="container">
        <main>
        <!-- Schedule Form Begins here -->
       		<p id="errorMessage" class="error"></p> <!-- Error message container -->
			<form id="appointmentForm" action="AppointmentController" method="post">
			    <div class="form-row">
			        <div class="form-group">
			            <label for="doctorId">Doctor ID</label>
			            <input type="text" id="doctorId" name="doctorId" placeholder="<%= session.getAttribute("username") %>" value="<%= session.getAttribute("username") %>" readonly>
			        </div>
			        <div class="form-group">
			            <label for="day">Day</label>
			            <select id="day" name="day" required>
			                <option value="Monday">Monday</option>
			                <option value="Tuesday">Tuesday</option>
			                <option value="Wednesday">Wednesday</option>
			                <option value="Thursday">Thursday</option>
			                <option value="Friday">Friday</option>
			                <option value="Saturday">Saturday</option>
			                <option value="Sunday">Sunday</option>
			            </select>
			        </div>
			    </div>
			    <div class="form-row">
			        <div class="form-group">
			            <label for="date">Date</label>
			            <input type="date" id="date" name="date" required>
			        </div>
			        <div class="form-group">
			            <label for="appointmentDuration">Appointment Duration</label>
			            <select id="appointmentDuration" name="duration" required>
			                <option value="15">15</option>
			                <option value="30">30</option>
			                <option value="45">45</option>
			                <option value="60">60</option>
			            </select>
			        </div>
			    </div>
			    <div class="form-row">
			        <div class="form-group">
			            <label for="startTime">Start Time</label>
			            <input type="time" id="startTime" name="startTime" required>
			        </div>
			        <div class="form-group">
			            <label for="endTime">End Time</label>
			            <input type="time" id="endTime" name="endTime" required>
			        </div>
			    </div>
			    <div class="form-row">
			        <div class="form-group">
			            <label for="breakTime">Break Time</label>
			            <input type="time" id="breakTime" name="breakTime">
			        </div>
			        <div class="form-group">
			            <label for="maxAppointments">Maximum Appointments for the Day</label>
			            <input type="number" id="maxAppointments" name="maxAppointments" min="1" required>
			        </div>
			    </div>
			    <div class="form-group full-width">
			        <label for="specialNotes">Special Notes</label>
			        <textarea id="specialNotes" name="specialNote" rows="3" placeholder="Any special instructions or notes for this day's appointments."></textarea>
			    </div>
			    <div>
			        <label for="status">Status</label>
			        <input type="text" name="status" required>
			    </div>
			    <button type="submit" onclick="validateForm(event)" class="btn-save">Save Schedule</button>
			</form> 		
        </main>
    </div>
    <footer class="footer">
        <div class="container1">
            <div class="footer-content">
                <div>
                    <h3>About Us</h3>
                    <p>We are a company dedicated to providing excellent services and products to our customers.</p>
                </div>
                <div>
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="/services">Services</a></li>
                        <li><a href="/products">Products</a></li>
                        <li><a href="/contact">Contact</a></li>
                    </ul>
                </div>
                <div>
                    <h3>Contact Us</h3>
                    <address>
                        <p>123 Main Street</p>
                        <p>Anytown, USA 12345</p>
                        <p>Email: <a href="mailto:info@example.com">info@example.com</a></p>
                        <p>Phone: <a href="tel:+11234567890">(123) 456-7890</a></p>
                    </address>
                </div>
                <div>
                    <h3>Follow Us</h3>
                    <div class="social-links">
                        <a href="https://facebook.com" aria-label="Follow us on Facebook">
                            <svg viewBox="0 0 24 24">
                                <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
                            </svg>
                        </a>
                        <a href="https://twitter.com" aria-label="Follow us on Twitter">
                            <svg viewBox="0 0 24 24">
                                <path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path>
                            </svg>
                        </a>
                        <a href="https://instagram.com" aria-label="Follow us on Instagram">
                            <svg viewBox="0 0 24 24">
                                <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                                <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                                <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
                            </svg>
                        </a>
                        <a href="https://linkedin.com" aria-label="Follow us on LinkedIn">
                            <svg viewBox="0 0 24 24">
                                <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path>
                                <rect x="2" y="9" width="4" height="12"></rect>
                                <circle cx="4" cy="4" r="2"></circle>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; <script>document.write(new Date().getFullYear())</script> Your Company Name. All rights reserved.</p>
            </div>
        </div>
    </footer>
    <script src="script.js"></script>
</body>
</html>