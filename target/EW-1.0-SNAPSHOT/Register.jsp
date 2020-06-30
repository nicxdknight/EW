<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<style>
    
 .element {
  animation: pulse 5s infinite;
  height: 100%;
}

@keyframes pulse {
  0% {
    background-color: #001F3F;
  }
  100% {
    background-color: #FF4136;
  }
}

</style>

<title>Register</title>
<script> 
function validate()
{ 
     var fullname = document.form.fullname.value;
     var email = document.form.email.value;
     var username = document.form.username.value; 
     var password = document.form.password.value;
     var conpassword= document.form.conpassword.value;
     
     if (fullname==null || fullname=="")
     { 
     alert("Full Name can't be blank"); 
     return false; 
     }
     else if (email==null || email=="")
     { 
     alert("Email can't be blank"); 
     return false; 
     }
     else if (username==null || username=="")
     { 
     alert("Username can't be blank"); 
     return false; 
     }
     else if(password.length<6)
     { 
     alert("Password must be at least 6 characters long."); 
     return false; 
     } 
     else if (password!=conpassword)
     { 
     alert("Confirm Password should match with the Password"); 
     return false; 
     } 
 } 
</script> 

</head>
<body class="element" onload="myFunction()" >
    
    <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
          %>
    
   

<jsp:include page="jsp/header.jsp" />
      
    <center><h2 style="color: #ff9999;margin-top: 20px;">Become A Member</h2></center>
    <hr style="margin: 2% 20% 5% 20%;color: white;background-color: #ff9900;">
    
    <marquee behavior="scroll" direction="right" scrollamount="12" style="color:#33ff33; margin-bottom: 20px;">Just One step Away From Becoming Our Prestigious Member.</marquee>
    <form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
        <table align="center">
         <tr>
         <td>Full Name</td>
         <td><input style="border: 3px solid;
  border-image-source: linear-gradient(45deg, rgb(0,143,104), rgb(250,224,66));
  border-image-slice: 1;" type="text" name="fullname" /></td>
         </tr>
         <tr>
         <td>Email</td>
         <td><input style="border: 3px solid;
  border-image-source: linear-gradient(45deg, rgb(0,143,104), rgb(250,224,66));
  border-image-slice: 1;"type="text" name="email" /></td>
         </tr>
         <tr>
         <td>Username</td>
         <td><input style="border: 3px solid;
  border-image-source: linear-gradient(45deg, rgb(0,143,104), rgb(250,224,66));
  border-image-slice: 1;" type="text" name="username" /></td>
         </tr>
         <tr>
         <td>Password</td>
         <td><input  style="border: 3px solid;
  border-image-source: linear-gradient(45deg, rgb(0,143,104), rgb(250,224,66));
  border-image-slice: 1;"type="password" name="password" /></td>
         </tr>
         <tr>
         <td>Confirm Password</td>
         <td><input style="border: 3px solid;
  border-image-source: linear-gradient(45deg, rgb(0,143,104), rgb(250,224,66));
  border-image-slice: 1;" type="password" name="conpassword" /></td>
         </tr>
         <tr>
         <td><%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%></td>
         </tr>
         <tr>
         <td></td>
         <td><input style="border: 3px solid;border-radius: 10px;width: 80px;
  background-image: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1));"type="submit" value="Register"></input>
             <input style="border: 3px solid;border-radius: 10px;width: 80px;
  background-image: linear-gradient(to right, rgba(255,0,0,0), rgba(255,0,0,1));"
         type="reset"  value="Reset"></input></td>
         </tr>
        </table>
    </form>

     <div class="footer-copyright text-center py-3" style="color: white;margin-top: 10%; margin-right: 5%;">© 2020 Copyright:
    <a href="#"> EW</a></div>
         
<!--         <script>
    function myFunction() {
  var x = document.getElementById("but");
  var e= email;
  if(e === null){
  x.style.display = "none" 
  }
} 
    </script>-->


</body>
</html>