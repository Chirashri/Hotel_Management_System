<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.model.Reservation" %>
<%
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reportList");
    Double revenue = (Double) request.getAttribute("revenue");
    if (revenue == null) revenue = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Report Summary</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <style>
    body {
        background: linear-gradient(to right, #dae2f8, #d6a4a4);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        padding: 60px 20px;
        min-height: 100vh;
    }

    .report-container {
        background: rgba(255, 255, 255, 0.85);
        padding: 40px;
        border-radius: 20px;
        max-width: 1100px;
        margin: auto;
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(12px);
        border: 1px solid rgba(255, 255, 255, 0.3);
    }

    h2 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
        font-weight: 700;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
    }

    .table thead th {
        background-color: #f5eaf7;
        color: #8e44ad;
        text-transform: uppercase;
        font-size: 13px;
        padding: 14px;
    }

    .table tbody td {
        background-color: #ffffff;
        padding: 13px;
        font-size: 15px;
    }

    .table tbody tr:hover {
        background-color: #fceefc;
    }

    .revenue-box {
        background-color: #f5eaf7;
        border-left: 6px solid #8e44ad;
        padding: 18px 25px;
        margin-top: 30px;
        font-size: 17px;
        color: #6c3483;
        font-weight: 500;
        border-radius: 12px;
        text-align: center;
    }
    .btn-home {
    background-color: #d291bc; /* lavender/purple-pink */
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
    

    .alert-warning {
        font-size: 16px;
        font-style: italic;
        background-color: #fff3cd;
        border-left: 5px solid #ffa000;
        padding: 15px;
        border-radius: 10px;
        color: #856404;
        margin-top: 20px;
    }
</style>

</head>
<body>
<div class="report-container">
    <h2>Reservation Report</h2>

    <%
        if (reservations != null && !reservations.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-bordered text-center align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Guest</th>
                    <th>Room</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Total (₹)</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (Reservation r : reservations) {
            %>
                <tr>
                    <td><%= r.getReservationID() %></td>
                    <td><%= r.getCustomerName() %></td>
                    <td><%= r.getRoomNumber() %></td>
                    <td><%= r.getCheckIn() %></td>
                    <td><%= r.getCheckOut() %></td>
                    <td>₹<%= String.format("%.2f", r.getTotalAmount()) %></td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="revenue-box">
        Total Revenue Generated: ₹<%= String.format("%.2f", revenue) %>
    </div>
    <div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-home">🏠 Back to Home</a>
</div>
    
    <%
        } else {
    %>
    <div class="alert alert-warning text-center mt-4">No data available for the selected range.</div>
    <%
        }
    %>
</div>
</body>
</html>
