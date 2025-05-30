package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

@WebServlet("/DisplayReservationsServlet")
public class DisplayReservationsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish DB connection
            try (Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_db?useSSL=false&serverTimezone=UTC", "root", "")) {

                // Fetch reservations
                ReservationDAO reservationDAO = new ReservationDAO(connection);
                List<Reservation> reservations = reservationDAO.getAllReservations();

                // Set reservations in request scope
                request.setAttribute("reservations", reservations);

                // Optional: check for success or error message passed as request attributes
                String message = request.getParameter("message");
                if (message != null) {
                    request.setAttribute("message", message);
                }

                // Forward to JSP
                RequestDispatcher dispatcher = request.getRequestDispatcher("reservationdisplay.jsp");
                dispatcher.forward(request, response);
            }

        } catch (Exception ex) {
            throw new ServletException("Error retrieving reservation list: " + ex.getMessage(), ex);
        }
    }
}