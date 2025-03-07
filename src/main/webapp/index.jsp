<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="com.tech.blog.helper.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Insert title here</title>

<style>
 .banner-bg{
   clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 69% 91%, 30% 98%, 0 93%, 0 0);
 }
 .banner-footer-bg
 {
    clip-path: polygon(32% 13%, 68% 0, 100% 11%, 100% 100%, 70% 100%, 30% 100%, 0 99%, 0 0);
 }
</style>
</head>
<body>
<%--Navber --%>
<%@include file="navbar.jsp" %>

<%--Banner --%>
<div class="banner-bg">
<div class="container-fluid primary-bg text-white p-5" >
    <div class="jumbotron">
        <div class="container">
            <h3 class="display-3">Welcome to TechBlog</h3>
            <p>Computer programming or coding is the composition
                of sequences of instructions, called programs, that 
                computers can follow to perform tasks. It involves 
                designing and implementing algorithms, step-by-step 
                specifications of procedures, by writing code in one 
                or more programming languages.
            </p>
            <p>Programmers typically use high-level programming languages that are more easily 
                intelligible to humans than machine code, which is directly 
                executed by the central processing unit.
            </p><br>
            <button class="btn btn-outline-light btn-lg"><i class="fa fa-universal-access"></i> Start ! its Free</button>
            <a href="login_page.jsp" class="btn btn-outline-light btn-lg "><i class="fa fa-user-circle fa-spin"> </i>  Login</a>
        </div>
    </div>
</div>
</div>

<div class="container mt-4">
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card">
                
                <div class="card-body">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="login_page.jsp" class="btn btn-primary">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" >
                
                <div class="card-body">
                    <h5 class="card-title">Python Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="login_page.jsp" class="btn btn-primary">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                
                <div class="card-body">
                    <h5 class="card-title">AL & ML</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="login_page.jsp" class="btn btn-primary">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row g-4 my-4">
        <div class="col-md-4">
            <div class="card">
                
                <div class="card-body">
                    <h5 class="card-title">Graphic Designer</h5>
                    <p class="card-text">Graphic DesignerGraphic design is a creative process involving the use of visual elements to convey messages effectively. It can range from simple logo design to complex digital interfaces.</p>
                    <a href="#" class="btn btn-primary">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" >
                
                <div class="card-body">
                    <h5 class="card-title">Data Structure & Algorithm</h5>
                    <p class="card-text">Data Structure is way of organizing data in computer system so that it can efficiently organize data in computer system. two types of data structure first is primitive and non primitive.</p>
                    <a href="login.jsp" class="btn btn-primary">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                
                <div class="card-body">
                    <h5 class="card-title">Mathematics</h5>
                    <p class="card-text">Mathematics is often referred to as the language of the universe. mathematics In this post play a vital role, we explore some fascinating concepts, applications, and the beauty of mathematics.</p>
                    <a href="login_page.jsp" class="btn btn-primary">Read More</a>
                </div>
            </div>
        </div>
    </div>
</div>


<footer >
<div class="card-footer bg-transparent border-success banner-footer-bg" >
<div class="container-fluid primary-bg text-white pt-5 p-2" >
    
    <div class="jumbotron">
    <div class="row g-0 text-center">
		  <div class="col-4 col-md-4">
		       Email: support@techblog.com
		  </div>
		  <div class="col-2 col-md-3">
		       Phone: +1-234-567-890
		  </div>
		  <div class="col-6 col-md-4">
		       Address: Tech Blog Inc. 123 Innovation Drive, Silicon Valley, CA 94025, USA
		  </div>
	</div>
    <hr>
        <div class="row g-0 text-center">
		  <div class="col-sm-12 col-md-12">
		  
	           <a href="https://www.google.com/" ><i class="fa fa-brands fa-google fa-2x  text-white ms-5"></i></a>
	           <a href="https://www.youtube.com/" ><i class="fa fa-brands fa-youtube fa-2x  text-white ms-5"></i></a>
	           <a href="https://www.facebook.com/" ><i class="fa fa-brands fa-facebook fa-2x  text-white ms-5"></i></a>
	           <a href="https://www.instagram.com/" ><i class="fa fa-brands fa-instagram fa-2x text-white ms-5"></i></a>
	           <a href="https://www.twitter.com/" ><i class="fa fa-brands fa-twitter fa-2x  text-white ms-5"></i></a>

		       
		  </div>
		</div>
        <hr>
        <div class="text-center">
             <p>© 2024 TechBlog. All rights reserved.<br>
             By submitting content to TechBlog, users grant us a non-exclusive, royalty-free license to use, reproduce, and modify the content on our website. The content provided on Tech Blog is for informational purposes only and should not be considered as professional advice.

             </p>
              
         </div>
   </div>
</div>
</div>
</footer>





<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>












</body>
</html>