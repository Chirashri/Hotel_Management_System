package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

@WebServlet("/DeleteReservationServlet")
public class DeleteReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reservationIdParam = request.getParameter("reservationID");
        String message;

        if (reservationIdParam == null || reservationIdParam.trim().isEmpty()) {
            message = "⚠ Reservation ID is required to delete a record.";
        } else {
            try {
                int reservationId = Integer.parseInt(reservationIdParam);
                Class.forName("com.mysql.cj.jdbc.Driver");

                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "")) {
                    ReservationDAO dao = new ReservationDAO(conn);
                    boolean deleted = dao.deleteReservationWithCheck(reservationId);

                    if (deleted) {
                        message = "✅ Reservation ID " + reservationId + " deleted successfully.";
                    } else {
                        message = "❌ Reservation ID " + reservationId + " not found.";
                    }

                    List<Reservation> reservations = dao.getAllReservations();
                    request.setAttribute("reservations", reservations);
                }
            } catch (NumberFormatException e) {
                message = "❗ Invalid reservation ID format.";
            } catch (Exception e) {
                throw new ServletException("Error deleting reservation", e);
            }
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("reservationdisplay.jsp").forward(request, response);
    }
}
