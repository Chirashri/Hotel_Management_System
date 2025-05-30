<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Reservation" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Overview</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    body {
        background: linear-gradient(to right, #dae2f8, #d6a4a4);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        padding: 50px 15px;
    }

    .container {
        background: rgba(255, 255, 255, 0.85);
        border-radius: 20px;
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
        max-width: 1000px;
        margin: 0 auto;
        padding: 50px;
        backdrop-filter: blur(12px);
        border: 1px solid rgba(255, 255, 255, 0.3);
    }

    h2 {
        text-align: center;
        font-size: 2.2rem;
        color: #2c3e50;
        margin-bottom: 30px;
        font-weight: 700;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
    }

    .table thead {
        background-color: #f0f3f5;
    }

    .table thead th {
        color: #2c3e50;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 13px;
        padding: 12px;
    }

    .table tbody td {
        background-color: #ffffff;
        font-size: 15px;
        padding: 14px;
        vertical-align: middle;
    }

    .table tbody tr:hover {
        background-color: #f8e9e9;
        transition: background-color 0.3s ease;
    }

    .error, .no-data {
        text-align: center;
        font-weight: bold;
        padding: 20px;
        font-size: 16px;
    }

    .error {
        color: #c62828;
    }

    .no-data {
        color: #616161;
        font-style: italic;
    }

    .table-responsive {
        border-radius: 12px;
        overflow: hidden;
        margin-top: 20px;
    }
</style>

</head>
<body>

<div class="container">
    <h2>Reservation List</h2>

    <%-- Display success message for update --%>
    <%
        String message = (String) request.getAttribute("message");
        String updatedID = (String) request.getAttribute("updatedReservationID");

        if (message != null) {
            if (updatedID != null) {
    %>
        <div class="alert alert-success text-center" role="alert">
            Reservation ID <strong><%= updatedID %></strong> updated successfully.
        </div>
    <%
            } else {
    %>
        <div class="alert alert-info text-center" role="alert">
            <%= message %>
        </div>
    <%
            }
        }
    %>

    <%
        List<Reservation> list = (List<Reservation>) request.getAttribute("reservations");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (list == null) {
    %>
        <p class="error">⚠ Reservation list not available.Please add a reservation or try again later .</p>
    <%
        } else if (list.isEmpty()) {
    %>
        <p class="no-data">No reservations found.</p>
    <%
        } else {
    %>
        <div class="table-responsive">
            <table class="table table-bordered text-center align-middle">
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Customer Name</th>
                        <th>Room No.</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Total Amount (₹)</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Reservation r : list) {
                %>
                    <tr>
                        <td><%= r.getReservationID() %></td>
                        <td><%= r.getCustomerName() %></td>
                        <td><%= r.getRoomNumber() %></td>
                        <td><%= sdf.format(r.getCheckIn()) %></td>
                        <td><%= sdf.format(r.getCheckOut()) %></td>
                        <td><%= String.format("%.2f", r.getTotalAmount()) %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    <%
        }
    %>
</div>

</body>
</html>
