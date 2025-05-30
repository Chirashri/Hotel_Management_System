package com.dao;

import com.model.Reservation;
import java.sql.*;
import java.util.*;

public class ReservationDAO {
    private Connection conn;

    public ReservationDAO(Connection conn) {
        this.conn = conn;
    }

    public void addReservation(Reservation r) throws SQLException {
        String sql = "INSERT INTO reservations VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, r.getReservationID());
            ps.setString(2, r.getCustomerName());
            ps.setString(3, r.getRoomNumber());
            ps.setDate(4, new java.sql.Date(r.getCheckIn().getTime()));
            ps.setDate(5, new java.sql.Date(r.getCheckOut().getTime()));
            ps.setDouble(6, r.getTotalAmount());
            ps.executeUpdate();
        }
    }

    public boolean deleteReservationWithCheck(int id) throws SQLException {
        String sql = "DELETE FROM reservations WHERE ReservationID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        }
    }

    public boolean updateReservation(Reservation r) throws SQLException {
        String sql = "UPDATE reservations SET CustomerName=?, RoomNumber=?, CheckIn=?, CheckOut=?, TotalAmount=? WHERE ReservationID=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, r.getCustomerName());
            ps.setString(2, r.getRoomNumber());
            ps.setDate(3, new java.sql.Date(r.getCheckIn().getTime()));
            ps.setDate(4, new java.sql.Date(r.getCheckOut().getTime()));
            ps.setDouble(5, r.getTotalAmount());
            ps.setInt(6, r.getReservationID());
            return ps.executeUpdate() > 0;
        }
    }

    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationID(rs.getInt("ReservationID"));
                r.setCustomerName(rs.getString("CustomerName"));
                r.setRoomNumber(rs.getString("RoomNumber"));
                r.setCheckIn(rs.getDate("CheckIn"));
                r.setCheckOut(rs.getDate("CheckOut"));
                r.setTotalAmount(rs.getDouble("TotalAmount"));
                list.add(r);
            }
        }
        return list;
    }

    public List<Reservation> getReservationsByDateRange(java.util.Date from, java.util.Date to) throws SQLException {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations WHERE CheckIn >= ? AND CheckOut <= ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(from.getTime()));
            ps.setDate(2, new java.sql.Date(to.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationID(rs.getInt("ReservationID"));
                r.setCustomerName(rs.getString("CustomerName"));
                r.setRoomNumber(rs.getString("RoomNumber"));
                r.setCheckIn(rs.getDate("CheckIn"));
                r.setCheckOut(rs.getDate("CheckOut"));
                r.setTotalAmount(rs.getDouble("TotalAmount"));
                list.add(r);
            }
        }
        return list;
    }

    public double getTotalRevenue(java.util.Date from, java.util.Date to) throws SQLException {
        String sql = "SELECT SUM(TotalAmount) FROM reservations WHERE CheckIn >= ? AND CheckOut <= ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(from.getTime()));
            ps.setDate(2, new java.sql.Date(to.getTime()));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble(1);
            }
        }
        return 0;
    }

    public boolean isRoomAvailableForUpdate(String roomNumber, java.util.Date checkIn, java.util.Date checkOut, int reservationID) throws SQLException {
        String sql = "SELECT COUNT(*) FROM reservations WHERE RoomNumber = ? AND ReservationID != ? AND " +
                     "(CheckIn < ? AND CheckOut > ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roomNumber);
            ps.setInt(2, reservationID);
            ps.setDate(3, new java.sql.Date(checkOut.getTime()));
            ps.setDate(4, new java.sql.Date(checkIn.getTime()));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) == 0;
            }
        }
        return true;
    }

    public boolean doesReservationExist(int reservationID) throws SQLException {
        String sql = "SELECT COUNT(*) FROM reservations WHERE ReservationID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, reservationID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }
}
