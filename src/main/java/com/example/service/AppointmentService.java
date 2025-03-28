package com.example.service;

import com.example.model.Appointment;

//Works as Interface
public interface AppointmentService {
    boolean createAppointment(Appointment appointment);
    boolean updateAppointment(Appointment appointment);
    String deleteAppointment(int id);
}
