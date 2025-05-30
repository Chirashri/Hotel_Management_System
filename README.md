<h1 align="center">🏨 Hotel Management System</h1>

<p align="center">
  A web-based hotel reservation system built with Java Servlets, JSP, and MySQL for efficient hotel booking management.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white"/>
  <img src="https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=java&logoColor=white"/>
  <img src="https://img.shields.io/badge/Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black"/>
  <img src="https://img.shields.io/badge/MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white"/>
</p>

---

## 🚀 Features

- ✅ Add new reservations
- ✏️ Update existing bookings
- ❌ Delete bookings
- 📂 View all reservations
- 📅 Generate reports:
  - By date range
  - Revenue summary
  - Most frequently booked room

---

## 🧰 Tech Stack

| Layer        | Technology               |
|--------------|---------------------------|
| Backend      | Java Servlets, JDBC       |
| Frontend     | JSP, HTML, CSS            |
| Database     | MySQL                     |
| Server       | Apache Tomcat             |
| Build Tool   | Manual / IDE based        |

---

## 🏗️ Project Structure

```bash
HotelManagementSystem/
├── WebContent/
│   ├── reservationadd.jsp
│   ├── reservationupdate.jsp
│   ├── reservationdisplay.jsp
│   ├── confirmation.jsp
│   ├── report.jsp
│   └── report_result.jsp
├── src/
│   └── com/
│       └── hotel/
│           ├── dao/
│           │   └── ReservationDao.java
│           ├── model/
│           │   └── Reservation.java
│           └── servlet/
│               ├── AddReservationServlet.java
│               ├── UpdateReservationServlet.java
│               ├── DeleteReservationServlet.java
│               ├── DisplayReservationServlet.java
│               └── ReportServlet.java
└── DB/
    └── hotel_db.sql

```

⚙️ Setup Instructions
1. 🛢️ Database Setup
Import the SQL file:

mysql -u root -p < hotel_db.sql

Update credentials in ReservationDao.java:

private String jdbcURL = "jdbc:mysql://localhost:3306/hotel_db";

private String jdbcUsername = "root";

private String jdbcPassword = "your_password";
----------------------

🧩 Run the Project
Open in Eclipse, NetBeans, or IntelliJ.

Configure Apache Tomcat server.

Deploy project to Tomcat.

Visit in browser:(http://localhost:8080/Hotel_WebApp/)

