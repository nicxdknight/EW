 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "awp";
String userid = "root";
String password = "Optimus@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from seller where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
    
    <head> <title>EW || Seller</title>
            	<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<link rel="stylesheet" type="text/css" href="../CSS/header and footer.css"></head>
<body style="color:#ffcc99;background-color: black">
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
 <button type="button" class="btn btn-outline-danger" style="margin-top: 100px;margin-left: 45%;border: 0px;" >Update Your Product</button>
  <hr align="center" style="width: 80%;color: red;margin-bottom: 50px;">
  <form style="margin-left: 40%;" method="post" action="update-process.jsp">
<input style="display: none;" type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<input style="display: none;" type="text" name="id" value="<%=resultSet.getString("id") %>">
<br>
Product name:<br>
<input style="border: 1px solid red;border-radius: 5px;"type="text" name="name" value="<%=resultSet.getString("name") %>">
<br>
Item type:<br>
<input style="border: 1px solid red;border-radius: 5px;" type="text" name="item" value="<%=resultSet.getString("item") %>">
<br>
Price<br>
<input  style="border: 1px solid red;border-radius: 5px;" type="text" name="price" value="<%=resultSet.getString("price") %>">
<br>
<br>
<input  style="border: 1px solid red;border-radius: 5px;background-color: #ff9933"type="submit" value="submit">
</form>

<hr align="center" style="width: 80%;color: red;margin-bottom: 50px;">
  
  
  
  
  <div class="footer-copyright text-center py-3" style="color: white">© 2020 Copyright:
                           <a href="header and footer.html"> EW</a></div>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html> 