<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.text.DateFormat" %>

<% 
User user=(User)session.getAttribute("currentUser");

if(user==null){
  response.sendRedirect("login_page.jsp");
}

%>
<%
   int postId=Integer.parseInt(request.getParameter("post_id"));
   PostDao d=new PostDao(ConnectionProvider.getConnection());
   Post p=d.getPostByPostId(postId);
   
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="css/mystyle.css"></link>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Use Font Awesome 4 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<title><%= p.getPtitle() %> || TechBlog</title>
<style>
 body{
   background:url(img/bg.jpg);
   background-size:cover;
   background-attachment:fixed;
 }
</style>
<script src="js/myjs.js"></script>


</head>
<body>

<!-- navbar -->

<nav class="light navbar navbar-expand-lg primary-bg ">
  <div class="container-fluid">
    <!-- Change 'fas' to 'fa' for Font Awesome 4 -->
    <a class="navbar-brand text-white" href="index.jsp"><i class='fa fa-tumblr-square' style='font-size:24px'></i> Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-white" aria-current="page" href="profile.jsp"><i class="fa fa-user-secret"></i> Learn Coding</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <i class="fa fa-arrows-alt"></i> Categories
          </a>
          <ul class="dropdown-menu text-white">
            <li><a class="dropdown-item" href="#">Programming Language</a></li>
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structure</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <!-- Change 'fas' to 'fa' -->
          
          <a class="nav-link text-white" href="#"> <i class='fa fa-phone-square'></i> Contact</a>
        </li>
        
         <li class="nav-item">
          <!-- Change 'fas' to 'fa' -->
          
          <a class="nav-link text-white" href="#!" data-bs-toggle="modal" data-bs-target="#do-post-modal"> <i class='fa fa-picture-o'></i> Do Post</a>
        </li>
        
        
      </ul>
      
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
          <a class="nav-link text-white"  href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"> <i class='fa fa-user'></i> <%= user.getName() %></a>
            
          </li>
          <li class="nav-item">
          <!-- Change 'fas' to 'fa' -->
          
          <a class="nav-link text-white" href="LogoutServlet"> <i class='fa fa-user-times'></i> Logout</a>
        </li>
      
      </ul>
      
    </div>
  </div>
</nav>

<!-- end of navbar -->






