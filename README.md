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

## 📸 Screenshots

> Upload these screenshots in your repo (`/screenshots/` folder) and replace URLs below accordingly.

### 📋 Reservation Form
[for reservation]:(<https://github.com/Chirashri/Hotel_Management_System/blob/main/addreservation.png>)

### 📊 Reports Page
[viewing the reporte]:(<https://github.com/Chirashri/Hotel_Management_System/blob/main/viewreservation.png>)

### 📃 Confirmation Page
<img src="screenshots/confirmation_page.png" alt="Confirmation Page" width="700"/>

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
