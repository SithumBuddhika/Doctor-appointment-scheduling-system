package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//This is for Database Connection
public class DatabaseConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/dcoappoitments";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Sithum";
      
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading MySQL Driver", e);
        }
    }

    // Method to get a connection instance
    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error connecting to the database", e);
        }
        return connection;
    }
}


