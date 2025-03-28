package com.example.service;

import com.example.dao.AppointmentDAO;
import com.example.dao.AppointmentDAOImpl;
import com.example.model.Appointment;
import com.example.util.ConflictChecker;

//Works as Service Implementation
public class AppointmentServiceImpl implements AppointmentService {

    private AppointmentDAO appointmentDAO = new AppointmentDAOImpl();
    //Service Implementation For the CREATE Operation
    @Override
    public boolean createAppointment(Appointment appointment) {
        
    	// Conflict checking using utility class
        if (ConflictChecker.hasConflicts(appointment)) {
            return false;
        }
        
     // Call DAO to store the appointment in the database
        return appointmentDAO.insert(appointment);
    }
    
    //Service Implementation For UPDATE Operation
    @Override
    public boolean updateAppointment(Appointment appointment) {
//        if (ConflictChecker.hasConflicts(appointment)) {
//            return false;  // Conflict found, do not update
//        }
        return appointmentDAO.update(appointment);
    }

    //Service Implementation For DELETE Operation
    @Override
    public String deleteAppointment(int id) {
        boolean isDeleted = appointmentDAO.delete(id);
        if (isDeleted) {
            return "Appointment successfully Deleted";
        } else {
            return "Failed to delete the appointment";
        }
    }


}
