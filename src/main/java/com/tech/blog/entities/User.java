package com.tech.blog.entities;

import java.sql.Timestamp;

public class User {
   private int id;
   private String name;
   private String email;
   private String password;
   private String gender;
   private String about;
   private Timestamp datetime;
   private String profile;

   public User(int id, String name, String email, String password, String gender, Timestamp datetime, String profile) {
      this.id = id;
      this.name = name;
      this.email = email;
      this.password = password;
      this.gender = gender;
      this.datetime = datetime;
      this.profile = profile;
   }

   public User() {
   }

   public User(String name, String email, String password, String gender, String about) {
      this.name = name;
      this.email = email;
      this.password = password;
      this.gender = gender;
      this.about = about;
   }

   public int getId() {
      return this.id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getName() {
      return this.name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getEmail() {
      return this.email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPassword() {
      return this.password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getGender() {
      return this.gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public Timestamp getDatetime() {
      return this.datetime;
   }

   public void setDatetime(Timestamp datetime) {
      this.datetime = datetime;
   }

   public String getAbout() {
      return this.about;
   }

   public void setAbout(String about) {
      this.about = about;
   }

   public String getProfile() {
      return this.profile;
   }

   public void setProfile(String profile) {
      this.profile = profile;
   }
}
