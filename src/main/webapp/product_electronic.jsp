<%-- 
    Document   : home
    Created on : 13-Jun-2020, 7:17:03 pm
    Author     : NIKHIL
--%>

<%@page import="java.util.List"%>
<%@page import="com.Items"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
<html>
    <head>
        <title>EW | Electronics</title>
        		<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="CSS/products.css">
    </head>
 
    <body style="background-color: black;color: white;">
        <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
           request.setAttribute("errMessage", "Please Login First");
             RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
             requestDispatcher.forward(request, response);
            
//        	response.sendRedirect("index.jsp");
        }
        %>
    
       <nav class="navbar sticky-top navbar-expand-lg navbar-dark " style="background-color: black;">
  <a class="navbar-brand" href="#">EW</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
<!--      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>-->
      
       <li class="nav-item">
        <a class="nav-link" href="#">About Us</a>

      </li>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Products
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="product_electronic.jsp">Electronics</a>
            <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Jeans</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Bags</a>
            <div class="dropdown-divider"></div>
             <a class="dropdown-item" href="#">Shirts</a>
        </div>
      </li>
   
    <li class="nav-item">
        <a class="nav-link" href="#">Seller With Us</a>
      </li>

       <li class="nav-item">
        <a class="nav-link" href="#">FAQ</a>
      </li>

    <li class="nav-item">
        <a class="nav-link" href="#">Contact Us</a>
      </li>
    </ul>
<!--    <form class="form-inline my-2 my-lg-0">
     
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><a href="#" style="color: lime;"></a></button>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><a href="logout.jsp">Logout</a></button>
    </form>-->
<div class="btn-group">
  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   <%=email%>
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#">MyOrder</a>
    <a class="dropdown-item" href="#">Cart</a>
    <a class="dropdown-item" href="#">Profile</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="logout.jsp">Logout</a>
  </div>
</div>
  </div>
     
</nav>
      
      
      <nav class="navbar navbar-expand-lg navbar-dark " style="background-color: black;padding-bottom: 30px;">
  <a class="navbar-brand" href="#"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
    <form class="form-inline my-2 my-lg-0" style="margin-left: 30%;" method="POST" action="searchresult.html" >
        <input class="form-control mr-sm-2" type="search" placeholder="Looking for Something" name="searchTerm" aria-label="Search" style="width:500px; ">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
  <h2>All Available Items : </h2>
  <%
    if(session.getAttribute("firstvisit") == null){
    session.setAttribute("firstvisit", false);
  %>
  <form action="AddToCartServlet" method="POST" style="margin-left: 10%;">
      <%
          }else{
  %>
  <form action="AddMoreServlet" method="POST">
      <%
          }
      %>
  <table border=3>
      <tr>
          <th></th>
          <th>Product Description</th>
          <th>Quantity</th>

      </tr>
  <%
    List<Items> itemsList = (List<Items>) request.getAttribute("itemsList");
     for(Items item: itemsList){
  %>
  <tr>
      <td><img src="<%= item.getImage() %>" height="100px" width="80px"></td>
      <td>
          <%= item.getCategory() %><br>
          <%= item.getName() %><br>
          <%= item.getDescription()%><br>
          <%= item.getPrice()%><br>
      </td>
      <td>
          <% 
              out.println("<input type='text' name='item_" + item.getId() + "'/> ");
          %>
      </td>
  </tr>
           
   <%
   }
   %>
  </table>
  <input type="submit" value='Add to Cart / Purchase'>
  </form>
     
  
   <jsp:include page="jsp/footer1.jsp" />
   <div class="footer-copyright text-center py-3" style="color: white;padding-top: 1px; margin-left: 7%;">© 2020 Copyright:
    <a href="#"> EW</a></div>
    </body>
</html>