<!-- main content of body -->


   <div class="container">
   
     <div class="row my-4" >
     
       <div class="col-md-8 offset-md-2">
       
          <div class="card">
             
             <div class="card-header primary-bg text-white">
                  <h4 class="post-title" style="font-weight:100;font-size:30px;"><%= p.getPtitle() %></h4>
             </div>
             
             <div class="card-body">
             
                <img src="blog_pics/<%= p.getPpic() %>" style="max-width:150px; max-height:150px; border-radius:50%;">
                
                <div class="row my-3" style="border:0.5px solid #1976d2; padding:3px;">
				    <!-- First Column (8 parts) -->
				    <div class="col-md-8">
				    <% UserDao usr=new UserDao(ConnectionProvider.getConnection()); %>
				        <p class="post-user-info" style="font-size:20px; text-decoration:none;"><a style="text-decoration:none;" href="#!">
				            <%= usr.getUserByUserId(p.getUid()).getName().toUpperCase()%></a> has posted
				        </p>
				    </div>
				
				    <!-- Second Column (4 parts) -->
				    <div class="col-md-4">
				        <p class="post-date" style="font-style:italic;font-weight:bold;"><%= DateFormat.getDateInstance().format(p.getPdate()) %></p>
				    </div>
				</div>

                
                <p class="post-content" style="font-weight:100;font-size:25px;"><%= p.getPcontent() %></p><br><r>
                <div class="post-code"> <pre><%= p.getPcode() %></pre></div>
              </div>
           
             
          
             <div class="card-footer text-center primary-bg">
                  <% LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                     boolean isLiked=ld.isLikedByUser(p.getPid(), user.getId());
                     int likeCount = ld.countLikeOnPost(p.getPid()); // Get total likes
                 %>
            <a href="#!" onclick="doLike(<%= p.getPid() %>, <%= user.getId() %>)" class="btn btn-outline-light btn-sm">
               <i id="thumbs-<%= p.getPid() %>" class="fa <%=(isLiked ? "fa-thumbs-up" : "fa-thumbs-o-up")%>">
                    <span class="like-counter" data-post="<%= p.getPid() %>"><%= likeCount %></span>
                </i>
            </a>
            
            
            <a href="#" class="btn btn-outline-light btn-sm" data-toggle="modal" data-target="#myModal">Liked By</a>

		    <!-- Pop-up Modal -->
		    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		        <div class="modal-dialog" role="document">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="exampleModalLabel">Liked By</h5>
		                    
		                </div>
		                <div class="modal-body">
		                  <%  
                        // Get the list of user IDs who liked the post
                        ArrayList<Integer> list = ld.likedBy(p.getPid()); // Make sure this method exists in LikeDao
                        UserDao us=new UserDao(ConnectionProvider.getConnection());
                        if (list.isEmpty()) {
                            %>
                            <p>No users have liked this post yet.</p>
                            <%
                        } else {
                            for (Integer l : list) {
                            	String s=us.likedUser(l);
                                %>
                                <p>User Name : <%= s %></p> 
                                <%
                            }
                        }
                    %>
		                </div>
		                <div class="modal-footer">
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		                </div>
		            </div>
		        </div>
		    </div>
				
              <% CommentDao cm=new CommentDao(ConnectionProvider.getConnection()); 
                 int count=cm.countComment(p.getPid());
              %>
                
              <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"> <span><%= count %>  </span></i></a>     
             </div>
             
           <div class="d-flex justify-content-between align-items-center m-3">
            <span style="font-size:30px;">Comments</span>
            
            <button type="button" class="btn btn-outline-primary " data-bs-toggle="modal" data-bs-target="#comment-modal" style="font-size:20px; font-weight:bolder;">
               +
            </button>
        
		        <!-- The Modal -->
		        <div class="modal fade" id="comment-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		            <div class="modal-dialog">
		                <div class="modal-content">
		                    <div class="modal-header primary-bg text-white">
		                        <h1 class="modal-title fs-5" id="exampleModalLabel">Comment</h1>
		                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                    </div>
		                    <div class="modal-body">
		                        <div class="container text-center">
		                            <img src="pics/<%= user.getProfile() %>" style="max-width:50px; max-height:50px; border-radius:50%;">
		                            <h5 class="modal-title fs-5"  id="exampleModalLabel"><%= user.getName() %></h5>
		                            <div >
		                                <form action="CommentServlet" method="post" class="post-comment">
		                                         <input type="hidden" name="jspSource" value="show_blog_page.jsp">
		                                        <input type="hidden" name="pid" value="<%= p.getPid() %>"> <!-- Set this dynamically -->
                                                <input type="hidden" name="uid" value="<%= user.getId() %>"> 
		                                    <table class="table">
		                                        <tbody>
		                                            <tr>
		                                                <td>
		                                                    <textarea name="comment" placeholder="Write comments here" rows="4" ></textarea>
		                                                </td>
		                                            </tr>
		                                        </tbody>
		                                    </table>
		                                    <div id="post-comment-response"></div><br>
		                                    <!-- Modal footer with buttons -->
		                                    <div class="modal-footer">
		                                        <button type="submit" id="comment-btn-submit" class="btn btn-outline-primary">Post Comment</button>
		                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		                                    </div>
		                                </form>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        
		    </div>
		        <%
		        UserDao ud=new UserDao(ConnectionProvider.getConnection());
		        List<Comment> lt= cm.getCommentsByPostId(p.getPid());
		        
		        
			    for(Comment l:lt){
		            User u=ud.getUserByUserId(l.getUserId());
			        %>
			        <div  id="comment-<%= l.getId() %>" class="container">	
				        <div class="d-flex justify-content-between align-items-center m-1 ">
				           <span  Style="font-weight:400; font-size:25px;" >  
				           <img src="pics/<%= u.getProfile() %>" style="max-width:40px; max-height:40px; border-radius:50%;">
				            <%= u.getName() %></span>
				            <span ><%= DateFormat.getDateInstance().format(l.getCreatedAt())%> 
				            <% if (l.getUserId() == user.getId()) { %>
					    <button type="button" class="btn btn-outline-secondary btn-sm delete-comment" 
					            data-comment-id="<%= l.getId() %>" >
					            
					        <i class="fa fa-trash"></i>
					    </button>
					<% } %>
					</span>
				            
				        </div>
			            <div class="container mt-0 ml-4"> <%= l.getContent() %></div>
			         </div>   
			         <br>      
			       <%
			        }
		        
			    %>
		        
		        
			
