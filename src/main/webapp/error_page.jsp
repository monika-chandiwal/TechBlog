<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet"></link>
<style>
 .banner-bg{
   clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 69% 91%, 30% 98%, 0 93%, 0 0);
 }
</style>

</head>
 <div class="container text-center py-2 px-5">
   <img alt="" src="img/error.png" class="img-fluid" style="height:20rem;width:20rem">
   <h4 class="display-3">SORRY<br> something went wrong !</h4><br>
   <%= exception %>
   <a href="index.jsp" class="btn primary-bg text-white btn-lg">Home</a>
 </div>

<body>

</body>
</html>