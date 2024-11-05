package com.admin.servlet;

import java.io.IOException;
import com.dao.AdminDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminChangePassword")
public class AdminChangePass extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int aid = Integer.parseInt(req.getParameter("uid"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");

        AdminDao dao = new AdminDao(DBConnect.getConn());
        HttpSession session = req.getSession();

        if (dao.checkOldPassword(aid, oldPassword)) {
            
            if (oldPassword.equals(newPassword)) {
                session.setAttribute("errorMsg", "The new password must differ from the old one!");
                resp.sendRedirect("admin/change_password.jsp");
                return;
            }

            if (dao.changePassword(aid, newPassword)) {
                session.setAttribute("succMsg", "Password changed successfully");
                resp.sendRedirect("admin/change_password.jsp");

            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server");
                resp.sendRedirect("admin/change_password.jsp");
            }

        } else {
            session.setAttribute("errorMsg", "Old Password Incorrect");
            resp.sendRedirect("admin/change_password.jsp");
        }
    }
}
