package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      PrintWriter out = response.getWriter();
      response.setContentType("text/html");
      String check = request.getParameter("check");
      if (check == null) {
         out.println("Box not checked !");
      } else {
         String name = request.getParameter("name");
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         String gender = request.getParameter("gender");
         String about = request.getParameter("about");
         User user = new User(name, email, password, gender, about);
         UserDao r = new UserDao(ConnectionProvider.getConnection());
         String s = r.saveUser(user);
         if (s == "true") {
            out.println("done");
         } else if (s == "duplicate") {
            out.println("Email already exist ! try with another email");
         } else {
            out.println("Something went wrong !");
         }
      }

   }
}
