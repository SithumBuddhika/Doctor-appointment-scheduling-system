package com.example.dao;

import com.example.model.Appointment;
import com.example.util.DatabaseConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAOImpl implements AppointmentDAO {

    @Override
    public boolean insert(Appointment appointment) {
        try {
        	String url = "jdbc:mysql://localhost:3306/dcoappoitments";
            String user = "root";
            String password = "Sithum";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String query = "INSERT INTO appointments (DocID, Date, Day, StartTime, EndTime, AppointmentDuration, MaximumAppointments, BreakTime, SpecialNote, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, appointment.getDoctorId());
            stmt.setString(2, appointment.getDate());
            stmt.setString(3, appointment.getDay());
            stmt.setString(4, appointment.getStartTime());
            stmt.setString(5, appointment.getEndTime());
            stmt.setInt(6, appointment.getAppointmentDuration());
            stmt.setInt(7, appointment.getMaxAppointments());
            stmt.setString(8, appointment.getBreakTime());
            stmt.setString(9, appointment.getSpecialNote());
            stmt.setString(10, appointment.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
        	System.out.println("Hello World!!");
            e.printStackTrace();
            return false;
        }
        
    }

    @Override
    public boolean checkConflicts(String doctorId, String date, String startTime, String endTime) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM appointments WHERE DocID = ? AND Date = ? AND (StartTime < ? AND  EndTime> ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, doctorId);
            stmt.setString(2, date);
            stmt.setString(3, endTime);
            stmt.setString(4, startTime);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public List<Appointment> getAppointmentsByDayAndDoctor(String day, String docID) {
        List<Appointment> appointments = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT AppID, Date, StartTime, EndTime, AppointmentDuration, BreakTime, Status " +
                           "FROM appointments WHERE Day = ? AND DocID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, day);
            stmt.setString(2, docID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Appointment appointment = new Appointment(
                    rs.getInt("AppID"),
                    rs.getString("Date"),
                    rs.getString("StartTime"),
                    rs.getString("EndTime"),
                    rs.getInt("AppointmentDuration"),
                    rs.getString("BreakTime"),
                    rs.getString("Status")
                );
                appointments.add(appointment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointments;
    }
    
    @Override
    public boolean update(Appointment appointment) {
        try{
        	String url = "jdbc:mysql://localhost:3306/dcoappoitments";
            String user = "root";
            String password = "Sithum";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String query = "UPDATE appointments SET Date = ?, StartTime = ?, EndTime = ?, AppointmentDuration = ?, BreakTime = ?, Status = ? WHERE AppID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, appointment.getDate());
            stmt.setString(2, appointment.getStartTime());
            stmt.setString(3, appointment.getEndTime());
            stmt.setInt(4, appointment.getAppointmentDuration());
            stmt.setString(5, appointment.getBreakTime());
            stmt.setString(6, appointment.getStatus());
            stmt.setInt(7, appointment.getAppID());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public boolean delete(int id) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "DELETE FROM appointments WHERE AppID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
