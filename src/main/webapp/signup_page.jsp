<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>
 .banner-bg{
   clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 69% 91%, 30% 98%, 0 93%, 0 0);
 }
</style>
</head>
<body>
<%--Navbar --%>
<%@include file="navbar.jsp" %>
<main class="d-flex align-items-center primary-bg banner-bg p-5">
   
    <div class="container" style="padding-bottom:100px;">
    
       <div class="col-md-6 offset-md-3">
          <div class="card" >
            <div class="card-header text-center primary-bg text-white">
               <i class="fa fa-user-plus  fa-3x" ></i><br>
               <p>Register Here</p>
              
            </div>
            <div class="card-body">
                   <form action="RegisterServlet" method="post" id="myform">
                       <div class="form-group">
                       
                           <label for="exampleInputName1" class="form-label">User Name</label>
						    <input type="text" name ="name" class="form-control" id="user_name" aria-describedby="emailHelp">
						    <div id="textHelp" class="form-text">
						  </div>
						  
						  
                           <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input type="email" name ="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
						    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.
						  </div>
						  
						  <div class="mb-3">
						    <label for="exampleInputPassword1" class="form-label">Password</label>
						    <input type="password" id="user_pass" name ="password" class="form-control" >
						    <p id="ps"><p>
						  </div>
						  <div>
						    <label for="gender" class="form-label">Select Gender</label><br>
							<input type="radio" id="male" name="gender" value="Male"> Male
							<input type="radio" id="female" name="gender" value="Female"> Female
                         </div>
						    
						  <br>
					
						    <div>
						    <textarea name="about" id=""  rows="4" placeholder="Enter something about yourself"></textarea>
						    </div>
						   
						  <br>
						  <div class="mb-3 form-check">
						    <input type="checkbox" name="check"  class="form-check-input" id="exampleCheck1">
						    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
						  </div><br>
						  <div class="container text-center " id="loader" style="display:none;">
						     <i class="fa fa-refresh fa-spin fa-4x"></i>
						     <h4>Please Wait...</h4>
						    
						  </div>
						  
						  <button type="submit" id="submit-btn"class="btn btn-primary primary-bg">Submit</button>
                        
                        </div>
                     </form>
            
            </div>
            <div class="card-footer text-center primary-bg text-white p-4" >
            
              <p>Already have an account ? <a style="color:white; text-decoration:none;font-size:20px;" href="login_page.jsp">Login</a>
</p>
        
            
            </div>
          </div>
       
       </div>
    
    
    </div>






</main>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script>
$(document).ready(function() {
    $("#user_pass").on('keyup', function() {
        let pass = $(this).val();
        if (pass.length < 8 || !/\d/.test(pass) || !/[a-zA-Z]/.test(pass)) {
            $('#ps').html("Password must be greater than 8 characters and use a combination of numbers, letters, and symbols");
            $('#ps').addClass('text-red');
        } else {
            $('#ps').html(""); // Clear the message if the password is valid
            $('#ps').removeClass('red-text');
        }
    });

    $("#myform").on('submit', function(event) {
        event.preventDefault();
        let form = new FormData(this);
        
        $("#submit-btn").hide();
        $("#loader").show();

        $.ajax({
            url: "RegisterServlet",
            type: 'POST',
            data: form,
            success: function(data, textStatus, jqXHR) {
                console.log(data); // Log server response for debugging
                
                $("#submit-btn").show();
                $("#loader").hide();
                
                if (data.trim() === 'done') { 
                    swal("Successfully Registered!")
                        .then((value) => {
                            window.location = "login_page.jsp";  // Redirect to login page
                        });
                } else {
                    swal(data);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
            	console.log(jqXHR);
                swal("Something went wrong! Try again.")
                    .then((value) => {
                        window.location = "signup_page.jsp";  // Redirect back to signup if there's an error
                    });
                $("#submit-btn").show();
                $("#loader").hide();
            },
            processData: false,
            contentType: false
        });
    });
});

    </script>
</body>
</html>