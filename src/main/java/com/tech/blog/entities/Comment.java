package com.tech.blog.entities;

import java.sql.Timestamp;

public class Comment {
   private int id;
   private int postId;
   private int userId;
   private String content;
   private Timestamp createdAt;

   public Comment() {
   }

   public Comment(int postId, int userId, String content) {
      this.setPostId(postId);
      this.setUserId(userId);
      this.setContent(content);
   }

   public int getId() {
      return this.id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public int getPostId() {
      return this.postId;
   }

   public void setPostId(int postId) {
      this.postId = postId;
   }

   public int getUserId() {
      return this.userId;
   }

   public void setUserId(int userId) {
      this.userId = userId;
   }

   public String getContent() {
      return this.content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public Timestamp getCreatedAt() {
      return this.createdAt;
   }

   public void setCreatedAt(Timestamp createdAt) {
      this.createdAt = createdAt;
   }
}
