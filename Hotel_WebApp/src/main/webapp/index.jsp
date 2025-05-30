<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hotel Management Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        @keyframes gradientShift {
            0% {background-position: 0% 50%;}
            50% {background-position: 100% 50%;}
            100% {background-position: 0% 50%;}
        }

        .dashboard-container {
            background: rgba(255, 255, 255, 0.12);
            border-radius: 25px;
            max-width: 960px;
            margin: 80px auto;
            padding: 60px 70px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(18px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: #fff;
        }

        .dashboard-title {
            text-align: center;
            font-size: 42px;
            font-weight: 800;
            color: #fdd835;
            margin-bottom: 50px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }

        .nav-links {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
        }

        .nav-item {
            background: linear-gradient(145deg, #ffecd2, #fcb69f);
            border-radius: 18px;
            padding: 25px 20px;
            text-align: center;
            text-decoration: none;
            color: #2c3e50;
            font-weight: 600;
            font-size: 18px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            transition: all 0.35s ease;
            position: relative;
            overflow: hidden;
        }

        .nav-item:hover {
            transform: translateY(-8px) scale(1.03);
            box-shadow: 0 14px 35px rgba(0, 0, 0, 0.2);
            color: #fff;
            background: linear-gradient(135deg, #ffd700, #ff4081);
        }

        .nav-item::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.2), transparent 70%);
            transform: rotate(25deg);
            opacity: 0;
            transition: opacity 0.5s;
        }

        .nav-item:hover::before {
            opacity: 1;
        }

        .nav-img {
            width: 60px;
            height: 60px;
            margin-bottom: 15px;
            transition: transform 0.3s;
        }

        .nav-item:hover .nav-img {
            transform: scale(1.1);
        }

        @media (max-width: 576px) {
            .dashboard-container {
                padding: 30px 20px;
            }
            .dashboard-title {
                font-size: 32px;
            }
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <div class="dashboard-title">🏨 Hotel Management System</div>
    <div class="nav-links">
        <a href="reservationadd.jsp" class="nav-item">
            <img src="https://cdn-icons-png.flaticon.com/512/992/992651.png" alt="Add" class="nav-img">
            Add Reservation
        </a>
        <a href="reservationupdate.jsp" class="nav-item">
            <img src="https://cdn-icons-png.flaticon.com/512/1159/1159633.png" alt="Update" class="nav-img">
            Update Reservation
        </a>
        <a href="reservationdelete.jsp" class="nav-item">
            <img src="https://cdn-icons-png.flaticon.com/512/1214/1214428.png" alt="Delete" class="nav-img">
            Delete Reservation
        </a>
        <a href="DisplayReservationsServlet" class="nav-item">
            <img src="https://cdn-icons-png.flaticon.com/512/3649/3649469.png" alt="View" class="nav-img">
            View Reservations
        </a>
        <a href="reports.jsp" class="nav-item">
            <img src="https://cdn-icons-png.flaticon.com/512/1828/1828919.png" alt="Reports" class="nav-img">
            Generate Reports
        </a>
    </div>
</div>
</body>
</html>
