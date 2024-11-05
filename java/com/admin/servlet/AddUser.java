package com.admin.servlet;

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

@WebServlet("/addUser")
public class AddUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			User u = new User(fullName, email, password);

			UserDao dao = new UserDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.register(u)) {
				session.setAttribute("succMsg", "User Added Sucessfully..");
				resp.sendRedirect("admin/add_user.jsp");
			} else {
				session.setAttribute("errorMsg", "User wrong on server");
				resp.sendRedirect("admin/add_user.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}