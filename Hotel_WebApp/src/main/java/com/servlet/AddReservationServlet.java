package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Date;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Connection conn = null;

        try {
            // Collect and parse request parameters
            int reservationId = Integer.parseInt(request.getParameter("reservationId"));
            String customerName = request.getParameter("customerName");
            String roomNumber = request.getParameter("roomNumber");
            Date checkInDate = Date.valueOf(request.getParameter("checkIn"));
            Date checkOutDate = Date.valueOf(request.getParameter("checkOut"));
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

            // Create a reservation object and set its fields
            Reservation booking = new Reservation();
            booking.setReservationID(reservationId);
            booking.setCustomerName(customerName);
            booking.setRoomNumber(roomNumber);
            booking.setCheckIn(checkInDate);
            booking.setCheckOut(checkOutDate);
            booking.setTotalAmount(totalAmount);

            // Establish connection and insert the reservation
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel_db", "root", "");

            ReservationDAO dao = new ReservationDAO(conn);
            dao.addReservation(booking);

            // Forward to confirmation page with the reservation details
            request.setAttribute("reservation", booking);
            RequestDispatcher dispatcher = request.getRequestDispatcher("reservationconfirmation.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }
    }
}
