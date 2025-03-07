<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<script type="text/javascript" src="js/myjs.js"></script> 

<% 
User user=(User)session.getAttribute("currentUser");

if(user==null){
  response.sendRedirect("profile.jsp");
}

%>
<div class="row">

<%
   Thread.sleep(1000);
   PostDao p=new PostDao(ConnectionProvider.getConnection());

   int cid=Integer.parseInt(request.getParameter("cid"));
   List<Post>posts=null;
   if(cid==0)
      posts=p.getAllPosts();
   else 
	  posts=p.getPostByCatId(cid);
   
   if(posts.size()==0)
   {   
	   out.println("<h3 class='display-3 text-center'> No post in this category.</h3>");
   }
   for(Post ps: posts) { 
   %>
       <div class="col-md-6 mt-2">
           <div class="card">
               <img class="card-img-top" style="max-width:150px; max-height:150px;" src="blog_pics/<%= ps.getPpic() %>" alt="">
               <div class="card-body">
                   <b><%= ps.getPtitle() %></b>
                   <p><%= ps.getPcontent() %></p>
                  
                
               </div>
               <div class="card-footer text-center primary-bg">
                  <% LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                     boolean isLiked=ld.isLikedByUser(ps.getPid(), user.getId());
                     int likeCount = ld.countLikeOnPost(ps.getPid()); // Get total likes
            %>
            <a href="#!" onclick="doLike(<%= ps.getPid() %>, <%= user.getId() %>)" class="btn btn-outline-light btn-sm">
               <i id="thumbs-<%= ps.getPid() %>" class="fa <%=(isLiked ? "fa-thumbs-up" : "fa-thumbs-o-up")%>">
                    <span class="like-counter" data-post="<%= ps.getPid() %>"><%= likeCount %></span>
                </i>
            </a>
				


            <a href="show_blog_page.jsp?post_id=<%= ps.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>
                  <% CommentDao cm=new CommentDao(ConnectionProvider.getConnection()); 
                 int count=cm.countComment(ps.getPid());
              %>
                
              <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"> <span><%= count %>  </span></i></a>    
                  
               </div>
           </div>
       </div>
    <% } %>
   </div>
