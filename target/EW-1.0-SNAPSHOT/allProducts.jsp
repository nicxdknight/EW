<%-- 
    Document   : allProducts.jsp
    Created on : 16-Jun-2020, 7:09:44 PM
    Author     : harsh
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
<link rel="stylesheet" href="CSS/allProducts.css">
    </head>
 
    <body>
     <nav class="navbar sticky-top navbar-expand-lg navbar-dark " style="background-color: black;">
  <a class="navbar-brand" href="#">EW</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
<!--      <li class="nav-item active"><meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
   Login
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
        <div class="container py-5">
    <div class="row text-center text-white mb-5">
        <div class="col-lg-7 mx-auto">
            <h1 class="display-4">Product List</h1>
        </div>
    </div>
            
    <!-- All items -->
    <%
    List<Items> itemsList = (List<Items>) request.getAttribute("itemsList");
     for(Items item: itemsList){
  %>
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <!-- List group-->
            <ul class="list-group shadow">
                <!-- list group item-->
                <li class="list-group-item">
                    <!-- Custom content-->
                    <div class="media align-items-lg-center flex-column flex-lg-row p-3">
                        <div class="media-body order-2 order-lg-1">
                            <h5 class="mt-0 font-weight-bold mb-2"><%= item.getName() %></h5>
                            <p class="font-italic text-muted mb-0 small"><%= item.getDescription()%></p>
                            <div class="d-flex align-items-center justify-content-between mt-1">
                                <h6 class="font-weight-bold my-2">₹<%= item.getPrice()%></h6>
                                <ul class="list-inline small">
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star-o text-gray"></i></li>
                                </ul>
                            </div>
                        </div><img src="<%= item.getImage() %>" alt="Generic placeholder image" width="200" height="200" class="ml-lg-5 order-1 order-lg-2">
                    </div> <!-- End -->
                </li> <!-- End -->
                
                
            </ul> <!-- End -->
        </div>
    </div>
   <%
   }
   %>
   
</div>
<a href="view_all_items.html"><button type="button"  class="btn btn-primary btn-lg" style="margin-top: 20px;margin-left: 45%;border: 0px;" >Start Purchase</button></a>
  <hr align="center" style="width: 80%;color: red;margin-bottom: 50px;">
        
<jsp:include page="jsp/footer1.jsp" />
   <div class="footer-copyright text-center py-3" style="color: white;padding-top: 1px; margin-left: 7%;">© 2020 Copyright:
    <a href="#"> EW</a></div>
</body>
</html>

