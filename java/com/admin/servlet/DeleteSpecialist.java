package com.admin.servlet;

import java.io.IOException;
import com.dao.SpecialistDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteSpecialist")
public class DeleteSpecialist extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the specialist ID from the form
            int id = Integer.parseInt(req.getParameter("id"));

            // Initialize SpecialistDao and delete the specialist
            SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
            boolean isDeleted = dao.deleteSpecialistById(id);

            HttpSession session = req.getSession();
            if (isDeleted) {
                session.setAttribute("succMsg", "Specialist deleted successfully.");
            } else {
                session.setAttribute("errorMsg", "Failed to delete specialist.");
            }

            // Redirect to the same page to see updated list
            resp.sendRedirect("admin/view_specialist.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "An error occurred. Please try again.");
            resp.sendRedirect("admin/view_specialist.jsp");
        }
    }
}
