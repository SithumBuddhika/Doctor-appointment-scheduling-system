package com.example.controller;

import com.example.model.ScheduledAppointment;
import com.example.service.AppointmentService;
import com.example.service.AppointmentServiceImpl;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.example.dao.AppointmentDAO;
import com.example.dao.AppointmentDAOImpl;
import com.example.model.Appointment;
import jakarta.servlet.ServletException;
import java.util.List;

//The controller manages the form submission and passes data to the service layer.

@WebServlet("/AppointmentController")
public class AppointmentController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AppointmentService appointmentService = new AppointmentServiceImpl();
	
	// This method handles the form submission for creating an appointment
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String doctorId = request.getParameter("doctorId");
        String date = request.getParameter("date");
        String day = request.getParameter("day");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        int appointmentDuration = Integer.parseInt(request.getParameter("duration"));
        int maxAppointments = Integer.parseInt(request.getParameter("maxAppointments"));
        String breakTime = request.getParameter("breakTime");
        String specialNote = request.getParameter("specialNote");
        String status = request.getParameter("status");

        ScheduledAppointment appointment = new ScheduledAppointment(doctorId, date, day, startTime, endTime, appointmentDuration, maxAppointments, breakTime, specialNote, status);
        
        // Pass the appointment to the service layer
        boolean isCreated = appointmentService.createAppointment(appointment);

        if (isCreated) {
        	request.getSession().setAttribute("messageU", "Appointment Successfully Created");
        }        
        else {
            request.getSession().setAttribute("messageU", "Failed to Create Appointment");
        }
        response.sendRedirect("createAppointment.jsp");
//        response.getWriter().write(doctorId + " | " + date + " | " + startTime + " | " + endTime + " | " + appointmentDuration + " | " + maxAppointments + " | " + breakTime + " | " + specialNote);
    
       
    }
    private AppointmentDAO appointmentDAO = new AppointmentDAOImpl();

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String day = request.getParameter("day");
        String docID = request.getParameter("doctorId");

        // Fetch appointments for the given day and doctor
        List<Appointment> appointments = appointmentDAO.getAppointmentsByDayAndDoctor(day, docID);

        // Set the attributes to forward the result to the JSP page
        request.setAttribute("day", day);
        request.setAttribute("appointments", appointments);

        // Forward the data to the JSP page for rendering
        request.getRequestDispatcher("doctorDashboard.jsp").forward(request, response);
    }
}
