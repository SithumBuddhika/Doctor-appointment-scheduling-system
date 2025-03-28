package com.example.model;

//This class is for Completed appointments. (Child Class)
public class CompletedAppointment extends Appointment {
    public CompletedAppointment(int appID,String date, String startTime, String endTime, int appointmentDuration, String breakTime, String status) {
        super(appID,date, startTime, endTime, appointmentDuration, breakTime, status);
    }
}
