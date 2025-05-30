<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #dae2f8, #d6a4a4);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .reservation-form {
            background: rgba(255, 255, 255, 0.85);
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 35px;
            color: #2c3e50;
            font-weight: 700;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: 600;
            color: #34495e;
        }

        .form-control {
            border-radius: 10px;
            box-shadow: none;
            border: 1px solid #ced4da;
        }

        .form-control:focus {
            border-color: #8e44ad;
            box-shadow: 0 0 0 0.15rem rgba(142, 68, 173, 0.25);
        }

        .btn-primary {
            background: linear-gradient(135deg, #8e44ad, #3498db);
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 12px;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #6c3483, #2e86c1);
        }
    </style>
</head>
<body>
<div class="reservation-form">
    <h2>📝 New Reservation</h2>
    <form action="AddReservationServlet" method="post">
        <div class="mb-3">
            <label for="reservationId" class="form-label">Reservation ID</label>
            <input type="text" class="form-control" id="reservationId" name="reservationId" required>
        </div>
        <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="mb-3">
            <label for="roomNumber" class="form-label">Room Number</label>
            <input type="text" class="form-control" id="roomNumber" name="roomNumber" required>
        </div>
        <div class="mb-3">
            <label for="checkIn" class="form-label">Check-In Date</label>
            <input type="date" class="form-control" id="checkIn" name="checkIn" required>
        </div>
        <div class="mb-3">
            <label for="checkOut" class="form-label">Check-Out Date</label>
            <input type="date" class="form-control" id="checkOut" name="checkOut" required>
        </div>
        <div class="mb-3">
            <label for="totalAmount" class="form-label">Total Amount (₹)</label>
            <input type="text" class="form-control" id="totalAmount" name="totalAmount" required>
        </div>
        <div class="d-grid mt-4">
            <button type="submit" class="btn btn-primary">✨ Submit Reservation</button>
        </div>
    </form>
</div>
</body>
</html>
