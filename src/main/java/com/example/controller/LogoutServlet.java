package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Invalidate the session to log the user out
        HttpSession session = request.getSession(false);
        if (session != null) {
        	session.removeAttribute("username");
            session.invalidate(); // Invalidate the session
            
            request.getSession().setAttribute("messageLogout", "Successfully Logged out");
        }

        // Redirect to the login page or home page
        response.sendRedirect("login.jsp");
	}
}