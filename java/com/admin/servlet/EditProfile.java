package com.admin.servlet;

import java.io.IOException;
import com.dao.AdminDao;
import com.db.DBConnect;
import com.entity.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminUpdateProfile")
public class EditProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("fullname");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            String username = req.getParameter("username");
            String dob = req.getParameter("dob");
            String gender = req.getParameter("gender");
            int id = Integer.parseInt(req.getParameter("id"));

            Admin admin = new Admin(id, fullName, email, mobno, username, dob, gender, "");

            AdminDao dao = new AdminDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.checkEmailExists(email, id)) {
                session.setAttribute("errorMsgd", "Email already exists!");
                resp.sendRedirect("admin/update_profile.jsp");
            } else {
                if (dao.editAdminProfile(admin)) {
                    Admin updatedAdmin = dao.getAdminById(id);
                    session.setAttribute("succMsgd", "Profile updated successfully.");
                    session.setAttribute("adminObj", updatedAdmin);
                    resp.sendRedirect("admin/profile.jsp");
                } else {
                    session.setAttribute("errorMsgd", "Profile update failed. Please try again.");
                    resp.sendRedirect("admin/update_profile.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsgd", "An error occurred. Please try again.");
            resp.sendRedirect("admin/update_profile.jsp");
        }
    }
}
