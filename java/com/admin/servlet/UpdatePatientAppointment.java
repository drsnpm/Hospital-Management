package com.admin.servlet;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.dao.AppointmentDAO;
import com.db.DBConnect;


@WebServlet("/updatePatientAppointment")
public class UpdatePatientAppointment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String appoinDate = request.getParameter("appoint_date");
        String email = request.getParameter("email");
        String phNo = request.getParameter("mobno");
        String diseases = request.getParameter("diseases");
        int doctorId = Integer.parseInt(request.getParameter("doct"));
        String address = request.getParameter("address");

        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());

        // Check if email or phone already exists
        boolean emailExists = dao.doesEmailExist(email, id);
        boolean phoneExists = dao.doesPhoneExist(phNo, id);

        if (emailExists) {
            request.getSession().setAttribute("errorMsg", "Email already exists. Please use a different email.");
            response.sendRedirect("edit_appointment.jsp?id=" + id);
            return;
        }

        if (phoneExists) {
            request.getSession().setAttribute("errorMsg", "Mobile number already exists. Please use a different mobile number.");
            response.sendRedirect("edit_appointment.jsp?id=" + id);
            return;
        }

        Appointment appointment = new Appointment(id, 0, fullName, gender, age, appoinDate, email, phNo, diseases, doctorId, address, null);
        boolean result = dao.updateAppointment(appointment);

        if (result) {
            request.getSession().setAttribute("succMsg", "Appointment updated successfully.");
        } else {
            request.getSession().setAttribute("errorMsg", "Failed to update appointment.");
        }
        response.sendRedirect("admin/edit_appointment.jsp?id="+id);
    }
}
