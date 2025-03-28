package com.example.dao;
import java.util.List;
import com.example.model.Appointment;

//This is the DAO Interface
public interface AppointmentDAO {
    boolean insert(Appointment appointment);
    boolean checkConflicts(String doctorId, String date, String startTime, String endTime);
    boolean update(Appointment appointment);
    boolean delete(int id);
    
    // New method for fetching appointments for a specific day and doctor
    List<Appointment> getAppointmentsByDayAndDoctor(String day, String docID);
}
