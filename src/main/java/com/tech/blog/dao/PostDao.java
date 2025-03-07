package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
   Connection con;

   public PostDao(Connection con) {
      this.con = con;
   }

   public ArrayList<Category> getAllCategories() {
      ArrayList list = new ArrayList();

      try {
         Statement st = this.con.createStatement();
         ResultSet rs = st.executeQuery("select * from categories");

         while(rs.next()) {
            int cid = rs.getInt("cid");
            String name = rs.getString("name");
            String description = rs.getString("description");
            Category c = new Category(cid, name, description);
            list.add(c);
         }
      } catch (Exception var8) {
         var8.printStackTrace();
      }

      return list;
   }

   public boolean savePost(Post p) {
      boolean f = false;

      try {
         String q = "insert into posts (ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
         PreparedStatement ps = this.con.prepareStatement(q);
         ps.setString(1, p.getPtitle());
         ps.setString(2, p.getPcontent());
         ps.setString(3, p.getPcode());
         ps.setString(4, p.getPpic());
         ps.setInt(5, p.getCatid());
         ps.setInt(6, p.getUid());
         ps.executeUpdate();
         f = true;
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return f;
   }

   public List<Post> getAllPosts() {
      ArrayList list = new ArrayList();

      try {
         PreparedStatement p = this.con.prepareStatement("select * from posts order by pid desc");
         ResultSet rs = p.executeQuery();

         while(rs.next()) {
            int pid = rs.getInt("pid");
            String ptitle = rs.getString("ptitle");
            String pcontent = rs.getString("pcontent");
            String pcode = rs.getString("pcode");
            Timestamp pdate = rs.getTimestamp("pdate");
            int catid = rs.getInt("catid");
            int userid = rs.getInt("userid");
            String ppic = rs.getString("ppic");
            Post post = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, catid, userid);
            list.add(post);
         }
      } catch (Exception var13) {
      }

      return list;
   }

   public List<Post> getPostByCatId(int catId) {
      ArrayList list = new ArrayList();

      try {
         PreparedStatement p = this.con.prepareStatement("select * from posts where catid='" + catId + "'");
         ResultSet rs = p.executeQuery();

         while(rs.next()) {
            int pid = rs.getInt("pid");
            String ptitle = rs.getString("ptitle");
            String pcontent = rs.getString("pcontent");
            String pcode = rs.getString("pcode");
            Timestamp pdate = rs.getTimestamp("pdate");
            int userid = rs.getInt("userid");
            String ppic = rs.getString("ppic");
            Post post = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, catId, userid);
            list.add(post);
         }
      } catch (Exception var13) {
      }

      return list;
   }

   public Post getPostByPostId(int postId) {
      Post post = null;

      try {
         PreparedStatement p = this.con.prepareStatement("select * from posts where pid='" + postId + "'");

         int pid;
         String ptitle;
         String pcontent;
         String pcode;
         Timestamp pdate;
         int catId;
         int userid;
         String ppic;
         for(ResultSet rs = p.executeQuery(); rs.next(); post = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, catId, userid)) {
            pid = rs.getInt("pid");
            ptitle = rs.getString("ptitle");
            pcontent = rs.getString("pcontent");
            pcode = rs.getString("pcode");
            pdate = rs.getTimestamp("pdate");
            catId = rs.getInt("catid");
            userid = rs.getInt("userid");
            ppic = rs.getString("ppic");
         }
      } catch (Exception var13) {
      }

      return post;
   }
}
