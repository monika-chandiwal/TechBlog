package com.tech.blog.dao;

import com.tech.blog.entities.Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {
   private Connection con;

   public CommentDao(Connection con) {
      this.con = con;
   }

   public boolean addComment(Comment comment) {
      boolean isSuccess = false;

      try {
         String query = "INSERT INTO comments (post_id, user_id, content) VALUES (?, ?, ?)";
         PreparedStatement pstmt = this.con.prepareStatement(query);
         pstmt.setInt(1, comment.getPostId());
         pstmt.setInt(2, comment.getUserId());
         pstmt.setString(3, comment.getContent());
         pstmt.executeUpdate();
         isSuccess = true;
      } catch (Exception var5) {
         var5.printStackTrace();
      }

      return isSuccess;
   }

   public List<Comment> getCommentsByPostId(int postId) {
      ArrayList comments = new ArrayList();

      try {
         String query = "SELECT * FROM comments WHERE post_id = ? ORDER BY created_at";
         PreparedStatement pstmt = this.con.prepareStatement(query);
         pstmt.setInt(1, postId);
         ResultSet rs = pstmt.executeQuery();

         while(rs.next()) {
            Comment comment = new Comment();
            comment.setId(rs.getInt("id"));
            comment.setPostId(rs.getInt("post_id"));
            comment.setUserId(rs.getInt("user_id"));
            comment.setContent(rs.getString("content"));
            comment.setCreatedAt(rs.getTimestamp("created_at"));
            comments.add(comment);
         }
      } catch (Exception var7) {
         var7.printStackTrace();
      }

      return comments;
   }

   public boolean deleteComment(int commentId) {
      boolean isSuccess = false;

      try {
         String query = "DELETE FROM comments WHERE id = ?";
         PreparedStatement pstmt = this.con.prepareStatement(query);
         pstmt.setInt(1, commentId);
         int result = pstmt.executeUpdate();
         isSuccess = result > 0;
      } catch (Exception var6) {
         var6.printStackTrace();
      }

      return isSuccess;
   }

   public int countComment(int postId) {
      int count = 0;

      try {
         String query = "SELECT * FROM comments WHERE post_id = ?";
         PreparedStatement pstmt = this.con.prepareStatement(query);
         pstmt.setInt(1, postId);

         for(ResultSet rs = pstmt.executeQuery(); rs.next(); ++count) {
         }
      } catch (SQLException var6) {
         var6.printStackTrace();
      }

      return count;
   }
}
