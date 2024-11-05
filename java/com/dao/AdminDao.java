package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.Admin;
import com.entity.Doctor;

public class AdminDao {
    private Connection conn;

    public AdminDao(Connection conn) {
        this.conn = conn;
    }
    
    public Admin login(String em, String psw) {
        Admin a = null;

        try {
            String sql = "SELECT * FROM admin_dtls WHERE email=? AND pass=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, em);
            ps.setString(2, psw);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                a = new Admin();
                a.setId(rs.getInt(1));
                a.setFullName(rs.getString(2));
                a.setEmail(rs.getString(3));
                a.setMobNo(rs.getString(4));
                a.setUserName(rs.getString(5));
                a.setDob(rs.getString(6));
                a.setGender(rs.getString(7));
                a.setPassword(rs.getString(8));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return a;
    }
    
    public boolean checkOldPassword(int adminid, String oldPassword) {
        boolean f = false;

        try {
            String sql = "SELECT * FROM admin_dtls WHERE id=? AND pass=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, adminid);
            ps.setString(2, oldPassword);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public boolean changePassword(int adminid, String newPassword) {
        boolean f = false;

        try {
            String sql = "UPDATE admin_dtls SET pass=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, adminid);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public boolean checkEmailExists(String email, int adminId) {
        String sql = "SELECT * FROM admin_dtls WHERE email = ? AND id != ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setInt(2, adminId);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean editAdminProfile(Admin a) {
        String sql = "UPDATE admin_dtls SET full_name=?, email=?, mobno=?, user_name=?, dob=?, gender=? WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, a.getFullName());
            ps.setString(2, a.getEmail());
            ps.setString(3, a.getMobNo());
            ps.setString(4, a.getUserName());
            ps.setString(5, a.getDob());
            ps.setString(6, a.getGender());
            ps.setInt(7, a.getId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Admin getAdminById(int id) {
        Admin a = null;
        try {
            String sql = "SELECT * FROM admin_dtls WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                a = new Admin();
                a.setId(rs.getInt(1));
                a.setFullName(rs.getString(2));
                a.setEmail(rs.getString(3));
                a.setMobNo(rs.getString(4));
                a.setUserName(rs.getString(5));
                a.setDob(rs.getString(6));
                a.setGender(rs.getString(7));
                a.setPassword(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }
}
