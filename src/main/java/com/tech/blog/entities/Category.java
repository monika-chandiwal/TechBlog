package com.tech.blog.entities;

public class Category {
   private int cid;
   private String name;
   private String description;

   public Category(int cid, String name, String description) {
      this.setCid(cid);
      this.setName(name);
      this.setDescription(description);
   }

   public Category(String name, String description) {
      this.setName(name);
      this.setDescription(description);
   }

   public Category(String description) {
      this.setDescription(description);
   }

   public Category() {
   }

   public String getDescription() {
      return this.description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public String getName() {
      return this.name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getCid() {
      return this.cid;
   }

   public void setCid(int cid) {
      this.cid = cid;
   }
}
