<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="error_page.jsp" %>

<% 
User user=(User)session.getAttribute("currentUser");

if(user==null){
  response.sendRedirect("login_page.jsp");
}

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
<title>Navbar</title>
<style>
 body{
   background:url(img/bg.jpg);
   background-size:cover;
   background-attachment:fixed;
 }
</style>

</head>
<body>
       
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
          <a class="nav-link active text-white" aria-current="page" href="https://www.geeksforgeeks.org/"><i class="fa fa-user-secret"></i> Learn Coding</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <i class="fa fa-arrows-alt"></i> Categories
          </a>
                <ul class="dropdown-menu text-white"> 
                   <jsp:include page="category.jsp" />
                   <li class="container text-center">
			            <a href="#!" class="btn btn-primary m-2" data-bs-toggle="modal" data-bs-target="#do-cat-modal">Add Category</a>
			        </li>
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
    
  <% 
                       Message m= (Message)session.getAttribute("msg");
                       if(m!=null){
                   %>
                   
		                  <div class="alert <%= m.getCssClass() %>" role="alert">
		                      <i class="fa fa-warning"> </i>
		                      <%= m.getContent() %>
							  
						  </div>
						  
				  <%
				       session.removeAttribute("msg");
                       }
                  %>
                    
                    
                    
                    
    <!-- main body of the page -->                
                    
     <main>
       <div class="container">
       
         <div class="row mt-4">
            <!-- first col -->
            <div class="col-md-4">
                <!-- categories -->
                <div class="list-group">
				  <a href="#" onclick="getPosts(0,this)"class=" c-link list-group-item list-group-item-action active" aria-current="true">
				    All Posts
				  </a>
				  
				  <% 
				    PostDao d=new PostDao(ConnectionProvider.getConnection());
				    ArrayList<Category> list = d.getAllCategories();
				    for(Category cat:list){
				 
                     
                   %>
				   <a href="#" onclick="getPosts(<%= cat.getCid() %>,this)" class=" c-link list-group-item list-group-item-action"><%= cat.getName() %></a>
				   <% 
				    }
				  %>
				</div>
            </div> 
            <!-- second column -->
            <div class="col-md-8" >
                <div class="container text-center " id="loader"  >
                  <i class="fa fa-refresh fa-spin fa-4x"></i>
                  <h3 class="mt-2">Loading...</h3>
                
                </div>
	            <div class="container-fluid" id="post-container">
	            </div>
            </div>
         </div>  
       </div>
     </main>               
     <!-- end of main  -->               
                    
                    
                    
                    
                    
                    
                    
                    
    <%--profile model --%>
    
    <!-- Button trigger modal -->

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
                   ArrayList<Category> lt=postd.getAllCategories();
                   for(Category c:lt){
                	   
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

 <!-- Modal for Adding Category -->
<div class="modal fade" id="do-cat-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Add new Category</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="CatServlet" method="post" id="add-cat-form" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Category Name" name="category">
                    </div>
                    <div class="form-group">
                        <textarea rows="" cols="" class="form-control" placeholder="Category Description" name="category_des"></textarea>
                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-primary mt-3">Add</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

       
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="js/myjs.js"></script>  
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
});
	   
</script>

<!-- now add post js -->

<script>

  $(document).ready(function(){
	 $("#add-post-form").on('submit',function(event){
		 
		event.preventDefault();
		
		console.log("submit")
		let form=new FormData(this);
		
		//now req to server
		
		$.ajax({
			url: "AddPostServlet",
			type:"POST",
			data:form,
			
			success:function(data,textStatus,jqXHR){
			  console.log(data);
			  if(data.trim()=='success'){
				  swal("Good job!","Saved successfully","success");
			  }
			  else
				  swal("Error!","Something went wrong ! try again","error");
				  
			},
			error:function(jqXHR, textStatus,errorThrown){
				wal("Error!","Something went wrong ! try again","error");
			},
			processData:false,
			contentType:false
		});
	 });
	  
  });
</script>

<!-- loading posst using ajax -->
<script type="text/javascript">
    function getPosts(catId,temp){
    	$("#loader").show();
    	$('#post-container').hide();
    	
    	$(".c-link").removeClass('active');
    	$.ajax({
    		url:"load_post.jsp",
    		data:{cid: catId},
    		success: function (data,textStatus,jqXHR){
    			console.log(data)
    			$("#loader").hide();
    			$('#post-container').show();
    			$('#post-container').html(data);
    			$(temp).addClass('active');
    			
    		}
    	});
    }
    $(document).ready(function(e){
    	let allpostref=$('.c-link')[0] 	
    	getPosts(0,allpostref)
    });

</script>

</body>
</html>
