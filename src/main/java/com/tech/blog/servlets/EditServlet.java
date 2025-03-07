package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
public class EditServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String name = request.getParameter("user_name");
      String email = request.getParameter("user_email");
      String password = request.getParameter("user_password");
      String about = request.getParameter("user_about");
      Part part = request.getPart("user_profile");
      String imagename = part.getSubmittedFileName();
      HttpSession s = request.getSession();
      User user = (User)s.getAttribute("currentUser");
      String oldimage = user.getProfile();
      user.setAbout(about);
      user.setEmail(email);
      user.setName(name);
      user.setProfile(imagename);
      user.setPassword(password);
      UserDao userdao = new UserDao(ConnectionProvider.getConnection());
      if (userdao.updateUser(user)) {
         boolean f = false;
         response.getWriter().println("Updated Successfully");
         String path;
         File file;
         if (!oldimage.equals("profile.png")) {
            path = "C:\\Users\\kulha\\eclipse-workspace\\TechBlog\\src\\main\\webapp" + File.separator + "pics" + File.separator + oldimage;
            file = new File(path);
            file.delete();
         }

         path = "C:\\Users\\kulha\\eclipse-workspace\\TechBlog\\src\\main\\webapp" + File.separator + "pics" + File.separator + imagename;
         file = new File(path);
         System.out.println(path);
         File dir = file.getParentFile();
         if (!dir.exists()) {
            dir.mkdirs();
         }
         try {
               InputStream is = part.getInputStream();

               try {
                  FileOutputStream fos = new FileOutputStream(file);

                  try {
                     byte[] data = new byte[is.available()];
                     is.read(data);
                     fos.write(data);
                     f = true;
                  } finally {
                     if (fos != null) {
                        fos.close();
                     }
                  }
                  }catch(Exception e) {
                	  e.printStackTrace();
               }
                  if (is != null) {
                     is.close();
                  }
               }catch(Exception e) {
            	   e.printStackTrace();
               }
              
         Message msg;
         if (f) {
            msg = new Message("Profile Updated Successfully !", "success", "alert-success");
            s.setAttribute("msg", msg);
         } else {
            msg = new Message("Something went wrong !", "error", "alert-danger");
            s.setAttribute("msg", msg);
         }
      } else {
         Message msg = new Message("Something went wrong !", "error", "alert-danger");
         s.setAttribute("msg", msg);
      }

      response.sendRedirect("profile.jsp");
   }
}
