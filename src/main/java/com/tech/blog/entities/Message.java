package com.tech.blog.entities;

public class Message {
   private String content;
   private String type;
   private String cssClass;

   public Message(String content, String type, String cssClass) {
      this.content = content;
      this.type = type;
      this.cssClass = cssClass;
   }

   public String getCssClass() {
      return this.cssClass;
   }

   public void setCssClass(String cssClass) {
      this.cssClass = cssClass;
   }

   public String getType() {
      return this.type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getContent() {
      return this.content;
   }

   public void setContent(String content) {
      this.content = content;
   }
}
