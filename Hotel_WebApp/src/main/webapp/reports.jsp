<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Report</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
    body {
        background: linear-gradient(to right, #dae2f8, #d6a4a4);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
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
<div class="container mx-auto">
    <h2>Report by Date Range</h2>
    <form method="post" action="ReportServlet">
        <div class="mb-3">
            <label for="from" class="form-label">From:</label>
            <input type="date" class="form-control" id="from" name="from" required>
        </div>
        <div class="mb-3">
            <label for="to" class="form-label">To:</label>
            <input type="date" class="form-control" id="to" name="to" required>
        </div>
        <div class="d-grid">
            <input type="submit" class="btn btn-primary" value="Generate Report">
        </div>
    </form>
</div>
</body>
</html>
