<%-- 
    Document   : cng_paswd.jsp
    Created on : 14-Jun-2020, 8:55:03 pm
    Author     : NIKHIL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
 <html>
     <head>
         <title>EW | Profile</title>
         
         	<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<link rel="stylesheet" type="text/css" href="CSS/header and footer.css">
     </head>
     <body>
         
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
            <a class="navbar-brand" href="home.jsp">EW</a>
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
    <a class="dropdown-item" href="cng_paswd.jsp">Change Password</a>
    <a class="dropdown-item" href="#">Profile</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="logout.jsp">Logout</a>
  </div>
</div>
  </div>
     
</nav>
  
  
    <button type="button" class="btn btn-outline-danger" style="margin-top: 100px;margin-left: 45%;border: 0px;" >Profile</button>
  <hr align="center" style="width: 80%;color: red;margin-bottom: 50px;">
  
  
  <form action="changePassword.jsp" method="post" style="color: white;">
      <table style="margin-left: 40%;">
    <tr><td style="display: none;">Email</td><td><input style="visibility: hidden;" type="email" name="email" value="<%=email%>" ></td></tr>
<tr><td>Current Password</td><td><input type="password" name="current" ></td></tr>
<tr><td>New Password</td><td><input type="password" name="new"></td></tr>
<tr><td>Confirm Password</td><td><input type="password" name="confirm"></td></tr>
<tr><td><input type="submit" value="Change Password"></td></tr>
</table>
</form>



   <div class="footer-copyright text-center py-3" style="color: white;margin-top: 2%; margin-left: 7%;">© 2020 Copyright:
    <a href="#"> EW</a></div>
     </body>
</html> 