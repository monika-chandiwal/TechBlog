package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String email = request.getParameter("email");
      String password = request.getParameter("password");
      UserDao userDao = new UserDao(ConnectionProvider.getConnection());
      User u = userDao.getUserByEmailPassword(email, password);
      if (u == null) {
         Message msg = new Message("Invalid Email or Password ! try with another", "error", "alert-danger");
         HttpSession s = request.getSession();
         s.setAttribute("msg", msg);
         response.sendRedirect("login_page.jsp");
      } else {
         HttpSession s = request.getSession();
         s.setAttribute("currentUser", u);
         response.sendRedirect("profile.jsp");
      }

   }
}
