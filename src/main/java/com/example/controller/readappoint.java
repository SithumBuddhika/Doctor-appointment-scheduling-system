package com.example.controller;

import com.example.dao.AppointmentDAO;
import com.example.dao.AppointmentDAOImpl;
import com.example.model.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/readappoint")

public class readappoint extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AppointmentDAO appointmentDAO = new AppointmentDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String day = request.getParameter("day");
        String docID = request.getParameter("docID");

        // Fetch appointments for the given day and doctor
        List<Appointment> appointments = appointmentDAO.getAppointmentsByDayAndDoctor(day, docID);

        // Set the attributes to forward the result to the JSP page
        request.setAttribute("day", day);
        request.setAttribute("appointments", appointments);

        // Forward the data to the JSP page for rendering
        request.getRequestDispatcher("readappoint.jsp").forward(request, response);
    }
}

