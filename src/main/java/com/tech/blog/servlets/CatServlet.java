package com.tech.blog.servlets;

import com.tech.blog.dao.CatDao;
import com.tech.blog.entities.Category;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;

@MultipartConfig
public class CatServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/plain");
      PrintWriter out = response.getWriter();
      String cat = request.getParameter("category");
      String cat_des = request.getParameter("category_des");
      PrintStream var10000 = System.out;
      String var10001 = cat.toString();
      var10000.println(var10001 + " " + cat_des.toString());
      if (cat != null && !cat.isEmpty() && cat_des != null && !cat_des.isEmpty()) {
         Category c = new Category();
         c.setName(cat);
         c.setDescription(cat_des);
         CatDao cd = new CatDao(ConnectionProvider.getConnection());
         if (cd.isExist(c)) {
            out.print("exist");
         } else {
            boolean result = cd.addCategory(c);
            if (result) {
               out.print("done");
            } else {
               out.print("something went wrong");
            }

            out.flush();
         }
      } else {
         out.print("empty");
      }
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      this.doPost(request, response);
   }
}
