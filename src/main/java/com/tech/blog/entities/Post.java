package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
   private int pid;
   private String ptitle;
   private String pcontent;
   private String pcode;
   private String ppic;
   private Timestamp pdate;
   private int catid;
   private int uid;

   public Post(int pid, String ptitle, String pcontent, String pcode, String ppic, Timestamp pdate, int catid, int uid) {
      this.setCatid(catid);
      this.setPid(pid);
      this.setPcode(pcode);
      this.setPtitle(ptitle);
      this.setPcontent(pcontent);
      this.setPpic(ppic);
      this.setPdate(pdate);
      this.setUid(uid);
   }

   public Post(String ptitle, String pcontent, String pcode, String ppic, Timestamp pdate, int catid, int uid) {
      this.setCatid(catid);
      this.setPcode(pcode);
      this.setPtitle(ptitle);
      this.setPcontent(pcontent);
      this.setPpic(ppic);
      this.setPdate(pdate);
      this.uid = uid;
   }

   public int getPid() {
      return this.pid;
   }

   public void setPid(int pid) {
      this.pid = pid;
   }

   public String getPtitle() {
      return this.ptitle;
   }

   public void setPtitle(String ptitle) {
      this.ptitle = ptitle;
   }

   public String getPcontent() {
      return this.pcontent;
   }

   public void setPcontent(String pcontent) {
      this.pcontent = pcontent;
   }

   public String getPcode() {
      return this.pcode;
   }

   public void setPcode(String pcode) {
      this.pcode = pcode;
   }

   public String getPpic() {
      return this.ppic;
   }

   public void setPpic(String ppic) {
      this.ppic = ppic;
   }

   public Timestamp getPdate() {
      return this.pdate;
   }

   public void setPdate(Timestamp pdate) {
      this.pdate = pdate;
   }

   public int getCatid() {
      return this.catid;
   }

   public void setCatid(int catid) {
      this.catid = catid;
   }

   public int getUid() {
      return this.uid;
   }

   public void setUid(int uid) {
      this.uid = uid;
   }
}
