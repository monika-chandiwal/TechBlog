package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
   private static Connection c = null;

   private ConnectionProvider() {
   }

   public static Connection getConnection() {
      try {
         if (c == null) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "password@123");
            System.out.println("Connection created successfully");
         }
      } catch (Exception var1) {
         var1.printStackTrace();
      }

      return c;
   }
}
