<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
        background: linear-gradient(to right, #dae2f8, #d6a4a4);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .container {
        background-color: #ffffff;
        padding: 40px 35px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 650px;
    }
    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #2e7d32;
    }
    label {
        font-weight: 600;
    }
    .form-control {
        border-radius: 12px;
        height: 45px;
    }
    .btn-update {
        background-color: #43a047;
        border: none;
        border-radius: 25px;
        padding: 12px;
        font-size: 16px;
        font-weight: 600;
        transition: background-color 0.3s ease;
    }
    .btn-update:hover {
        background-color: #2e7d32;
    }
    .btn-home {
    background-color: #d291bc;
    color: white;
    font-weight: bold;
    padding: 10px 20px;
    border-radius: 30px;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-block;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.btn-home:hover {
    background-color: #c471b9;
    color: white;
    transform: scale(1.05);
}
    
</style>

</head>
<body>
<div class="container">
    <h2>Update Reservation</h2>
    <form action="UpdateReservationServlet" method="post">
        <div class="mb-3">
            <label for="reservationID" class="form-label">Reservation ID</label>
            <input type="text" class="form-control" id="reservationID" name="reservationID" required>
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
        <div class="mb-4">
            <label for="totalAmount" class="form-label">Total Amount</label>
            <input type="text" class="form-control" id="totalAmount" name="totalAmount" required>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-update">Update Reservation</button>
        </div>
        <div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-home">🏠 Back to Home</a>
</div>
        
    </form>
</div>
</body>
</html>
