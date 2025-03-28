package com.example.controller;

import com.example.model.CompletedAppointment;
import com.example.service.AppointmentService;
import com.example.service.AppointmentServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updatea")
public class UpdateAppointment extends HttpServlet {

	//private AppointmentDAO appointmentDAO = new AppointmentDAOImpl();
	private AppointmentService appointmentService = new AppointmentServiceImpl();
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int appID = Integer.parseInt(request.getParameter("appID"));
    	String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String breakTime = request.getParameter("breakTime");
        String status = request.getParameter("status");

                
        
        CompletedAppointment appointment = new CompletedAppointment(appID, date, startTime, endTime, duration, breakTime, status);
        //response.getWriter().write(appointment.getAppID() + " | " + appointment.getDate() + " | " + appointment.getStartTime() + " | " + appointment.getEndTime() + " | " + appointment.getAppointmentDuration() + " | " + appointment.getBreakTime() + " | " + appointment.getStatus() + " | ");
        boolean updated = appointmentService.updateAppointment(appointment);
        if (updated) {
            //response.sendRedirect("appointments?day=" + request.getParameter("day") + "&docID=" + request.getParameter("docID"));
        	request.getSession().setAttribute("messageU", "Appointment Successfully Updated");
        } else {
        	request.getSession().setAttribute("messageU", "Failed to Update Appointment");
        }
        
	    response.sendRedirect("readappoint.jsp");
    }
}