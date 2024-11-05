package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userChangePassword")
public class changePassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("uid"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");

        UserDao dao = new UserDao(DBConnect.getConn());
        HttpSession session = req.getSession();

        // Check if the old password is correct
        if (dao.checkOldPassword(uid, oldPassword)) {
            // Check if the new password is the same as the old password
            if (oldPassword.equals(newPassword)) {
                session.setAttribute("errorMsg", "The new password must differ from the old one!");
                resp.sendRedirect("change_password.jsp");
                return; // Early exit if passwords match
            }

            // Change the password
            if (dao.changePassword(uid, newPassword)) {
                session.setAttribute("succMsg", "Password changed successfully.");
                resp.sendRedirect("change_password.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong");
                resp.sendRedirect("change_password.jsp");
            }

        } else {
            session.setAttribute("errorMsg", "Old password is incorrect.");
            resp.sendRedirect("change_password.jsp");
        }

    }
}