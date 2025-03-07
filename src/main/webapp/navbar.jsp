<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mystyle.css"></link>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- Use Font Awesome 4 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Navbar</title>
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



            
        </li>
        <li class="nav-item">
          <!-- Change 'fas' to 'fa' -->
          <a class="nav-link text-white" href="#" data-bs-toggle="modal" data-bs-target="#do-contact-modal"> <i class='fa fa-phone-square'></i> Contact</a>
        </li>
        <li class="nav-item">
          <!-- Change 'fas' to 'fa' -->
          
          <a class="nav-link text-white" href="login_page.jsp"> <i class='fa fa-user'></i> Login</a>
        </li>
        <li class="nav-item">
          <!-- Change 'fas' to 'fa' -->
          
          <a class="nav-link text-white" href="signup_page.jsp"> <i class='fa fa-user-plus'></i> Sign Up</a>
        </li>
      </ul>
      
     <!-- Modal for Adding Category -->
<div class="modal fade" id="do-cat-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Add new Category</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="add-cat-form" method="post" enctype="multipart/form-data">
				    <div class="form-group">
				        <input type="text" class="form-control" placeholder="Category Name" name="category" required>
				    </div>
				    <div class="form-group">
				        <textarea rows="" cols="" class="form-control" placeholder="Category Description" name="category_des" required></textarea>
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



     <!-- Modal for Adding Contact -->
<div class="modal fade" id="do-contact-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Add new Category</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="add-contact-form" method="post" enctype="multipart/form-data">
				    <div class="form-group">
				        <input type="email" class="form-control" placeholder="Email Address" name="mail" required>
				    </div>
				    <div class="form-group">
				        <textarea rows="" cols="" class="form-control" placeholder="Enter your Message (your Query)" name="msg" required></textarea>
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


      
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    
     <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
     
     <script type="text/javascript" src="js/myjs.js"></script>  

<script>
   
$(document).ready(function() {
    $("#add-contact-form").on('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission
        
        let form = new FormData(this);

        // AJAX request to server
        $.ajax({
            data: form, // The form data
            processData: false, // Don't process the data
            contentType: false, // Don't set content type

            success: function(data) {
				console.log("Response from server: ", data);
                 swal("Thank You!", "We will try to respond your message as soon as possible", "success");

            },
            error: function() {
                swal("Error!", "Oops! Something went wrong! Try again", "error");
            }
        });
    });
});

   
</script>

</body>
</html>
