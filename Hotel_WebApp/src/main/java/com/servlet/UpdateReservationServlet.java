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

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hotel_db?useSSL=false&serverTimezone=UTC", "root", "");

            int reservationID = Integer.parseInt(request.getParameter("reservationID"));
            String customerName = request.getParameter("customerName");
            String roomNumber = request.getParameter("roomNumber");
            String checkInStr = request.getParameter("checkIn");
            String checkOutStr = request.getParameter("checkOut");
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date checkIn = sdf.parse(checkInStr);
            Date checkOut = sdf.parse(checkOutStr);

            Reservation updatedReservation = new Reservation();
            updatedReservation.setReservationID(reservationID);
            updatedReservation.setCustomerName(customerName);
            updatedReservation.setRoomNumber(roomNumber);
            updatedReservation.setCheckIn(checkIn);
            updatedReservation.setCheckOut(checkOut);
            updatedReservation.setTotalAmount(totalAmount);

            ReservationDAO reservationDAO = new ReservationDAO(conn);

            // Check if reservation ID exists
            boolean exists = reservationDAO.doesReservationExist(reservationID);
            if (!exists) {
                List<Reservation> reservations = reservationDAO.getAllReservations();
                request.setAttribute("reservations", reservations);
                request.setAttribute("message", "Reservation ID " + reservationID + " is not available.");
                request.getRequestDispatcher("reservationdisplay.jsp").forward(request, response);
                return;
            }

            // Check for room conflict
            boolean isAvailable = reservationDAO.isRoomAvailableForUpdate(roomNumber, checkIn, checkOut, reservationID);
            if (!isAvailable) {
                List<Reservation> reservations = reservationDAO.getAllReservations();
                request.setAttribute("reservations", reservations);
                request.setAttribute("message", "Room " + roomNumber + " is already allocated for the selected dates.");
                request.getRequestDispatcher("reservationdisplay.jsp").forward(request, response);
                return;
            }

            boolean updated = reservationDAO.updateReservation(updatedReservation);

            List<Reservation> reservations = reservationDAO.getAllReservations();
            request.setAttribute("reservations", reservations);

            if (updated) {
                request.setAttribute("message", "Reservation ID " + reservationID + " updated successfully.");
            } else {
                request.setAttribute("message", "Failed to update reservation ID " + reservationID + ".");
            }

            request.getRequestDispatcher("reservationdisplay.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error updating reservation: " + e.getMessage());
            request.getRequestDispatcher("reservationdisplay.jsp").forward(request, response);
        }
    }
}
