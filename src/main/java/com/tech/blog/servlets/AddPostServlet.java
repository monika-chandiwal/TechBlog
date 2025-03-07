package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
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
import java.io.PrintWriter;
import java.sql.Timestamp;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      PrintWriter out = response.getWriter();
      HttpSession session = request.getSession();
      User user = (User)session.getAttribute("currentUser");
      int uid = user.getId();
      int cid = Integer.parseInt(request.getParameter("cid"));
      String ptitle = request.getParameter("ptitle");
      String pcontent = request.getParameter("pcontent");
      String pcode = request.getParameter("pcode");
      Part part = request.getPart("pic");
      String ppicname = part.getSubmittedFileName();
      Post post = new Post(ptitle, pcontent, pcode, ppicname, (Timestamp)null, cid, uid);
      PostDao pd = new PostDao(ConnectionProvider.getConnection());
      if (pd.savePost(post)) {
         String path = "C:\\Users\\kulha\\eclipse-workspace\\TechBlog\\src\\main\\webapp" + File.separator + "blog_pics" + File.separator + ppicname;
         File file = new File(path);
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
                   }catch(Exception e) {
                	   e.printStackTrace();
                   }
                  finally {
                	  if (fos != null) {
                        fos.close();
                      }
                    }
               
            }catch(Exception e) {
            	e.printStackTrace();
            }
            out.println("success");
            }catch(Exception e) {
            	e.printStackTrace();
            }
      } 
      else {
         out.println("error");
      }

	}      
}
