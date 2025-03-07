package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
   private Connection con;

   public UserDao(Connection con) {
      this.con = con;
   }

   public String saveUser(User user) {
      String f = "false";

      try {
         String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
         PreparedStatement ps = this.con.prepareStatement(query);
         ps.setString(1, user.getName());
         ps.setString(2, user.getEmail());
         ps.setString(3, user.getPassword());
         ps.setString(4, user.getGender());
         ps.setString(5, user.getAbout());
         String email = user.getEmail();
         PreparedStatement p = this.con.prepareStatement("select * from user where email='" + email + "'");
         ResultSet rs = p.executeQuery();
         if (rs.next()) {
            return "duplicate";
         }

         ps.executeUpdate();
         f = "true";
      } catch (Exception var8) {
         var8.printStackTrace();
      }

      return f;
   }

   public User getUserByEmailPassword(String email, String password) {
      User user = null;

      try {
         String query = "select * from user where email=? and password=?";
         PreparedStatement ps = this.con.prepareStatement(query);
         ps.setString(1, email);
         ps.setString(2, password);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setGender(rs.getString("gender"));
            user.setAbout(rs.getString("about"));
            user.setDatetime(rs.getTimestamp("rdate"));
            user.setProfile(rs.getString("profile"));
         }
      } catch (Exception var7) {
         var7.printStackTrace();
      }

      return user;
   }

   public boolean updateUser(User user) {
      boolean f = false;

      try {
         String query = "update user set name=? , email=?, password=?, about=?,profile=? where id=?";
         PreparedStatement ps = this.con.prepareStatement(query);
         ps.setString(1, user.getName());
         ps.setString(2, user.getEmail());
         ps.setString(3, user.getPassword());
         ps.setString(4, user.getAbout());
         ps.setString(5, user.getProfile());
         ps.setInt(6, user.getId());
         ps.executeUpdate();
         f = true;
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return f;
   }

   public User getUserByUserId(int userId) {
      User user = new User();

      try {
         PreparedStatement ps = this.con.prepareStatement("select * from user where id='" + userId + "'");
         ResultSet rs = ps.executeQuery();

         while(rs.next()) {
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setGender(rs.getString("gender"));
            user.setAbout(rs.getString("about"));
            user.setDatetime(rs.getTimestamp("rdate"));
            user.setProfile(rs.getString("profile"));
         }
      } catch (Exception var5) {
      }

      return user;
   }

   public String likedUser(int uid) {
      String s = "";

      try {
         PreparedStatement ps = this.con.prepareStatement("select * from user where id='" + uid + "'");

         for(ResultSet rs = ps.executeQuery(); rs.next(); s = rs.getString("name")) {
         }
      } catch (Exception var5) {
      }

      return s;
   }

   public String getUserProfile(int uid) {
      String s = "";

      try {
         PreparedStatement ps = this.con.prepareStatement("select * from user where id='" + uid + "'");

         for(ResultSet rs = ps.executeQuery(); rs.next(); s = rs.getString("profile")) {
         }
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return s;
   }
}
