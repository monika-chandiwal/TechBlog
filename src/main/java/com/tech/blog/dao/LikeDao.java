package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class LikeDao {
   Connection con;

   public LikeDao(Connection con) {
      this.con = con;
   }

   public boolean insertLike(int pid, int uid) {
      boolean f = false;

      try {
         String q = "insert into liked (pid, uid) values (?, ?)";
         PreparedStatement ps = this.con.prepareStatement(q);
         ps.setInt(1, pid);
         ps.setInt(2, uid);
         ps.executeUpdate();
         f = true;
      } catch (Exception var6) {
         var6.printStackTrace();
      }

      return f;
   }

   public boolean isDislikedByUser(int pid, int uid) {
      boolean f = false;

      try {
         PreparedStatement ps = this.con.prepareStatement("select * from liked where pid=? and uid=? ");
         ps.setInt(1, pid);
         ps.setInt(2, uid);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            f = true;
         }
      } catch (Exception var6) {
         var6.printStackTrace();
      }

      return f;
   }

   public boolean isLikedByUser(int pid, int uid) {
      boolean f = false;

      try {
         PreparedStatement ps = this.con.prepareStatement("select * from liked where pid=? and uid=?");
         ps.setInt(1, pid);
         ps.setInt(2, uid);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            f = true;
         }
      } catch (Exception var6) {
         var6.printStackTrace();
      }

      return f;
   }

   public boolean deleteLike(int pid, int uid) {
      boolean f = false;

      try {
         PreparedStatement ps = this.con.prepareStatement("delete from liked where pid=? and uid=?");
         ps.setInt(1, pid);
         ps.setInt(2, uid);
         ps.executeUpdate();
         f = true;
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return f;
   }

   public int countLikeOnPost(int pid) {
      int count = 0;

      try {
         PreparedStatement ps = this.con.prepareStatement("select count(*) from liked where pid=? ");
         ps.setInt(1, pid);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            count = rs.getInt(1);
         }
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return count;
   }

   public int countDislikeOnPost(int pid) {
      int count = 0;

      try {
         PreparedStatement ps = this.con.prepareStatement("select count(*) from liked where pid=?");
         ps.setInt(1, pid);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            count = rs.getInt(1);
         }
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return count;
   }

   public ArrayList<Integer> likedBy(int pid) {
      ArrayList list = new ArrayList();

      try {
         PreparedStatement ps = this.con.prepareStatement("select * from liked where pid=?");
         ps.setInt(1, pid);
         ResultSet rs = ps.executeQuery();

         while(rs.next()) {
            list.add(rs.getInt("uid"));
         }
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return list;
   }
}
