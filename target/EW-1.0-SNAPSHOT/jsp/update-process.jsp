<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/awp";%>
<%!String user = "root";%>
<%!String psw = "Optimus@123";%>
<%
String id = request.getParameter("id");
//String first_name=request.getParameter("first_name");
//String last_name=request.getParameter("last_name");
//String city_name=request.getParameter("city_name");
//String email=request.getParameter("email");
String name = request.getParameter("name");
String item = request.getParameter("item");
String price = request.getParameter("price");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
//String sql="Update users set id=?,first_name=?,last_name=?,city_name=?,email=? where id="+id;
String sql="Update seller set id=?,name=?,item=?,price=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
//ps.setString(2, first_name);
//ps.setString(3, last_name);
//ps.setString(4, city_name);
//ps.setString(5, email);
ps.setString(2,name);
ps.setString(3,item);
ps.setFloat(4, Float.parseFloat(price));
int i = ps.executeUpdate();
if(i > 0)
{
out.println("<script type=\"text/javascript\">alert(" + "done" + ");</script>");
response.sendRedirect("../seller.jsp");
}
else
{
String someMessage = "Error in updating record";
out.println("<script type=\"text/javascript\">alert(" + someMessage + ");</script>");
response.sendRedirect("../seller.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%> 
<!DOCTYPE html>
<html>
    <head>
        <title>EW || Seller</title>
            	<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<link rel="stylesheet" type="text/css" href="../CSS/header and footer.css">
    </head>
    <body style="color:#ffcc99">
   
        
        <nav class="navbar sticky-top navbar-expand-lg navbar-dark " style="background-color: black;">
            <a class="navbar-brand" href="../home.jsp">EW</a>
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

      
   
    <li class="nav-item">
        <a class="nav-link" href="#">Deliver With Us</a>
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

</div>
      
</nav>
  
  
        <button type="button" class="btn btn-outline-danger" style="margin-top: 100px;margin-left: 45%;border: 0px;" ><%out.println("Your Data is added");%></button>
  <hr align="center" style="width: 80%;color: red;margin-bottom: 50px;">
  <br>
  <button type="button" class="btn btn-outline-danger" style="margin-top: 100px;margin-left: 45%;border: 0px;" ><a href="../seller.jsp">Go Back</a></button>
  <hr align="center" style="width: 80%;color: red;margin-bottom: 50px;">
  
  
  
  
  <div class="footer-copyright text-center py-3" style="color: white">? 2020 Copyright:
                           <a href="header and footer.html"> EW</a></div>

</body>
</html> 
