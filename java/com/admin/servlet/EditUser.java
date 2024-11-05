package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editUser")
public class EditUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
//			String password = req.getParameter("password");

			int id = Integer.parseInt(req.getParameter("id"));

			User u = new User(id, fullName, email);

			UserDao dao = new UserDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.editUserProfile(u)) {
				session.setAttribute("succMsg", "User Update Sucessfully..");
				resp.sendRedirect("admin/view_user.jsp");
			} else {
				session.setAttribute("errorMsg", "Email already exists!");
				resp.sendRedirect("admin/view_user.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}