package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String startDateParam = request.getParameter("from");
        String endDateParam = request.getParameter("to");

        try {
            Date startDate = null;
            Date endDate = null;

            if (startDateParam != null && !startDateParam.isEmpty()) {
                startDate = dateFormat.parse(startDateParam);
            }

            if (endDateParam != null && !endDateParam.isEmpty()) {
                endDate = dateFormat.parse(endDateParam);
            }

            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_db?useSSL=false&serverTimezone=UTC", "root", "")) {

                ReservationDAO reservationDao = new ReservationDAO(connection);
                List<Reservation> reservationList;

                if (startDate != null && endDate != null) {
                    reservationList = reservationDao.getReservationsByDateRange(startDate, endDate);
                } else {
                    reservationList = reservationDao.getAllReservations();
                }

                double totalAmountCollected = reservationList.stream()
                        .mapToDouble(Reservation::getTotalAmount)
                        .sum();

                request.setAttribute("reportList", reservationList);
                request.setAttribute("revenue", totalAmountCollected);

                RequestDispatcher dispatcher = request.getRequestDispatcher("report_result.jsp");
                dispatcher.forward(request, response);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            throw new ServletException("Report generation failed: " + ex.getMessage(), ex);
        }
    }
}
