package com.doctor.servlet;

import java.io.IOException;
import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve parameters from the form
            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String spec = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            int id = Integer.parseInt(req.getParameter("id"));

            // Create Doctor object with the updated information
            Doctor doctor = new Doctor(id, fullName, dob, qualification, spec, email, mobno, "");

            // Initialize DAO and session
            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            // Check if the email already exists for another doctor
            if (dao.checkEmailExists(email, id)) {
                session.setAttribute("errorMsgd", "Email already exists for another doctor.");
                resp.sendRedirect("doctor/update_profile.jsp");
            } else {
                // Attempt to update the doctor profile
                if (dao.editDoctorProfile(doctor)) {
                    // Fetch the updated doctor object and set it in the session
                    Doctor updatedDoctor = dao.getDoctorById(id);
                    session.setAttribute("succMsgd", "Profile updated successfully.");
                    session.setAttribute("doctObj", updatedDoctor);
                    resp.sendRedirect("doctor/profile.jsp");
                } else {
                    // Update failed
                    session.setAttribute("errorMsgd", "Profile update failed. Please try again.");
                    resp.sendRedirect("doctor/update_profile.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect with a generic error message
            req.getSession().setAttribute("errorMsgd", "An error occurred. Please try again.");
            resp.sendRedirect("doctor/update_profile.jsp");
        }
    }
}
