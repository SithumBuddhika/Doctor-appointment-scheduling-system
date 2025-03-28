package com.example.model;

//This is the Appointment Base Class and Child classes are Extends from it
public class Appointment {
	protected int appID;
    protected String doctorId;
    protected String date;
    protected String day;
    protected String startTime;
    protected String endTime;
    protected int appointmentDuration;
    protected int maxAppointments;
    protected String breakTime;
    protected String specialNote;
    protected String status; 

    public Appointment(String doctorId, String date, String day, String startTime, String endTime, int appointmentDuration, int maxAppointments, String breakTime, String specialNote, String status) {
        this.doctorId = doctorId;
        this.date = date;
        this.day = day;
        this.startTime = startTime;
        this.endTime = endTime;
        this.appointmentDuration = appointmentDuration;
        this.maxAppointments = maxAppointments;
        this.breakTime = breakTime;
        this.specialNote = specialNote;
        this.status = status;
    }

    public Appointment(int appID,String date, String startTime, String endTime, int appointmentDuration, String breakTime, String status) {
        this.appID = appID;
        this.date = date;
        this.startTime = startTime;
        this.endTime = endTime;
        this.appointmentDuration = appointmentDuration;
        this.breakTime = breakTime;
        this.status = status;
    }
    
 // Getters and setters for common properties
    
    public int getAppID() { return appID; }
	public String getDoctorId() { return doctorId; }
    public String getDate() { return date; }
    public String getDay() { return day; }
    public String getStartTime() { return startTime; }
    public String getEndTime() { return endTime; }
    public int getAppointmentDuration() { return appointmentDuration; }
    public int getMaxAppointments() { return maxAppointments; }
    public String getBreakTime() { return breakTime; }
    public String getSpecialNote() { return specialNote; }
    public String getStatus() {return status;}
    
    public void setAppID(int appID) { this.appID = appID; }
    public void setStartTime(String startTime) { this.startTime = startTime; }
    public void setEndTime(String endTime) { this.endTime = endTime; }
    public void setAppointmentDuration(int appointmentDuration) { this.appointmentDuration = appointmentDuration; }
    public void setBreakTime(String breakTime) { this.breakTime = breakTime; }
    public void setStatus(String status) { this.status = status; }
}