<!-- end of main content  -->




<!--profile  Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-bg text-white ">
        <h1 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
	       <div class="container text-center">
	       <img src="pics/<%= user.getProfile() %>" style="max-width:150px; max-height:150px; border-radius:50%;">
	        <h5 class="modal-title fs-5 mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
	        
	      <div id="profile-details">  
	        <table class="table">
			  
			  <tbody>
			    <tr>
			      <th scope="row">Id</th>
			      <td><%= user.getId() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Email</th>
			      <td><%= user.getEmail() %></td>
			     
			    </tr>
			    <tr>
			      <th scope="row">Gender</th>
			      <td><%= user.getGender() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Status</th>
			      <td><%= user.getAbout() %></td>
			     
			    </tr>
			    <tr>
			      <th scope="row">Registered on </th>
			      <td><%= user.getDatetime() %></td>
			       
			    </tr>
			  </tbody>
			</table>
		   </div>
	       
	       <div id="profile-edit" style="display:none;">
                <h3 class="mt-2">Please Edit Carefully</h3>
                <form action="EditServlet" method="post" enctype="multipart/form-data">
                
                  <table class="table">
                    <tr>
				      <th>Id</th>
				      <td><%= user.getId() %></td>
				      
				    </tr>
				    <tr>
				      <th>Name</th>
				      <td><input type="text" class="form-control" name="user_name" value=<%= user.getName() %>></td>
				     
				    </tr>
				    <tr>
				      <th>Email</th>
				      <td><input type="email" class="form-control" name="user_email" value=<%= user.getEmail() %>></td>
				     
				    </tr>
				    <tr>
				      <th>Password</th>
				      <td><input type="password" class="form-control" name="user_password" value=<%= user.getPassword() %>></td>
				   </tr>
				    <tr>
				      <th>Gender</th>
				      <td><%= user.getGender() %></td>
				     
				    </tr>
				    <tr>
				      <th>Status</th>
				      <td>
				         <textarea rows="3"class="form-control" name="user_about"><%= user.getAbout() %></textarea> 
                      </td> 
				    </tr>
				    <tr>
				      <th>Registered on</th>
				      <td><%= user.getDatetime() %></td>
				     </tr>
	                  <tr>
	                      <th>New Profile</th>
	                      <td><input class="form-control" type="file" name="user_profile" value=<%= user.getProfile() %>></td>
	                  </tr>
	                
                   
                  </table>
                
                <div class="container">
                  <button type="submit" class="btn btn-outline-primary">Save</button>
                </div>
                </form>
                
	       </div>
	       
	    </div>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" id="edit-profile-button"  class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
<%--End of profile modal --%> 




<%-- Do Post modal --%>

<!-- Button trigger modal -->

