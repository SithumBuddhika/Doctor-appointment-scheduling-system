package com.example.util;

import com.example.dao.AppointmentDAO;
import com.example.dao.AppointmentDAOImpl;
import com.example.model.Appointment;

//This utility class for Appointments Conflicts
//Conflict Checking Utility
public class ConflictChecker {
    private static AppointmentDAO appointmentDAO = new AppointmentDAOImpl();

    public static boolean hasConflicts(Appointment appointment) {
        return appointmentDAO.checkConflicts(appointment.getDoctorId(), appointment.getDate(), appointment.getStartTime(), appointment.getEndTime());
    }
}


