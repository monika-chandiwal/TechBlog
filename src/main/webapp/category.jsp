<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="error_page.jsp" %>

<% 
    CatDao c = new CatDao(ConnectionProvider.getConnection());
    ArrayList<String> categories = c.getAllCategories();
    if (categories.isEmpty()) {
%>
    <li><a class="dropdown-item" href="#">No categories available</a></li>
<%
    } else {
        for (String cat : categories) {
%>
    <li><a class="dropdown-item" href="#"><%= cat %></a></li>
<%
        }
    }
%>
