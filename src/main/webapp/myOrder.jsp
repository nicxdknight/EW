<%-- 
    Document   : myOrder.jsp
    Created on : 17-Jun-2020, 9:06:45 AM
    Author     : harsh
--%>

<%@page import="java.util.List"%>
<%@page import="com.Items"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
<html>
    <head>
        <title>EW | Orders</title>
        		<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="CSS/orders.css">
    
    </head>
 
    <body>
        <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
           request.setAttribute("errMessage", "Please Login First");
             RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
             requestDispatcher.forward(request, response);
            
        	response.sendRedirect("index.jsp");
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
          
        </div>
      </li>
   
    <li class="nav-item">
        <a class="nav-link" href="seller.jsp">Seller With Us</a>
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
     
    <a class="dropdown-item" href="view_cart.jsp">Cart</a>
    <a class="dropdown-item" href="cng_paswd.jsp">Change Password</a>
    <a class="dropdown-item" href="my_order.html">My Order</a>
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
  
  <%
    List<Items> itemsList = (List<Items>) request.getAttribute("itemsList");
  %>
  <%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String date = sdf.format(new Date());
%>
  
    <%  
        
        if((itemsList == null) || (itemsList.isEmpty())){
    %>        
    <h3>      No Orders !!</h3>
    <a href="ViewAllItems"><button> Purchase Something </button></a>
    <%     
        } else {
    %> 
    
    <div class="container-fluid my-5 d-flex justify-content-center">
    <div class="card card-1">
        <div class="card-header bg-white">
            <div class="media flex-sm-row flex-column-reverse justify-content-between ">
                <div class="col my-auto">
                    <h4 class="mb-0">Thanks for your Order, <span class="change-color"><%=email%></span> !</h4>
                </div>
                <div class="col-auto text-center my-auto pl-0 pt-sm-4"> <img class="img-fluid my-auto align-items-center mb-0 pt-3" src="img/ew.jpeg" width="115" height="115">
                    <p class="mb-4 pt-0 Glasses" style="margin-top: 13px;">Everything is Worthy</p>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row justify-content-between mb-3">
                <div class="col-auto">
                    <h6 class="color-1 mb-0 change-color">Receipt</h6>
                </div>
                <div class="col-auto "> <small><%=date%></small> </div>
            </div>
            <%
            int q = 0;
            int net_e = 0;
            double total = 0d;
            for(Items item: itemsList){
            %>
            <div class="row">
                <div class="col">
                    <div class="card card-2">
                        <div class="card-body">
                            <div class="media">
                                <div class="sq align-self-center "> <img class="img-fluid my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="<%= item.getImage() %>" width="135" height="135" /> </div>
                                <div class="media-body my-auto text-right">
                                    <div class="row my-auto flex-column flex-md-row">
                                        <div class="col my-auto">
                                            <h6 class="mb-0"> <%= item.getName() %></h6>
                                        </div>
                                        
                                        <div class="col my-auto"> <small>Qty : 
                                            <% String strq = (String)session.getAttribute("id_"+Integer.toString(item.getId())); 
                                        try{ 
                                              q = Integer.parseInt(strq);
                                        }catch(NumberFormatException e){
                                              e.printStackTrace();
                                         }
                                          net_e += q;
                                        %>
                                        <%= q %>
                                            </small></div>
                                        <div class="col my-auto">
                                            <h6 class="mb-0">&#8377;
                                            <% double e_total = q*item.getPrice(); 
                                                total += e_total;
                                              %>
                                              <%= e_total %>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="my-3 ">
                            <div class="row">
                                <div class="col-md-3 mb-3"> <small> Track Order <span><i class=" ml-2 fa fa-refresh" aria-hidden="true"></i></span></small> </div>
                                <div class="col mt-auto">
                                    <div class="progress my-auto">
                                        <div class="progress-bar progress-bar rounded" style="width: 62%" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="media row justify-content-between ">
                                        <div class="col-auto text-right"><span> <small class="text-right mr-sm-2"></small> <i class="fa fa-circle active"></i> </span></div>
                                        <div class="flex-col"> <span> <small class="text-right mr-sm-2">Out for delivary</small><i class="fa fa-circle active"></i></span></div>
                                        <div class="col-auto flex-col-auto"><small class="text-right mr-sm-2">Delivered</small><span> <i class="fa fa-circle"></i></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            
            
        </div>
        <div class="card-footer">
            <div class="jumbotron-fluid">
                <div class="row justify-content-between ">
                    <div class="col-auto my-auto ">
                        <h2 class="mb-0 font-weight-bold">TOTAL PAID</h2>
                    </div>
                    <div class="col-auto my-auto ml-auto">
                        <h1 class="display-3 ">&#8377; <%= total %></h1>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>
                
                    
 <%
     }
 %>
    
 <p class="lead" style="margin-left: 45%;">
    <a class="btn btn-primary btn-sm" href="home.jsp" role="button">Continue to homepage</a>
  </p>
  
   <jsp:include page="jsp/footer1.jsp" />
   <div class="footer-copyright text-center py-3" style="color: white;padding-top: 1px; margin-left: 7%;">© 2020 Copyright:
    <a href="#"> EW</a></div>
    </body>
    
</html>
