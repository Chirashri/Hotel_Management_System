<style>
    body {
        background: linear-gradient(to right, #dae2f8, #d6a4a4);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .report-form {
        background: rgba(255, 255, 255, 0.85);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
        max-width: 500px;
        width: 100%;
        backdrop-filter: blur(12px);
        border: 1px solid rgba(255, 255, 255, 0.3);
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #2c3e50;
        font-weight: 700;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
    }

    label {
        font-weight: 600;
        color: #34495e;
    }

    input[type="date"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0 20px 0;
        border: 1px solid #ced4da;
        border-radius: 10px;
        box-shadow: none;
    }

    input[type="date"]:focus {
        border-color: #8e44ad;
        box-shadow: 0 0 0 0.15rem rgba(142, 68, 173, 0.25);
    }

    input[type="submit"] {
        width: 100%;
        background: linear-gradient(135deg, #8e44ad, #3498db);
        border: none;
        padding: 12px;
        font-size: 16px;
        font-weight: 600;
        border-radius: 12px;
        color: white;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    input[type="submit"]:hover {
        background: linear-gradient(135deg, #6c3483, #2e86c1);
    }
</style>
<form action="ReportServlet" method="post">
    From: <input type="date" name="from" /><br/>
    To: <input type="date" name="to" /><br/>
    <input type="submit" value="Generate Report" />
</form>
