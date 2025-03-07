<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Insert title here</title>

<style>
 .banner-bg{
   clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 69% 91%, 30% 98%, 0 93%, 0 0);
 }
</style>
</head>
<body>
<%--Navbar --%>
<%@include file="navbar.jsp" %>



<main class="d-flex align-items-center primary-bg banner-bg" style="height : 95vh">
<div class="container">
      <div class="row">
          <div class="col-md-4 offset-md-4">
             <div class="card">
                  <div class="card-header primary-bg text-white text-center">
                     <i class="fa fa-user-circle fa-3x"></i><br>
                     <p>Login Here</p>
                  </div>
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
                  
                  <div class="card-body">
                     <form action="LoginServlet" method="post">
                        <div class="form-group">
                           <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
						    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.
						  </div>
						  <div class="mb-3">
						    <label for="exampleInputPassword1" class="form-label">Password</label>
						    <input type="password" name="password" required class="form-control" id="exampleInputPassword1">
						  </div>
						  <div class="container text-center">
						   <button type="submit" class="btn btn-primary primary-bg">Submit</button>
						   
                        </div>
                        </div>
                     </form>
                  </div>
                  <div class="card-footer text-center text-white p-4 primary-bg" >
            
                     <p>Create new account ? <a style="color:white; text-decoration:none;font-size:20px;" href="signup_page.jsp">Sign Up</a></p>
                  </div>
             </div>
          </div>
    </div>
  </div>
</main>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


</body>
</html>