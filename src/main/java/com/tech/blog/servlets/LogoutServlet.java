package com.tech.blog.servlets;

import com.tech.blog.entities.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      this.processRequest(request, response);
   }

   protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession s = request.getSession();
      s.removeAttribute("currentUser");
      Message m = new Message("You are Logged-out Successfully ! ", "success", "alert-success");
      s.setAttribute("msg", m);
      response.sendRedirect("login_page.jsp");
   }
}
