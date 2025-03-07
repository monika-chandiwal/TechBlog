package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CatDao {
   Connection con;

   public CatDao(Connection con) {
      this.con = con;
   }

   public boolean addCategory(Category c) {
      boolean f = false;

      try {
         String q = "insert into categories (name, description ) values (? ,?)";
         PreparedStatement ps = this.con.prepareStatement(q);
         ps.setString(1, c.getName());
         ps.setString(2, c.getDescription());
         ps.executeUpdate();
         f = true;
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return f;
   }

   public ArrayList<String> getAllCategories() {
      ArrayList<String> list = new ArrayList();
      String q = "select name from categories";

      try {
         PreparedStatement ps = this.con.prepareStatement(q);
         ResultSet rs = ps.executeQuery();

         while(rs.next()) {
            list.add(rs.getString("name"));
         }
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return list;
   }

   public boolean isExist(Category c) {
      boolean f = false;
      String q = "select * from categories where name = '" + c.getName() + "'";

      try {
         PreparedStatement ps = this.con.prepareStatement(q);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
            f = true;
         }
      } catch (SQLException var6) {
         var6.printStackTrace();
      }

      return f;
   }
}
