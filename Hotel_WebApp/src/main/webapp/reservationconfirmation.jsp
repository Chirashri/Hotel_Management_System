<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.Reservation" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    body {
        background: linear-gradient(to right, #dae2f8, #d6a4a4);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        padding: 60px 20px;
    }

    .confirmation-box {
        background: rgba(255, 255, 255, 0.85);
        padding: 45px 40px;
        border-radius: 20px;
        max-width: 700px;
        margin: auto;
        box-shadow: 0 25px 55px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.3);
    }

    h2 {
        text-align: center;
        color: #2c3e50;
        font-weight: 700;
        font-size: 28px;
        margin-bottom: 30px;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
    }

    .table {
        border-radius: 12px;
        overflow: hidden;
        margin-top: 20px;
    }

    .table th {
        background-color: #f0f3f5;
        color: #2c3e50;
        font-weight: 600;
        text-transform: uppercase;
    }

    .table td {
        background-color: #ffffff;
        color: #333;
        padding: 12px;
    }

    .btn-home {
        background-color: #5c6bc0;
        color: #fff;
        padding: 12px 30px;
        border-radius: 30px;
        text-decoration: none;
        font-weight: 600;
        transition: background-color 0.3s ease;
        display: inline-block;
        text-align: center;
        margin-top: 30px;
    }

    .btn-home:hover {
        background-color: #3949ab;
        color: #fff;
    }

    .no-data {
        color: #c62828;
        text-align: center;
        font-weight: 600;
        margin-top: 20px;
        font-style: italic;
    }
</style>

</head>
<body>

<div class="confirmation-box">
    <h2>Reservation <%= (request.getAttribute("source") != null && request.getAttribute("source").equals("update")) ? "Updated Successfully" : "Confirmed Successfully" %></h2>

    <%
        Reservation res = (Reservation) request.getAttribute("reservation");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (res == null) {
    %>
        <p class="no-data">No reservation details available.</p>
    <%
        } else {
    %>
    <table class="table table-bordered">
        <tr>
            <th>Reservation ID</th>
            <td><%= res.getReservationID() %></td>
        </tr>
        <tr>
            <th>Customer Name</th>
            <td><%= res.getCustomerName() %></td>
        </tr>
        <tr>
            <th>Room Number</th>
            <td><%= res.getRoomNumber() %></td>
        </tr>
        <tr>
            <th>Check-In Date</th>
            <td><%= sdf.format(res.getCheckIn()) %></td>
        </tr>
        <tr>
            <th>Check-Out Date</th>
            <td><%= sdf.format(res.getCheckOut()) %></td>
        </tr>
        <tr>
            <th>Total Amount</th>
            <td>₹ <%= String.format("%.2f", res.getTotalAmount()) %></td>
        </tr>
    </table>
    <%
        }
    %>

    <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-home">🏠 Back to Home</a>
    </div>
</div>

</body>
</html>
