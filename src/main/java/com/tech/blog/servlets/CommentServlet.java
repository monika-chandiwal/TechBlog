package com.tech.blog.servlets;

import com.tech.blog.dao.CommentDao;
import com.tech.blog.entities.Comment;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CommentServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      PrintWriter out = response.getWriter();
      response.setContentType("text/plain");
      String jspSource = request.getParameter("jspSource");
      if (jspSource != null && jspSource.equals("show_blog_page.jsp")) {
         String content = request.getParameter("comment");
         int pid = Integer.parseInt(request.getParameter("pid"));
         int uid = Integer.parseInt(request.getParameter("uid"));
         Comment comment = new Comment(pid, uid, content);
         CommentDao cd = new CommentDao(ConnectionProvider.getConnection());
         if (content.isEmpty()) {
            out.println("empty");
            return;
         }

         if (cd.addComment(comment)) {
            out.println("success");
         } else {
            out.println("error");
         }
      } else if (jspSource != null && jspSource.equals("deleteComment")) {
         int commentId = Integer.parseInt(request.getParameter("commentId"));
         CommentDao cd = new CommentDao(ConnectionProvider.getConnection());
         if (cd.deleteComment(commentId)) {
            out.println("success");
         } else {
            out.println("error");
         }
      }

   }
}
