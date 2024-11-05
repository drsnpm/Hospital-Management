package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userUpdateProfile")
public class EditProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String fullName = req.getParameter("fullname");
            String email = req.getParameter("email");
            int id = Integer.parseInt(req.getParameter("id"));

            UserDao dao = new UserDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            // Check if email already exists for another user
            if (dao.checkEmailExists(email, id)) {
                session.setAttribute("errorMsgd", "Email already exists!");
                resp.sendRedirect("update_profile.jsp");
            } else {
                User user = new User();
                user.setId(id);
                user.setFullName(fullName);
                user.setEmail(email);

                // Update user profile
                if (dao.editUserProfile(user)) {
                    User updatedUser = dao.getUserById(id);
                    session.setAttribute("succMsgd", "User updated successfully.");
                    session.setAttribute("userObj", updatedUser);
                    resp.sendRedirect("profile.jsp");
                } else {
                    session.setAttribute("errorMsgd", "Something went wrong!");
                    resp.sendRedirect("update_profile.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
