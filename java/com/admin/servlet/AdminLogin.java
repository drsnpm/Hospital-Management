// AdminLogin.java
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

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();
        
        AdminDao dao = new AdminDao(DBConnect.getConn());
        Admin admin = dao.login(email, password);
        
        if (admin != null) {
            session.setAttribute("adminObj", admin);
            resp.sendRedirect("admin/index.jsp");
        } else {
            session.setAttribute("errorMsg", "invalid email & password");
            resp.sendRedirect("admin_login.jsp");
        }
    }
}
