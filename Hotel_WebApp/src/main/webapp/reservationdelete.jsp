<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Reservation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
    body {
        background: linear-gradient(to right, #dae2f8, #d6a4a4);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .container {
        background: rgba(255, 255, 255, 0.85);
        padding: 50px;
        border-radius: 20px;
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
        max-width: 500px;
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

    .btn-danger {
        background: linear-gradient(135deg, #c0392b, #e74c3c);
        border: none;
        padding: 12px;
        font-size: 16px;
        font-weight: 600;
        border-radius: 12px;
        transition: background 0.3s ease;
        width: 100%;
    }

    .btn-danger:hover {
        background: linear-gradient(135deg, #a93226, #c0392b);
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
    

    .error {
        color: red;
        text-align: center;
        font-weight: bold;
        margin-bottom: 15px;
    }
</style>

</head>
<body>
<div class="container mt-5">
    <h2>Delete Reservation</h2>
    <form action="DeleteReservationServlet" method="post">
        <div class="mb-3">
            <label for="reservationID" class="form-label">Reservation ID</label>
            <input type="text" class="form-control" id="reservationID" name="reservationID" required>
        </div>
        <button type="submit" class="btn btn-danger">Delete</button>
       <div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-home">🏠 Back to Home</a>
</div>
        
    </form>
</div>
</body>
</html>
