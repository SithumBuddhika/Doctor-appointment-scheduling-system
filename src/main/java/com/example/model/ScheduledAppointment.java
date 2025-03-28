package com.example.model;

//This class is for newly scheduled appointments. (Child Class)
public class ScheduledAppointment extends Appointment {

    public ScheduledAppointment(String doctorId, String date, String day, String startTime, String endTime, int appointmentDuration, int maxAppointments, String breakTime, String specialNote, String status) {
        super(doctorId, date, day, startTime, endTime, appointmentDuration, maxAppointments, breakTime, specialNote, status);
    }

    
}
