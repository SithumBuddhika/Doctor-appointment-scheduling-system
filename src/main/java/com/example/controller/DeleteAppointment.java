package com.example.controller;

import com.example.service.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delapp")
public class DeleteAppointment extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private AppointmentService appointmentService = new AppointmentServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int Id = Integer.parseInt(request.getParameter("appID"));
	    
	    String result = appointmentService.deleteAppointment(Id);
	   // response.getWriter().write(" | " + Id + result + " | is taken for deletion");
	    request.getSession().setAttribute("messageU", result);
	    response.sendRedirect("readappoint.jsp");
	}

}
