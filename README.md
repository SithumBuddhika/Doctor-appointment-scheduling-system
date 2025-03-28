🔍 Project Overview
This system enables doctors to manage their appointment availability, schedule sessions, and update booking statuses through a clean, intuitive dashboard. Built using Java EE, it’s designed to simulate real-world hospital workflows and follows clean architectural principles like MVC, DAO, and service layer abstraction.

> 🎯 Focus Module: Doctor Appointment Scheduling
> 👨‍⚕️ Role: Doctor Appointment Scheduling System Implementation (Developed by Sithum Buddhika)
> 📅 Development: Agile Environment using Jira

-----------------------------

🛠️ Tech Stack
- Language: Java (Servlets, JSP)

- Backend: MVC Architecture + DAO + Service Layer

- Database: MySQL (SQL Workbench)

- Server: Apache Tomcat 10.1.26

- IDE: Eclipse

- Version Control: GitHub

-----------------------------

>💡 Key Features
-📅 Doctor Availability Setup
-Doctors can select one time slot per day and update or delete it.

>📝 Appointment Scheduling
-Add new appointments with time, duration, and special notes.

>📋 Dashboard View
-View, update, and delete appointments inline.

>🛡️ Validation
-Prevents overlapping or duplicate appointments.

>💬 Feedback
Real-time success/failure messages for all actions.

-----------------------------

🧠 Core Concepts Applied
> Encapsulation – via Java model classes (Appointment, ScheduledAppointment)

> Abstraction – interfaces for DAO and service layers

> Inheritance – specialized appointments extend the base class

> Modularity – DatabaseConnection handles DB setup logic

> MVC Pattern – clean separation of model, controller, and view

-----------------------------

🔁 CRUD Functionalities

> Create – Form submission handled via AppointmentController → service → DAO.

> Read – Fetch doctor-specific appointments per day (readappoint.jsp).

> Update – Inline edit via readappointmentdashboard.jsp, processed in UpdateAppointment.

> Delete – Remove appointments with confirmation in DeleteAppointment.

-----------------------------

🔄 Process Flow
Doctor logs in → views or sets availability.

Submits form → Servlet → Service → DAO → MySQL.

Appointments are rendered dynamically with status options.

Updates and deletions handled with real-time UI feedback.

-----------------------------

📦 Folder Structure
Doctor-appointment-scheduling-system/
├── src/                        # Java source files (Model, DAO, Service, Controller)
│   └── com/example/...
├── WebContent/                # JSP pages, CSS, JS files
│   └── screenshots/           # (Optional) Screenshots for README/docs
├── database/                  # MySQL DB script
│   └── DocAppointments.sql
├── lib/                       # External JAR libraries (if needed)
├── .classpath                 # Eclipse config
├── .project                   # Eclipse config
├── .gitignore                 # Git ignored files
└── README.md                  # This file

-----------------------------

🚀 How to Run

1. Clone the repository:
  git clone https://github.com/SithumBuddhika/Doctor-appointment-scheduling-system.git

2.Open Eclipse → Import as an Existing Java EE Project

3.Set up Apache Tomcat 10.1.26

4.Create a MySQL database and import:
  database/DocAppointments.sql

5.Update DB credentials in DatabaseConnection.java

6.Run the project on server and access JSP interfaces via browser
