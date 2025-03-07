package com.tech.blog.servlets;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LikedServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      PrintWriter out = response.getWriter();
      String operation = request.getParameter("operation");
      int uid = Integer.parseInt(request.getParameter("uid"));
      int pid = Integer.parseInt(request.getParameter("pid"));
      LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
      if ("like".equals(operation)) {
         int likeCount;
         if (ld.isLikedByUser(pid, uid)) {
            if (ld.deleteLike(pid, uid)) {
               likeCount = ld.countLikeOnPost(pid);
               out.print("already_reacted:" + likeCount);
            }
         } else {
            ld.insertLike(pid, uid);
            likeCount = ld.countLikeOnPost(pid);
            out.print("success:" + likeCount);
         }
      }

   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      this.doGet(request, response);
   }
}
