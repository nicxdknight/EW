<%-- 
    Document   : index
    Created on : 13-Jun-2020, 7:15:51 pm
    Author     : NIKHIL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Averia+Serif+Libre&display=swap" rel="stylesheet">
    <link href="CSS/login.css" rel="stylesheet" type="text/css">
        <title>EW</title>
        <script> 
function validate()
{ 
     var username = document.form.email.value; 
     var password = document.form.password.value;
 
     if (username==null || username=="")
     { 
     alert("Username cannot be blank"); 
     return false; 
     }
     else if(password==null || password=="")
     { 
     alert("Password cannot be blank"); 
     return false; 
     } 
}
</script>
    </head>
 
    <body bg-color="black" >        
        <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to home page if already logged in
        if(email!=null){
            response.sendRedirect("home.jsp");
        }
 
        String status=request.getParameter("status");
        
        if(status!=null){
        	if(status.equals("false")){
        		   out.print("Incorrect login details!");	           		
        	}
        	else{
        		out.print("Some error occurred!");
        	}
        }
        %>

     <p style="margin-left:47%;font-family: 'Averia Serif Libre', cursive;font-size:35px;margin-left: 50%;">EW</p>
    <p style="margin-left:40%;">------------------------------------------------------------------------------- </p>
    <p style="margin-left:45%;font-family: 'Averia Serif Libre', cursive;font-size:20px;margin-left: 45%;">Everything IS Worthy</p>
    <a href="Guest/home.jsp" style="text-decoration: none;color: red;margin-right:50%;">Guest Login</a>
    <hr style="width: 100px;">
    <a href="Register.jsp" style="text-decoration: none;color: red;margin-right:50%;">Become a Membert</a>
    </br>
    </br>
    <div class="wrapper">
        <div class="container ">
            <h1>Login</h1>
            <form class="form" action="loginRequestHandler.jsp" method="post" onsubmit="return validate()">
                <input id="name" name="email" placeholder="EMAIL_ID" type="text">
                <input id="password" name="password" placeholder="**********" type="password">
                <button  class="log" type="submit" name="submit" value="login" id="login-button">Login</button>
                <p><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%></span></p>
                
                
            </form>
        </div>
         
         
         
        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>


    <p></p>


    <script type="text/javascript">

        $("#login-button").click(function (event) {
            event.preventDefault();

            $('form').fadeOut(500);
            $('.wrapper').addClass('form-success');
        });
    </script>
     <jsp:include page="jsp/footer1.jsp" />
     <div class="footer-copyright text-center py-3" style="color: white;padding-top: 10px; margin-left: 45%;">© 2020 Copyright:
    <a href="#"> EW</a></div>
    </body>
</html>