<div class="modal fade" id="do-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> Provide the post details </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         
         <form action="AddPostServlet" method="post" id="add-post-form">
            
            <div class="form-group">
              <select class="form-control" name="cid">
                 <option selected disabled>---Select Category---</option>
                 
                 <%
                   PostDao postd=new PostDao(ConnectionProvider.getConnection());
                   ArrayList<Category> al=postd.getAllCategories();
                   for(Category c:al){
                	   
                 %>
                 
                 <option value="<%=c.getCid() %>" ><%= c.getName() %></option>
                 
                 
                 <%
                   }
                 %>
              </select>
            </div>
            
            <div class="form-group">
               <input name="ptitle" type="text" placeholder="Enter post Title" class="form-control"/>
            </div>
            
            <div class="form-group">
               <input name="pcontent"type="text" placeholder="Enter post Content" style="height:200px" class="form-control"/>
            </div>
            
            <div class="form-group">
               <input name="pcode" type="text" placeholder="Enter post program (if any)" style="height:200px" class="form-control"/>
            </div>
             
            <div class="form-group">
               <label>Select your pic </label><br>
               <input type="file" name="pic">
            </div>  
            <div class="container text-center">
            <button type ="submit" class="btn btn-outline-primary">Post</button>  
            </div>      
         </form>
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<%-- end of Do Post --%>


       
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
   $(document).ready(function(){
	   let editStatus=false;
	   
	   $('#edit-profile-button').click(function(){
		  if(editStatus==false){
			   $('#profile-details').hide();
			   $('#profile-edit').show();
			   editStatus=true;
			   $(this).text("Back")
		  }else{
			  $('#profile-details').show();
			   $('#profile-edit').hide();
			   editStatus=false;
			   $(this).text("Edit")
		  }
	   });  
	    
	   
	   

	   $(document).on('submit', '.post-comment', function(event) {
		    event.preventDefault(); // Prevent default form submission

		    var formData = $(this).serialize(); // Serialize form data

		    $.ajax({
		        type: 'POST',
		        url: $(this).attr('action'), // Use the form action URL
		        data: formData,
		        success: function(response) {
		            if(response.trim() === "success") {
		            	$('#post-comment-response').css('color', 'green');
		            	$('#post-comment-response').html("Comment posted successfully!");
		                $('#comment-modal').modal('hide'); // Hide the modal
		                $('#comment-form')[0].reset(); // Reset the form
		                // Optionally, you can also update the comments section dynamically here
		            }  
		            else if(response.trim() === "empty") {
		            	$('#post-comment-response').css('color', 'red');
		            	$('#post-comment-response').html("Please write something (Empty comment not allowed)");
		            	$('#post-comment-response').show();
		            }
		            else {
		            	$('#post-comment-response').css('color', 'red');
		            	$('#post-comment-response').html('Error posting comment: ' + response);
		            
		            }
		        },
		        error: function() {
		            alert('Error posting comment');
		        }
		    });
		});

	   $(document).on('input', 'textarea[name="comment"]', function() {
		    var commentText = $(this).val().trim();
		    if (commentText.length > 0) {
		        $('#post-comment-response').hide(); // Hide the message if there is content
		    } else {
		        $('#post-comment-response').show(); // Show the message if the textarea is empty
		    }
		});

	   
	   
	   <!-- Form and JavaScript should be included in the HTML file -->
	   
	   
	       $(document).on('click', '.delete-comment', function() {
	           var commentId = $(this).data('comment-id'); // Get the comment ID from the button

	           $.ajax({
	               type: 'POST',
	               url: 'CommentServlet',
	               data: { 
	                   commentId: commentId,  
	                   jspSource: "deleteComment"  // Adding a JSP source or flag to differentiate delete action
	               },
	               success: function(response) {
	                   if (response.trim() === 'success') {
	                       // Hide and then remove the comment element from the DOM
	                       $('#comment-' + commentId).fadeOut(300, function() {
	                           $(this).remove(); // Remove the element after fading out
	                       });
	                   } else {
	                       alert('Error deleting comment: ' + response);
	                   }
	               },
	               error: function() {
	                   alert('Error deleting comment');
	               }
	           });
	       });
	 


	    
});
	   
</script>




</body>
</html>