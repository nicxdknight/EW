<%-- 
    Document   : home
    Created on : 13-Jun-2020, 7:17:03 pm
    Author     : NIKHIL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
<html>
    <head>
        <title>EW</title>
 
		<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
     <link rel="stylesheet" type="text/css" href="../CSS/header and footer.css">          



</script>
</head>

<body>

        

    </script>
	<header>
  <div class="overlay"></div>
  <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
    <source src="../img/mod.mp4" type="video/mp4">
  </video>
  <div class="container h-100" >
    <div class="d-flex h-100 text-center align-items-center">
      <div class="w-100 text-white">
        <h1 class="display-3">EW</h1>
        <p class="lead mb-0">Everything is Worthy.</p>
      </div>
    </div>
  </div>
</header>

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
        <a class="nav-link dropdown-toggle" href="../index.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         Products
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="../index.jsp">Electronics</a>
            <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Watch</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
   
    <li class="nav-item">
        <a class="nav-link" href="../index.jsp">Seller With Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../index.jsp">Deliver For Us</a>
      </li>

       <li class="nav-item">
        <a class="nav-link" href="#">FAQ</a>
      </li>

    <li class="nav-item">
        <a class="nav-link" href="#">Contact Us</a>
      </li>
    </ul>
      
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><a href="../index.jsp">LogIn</a></button>
 

  </div>
     
</nav>
      
      
      <nav class="navbar navbar-expand-lg navbar-dark " style="background-color: black;padding-bottom: 30px;">
  <a class="navbar-brand" href="#"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
    <form class="form-inline my-2 my-lg-0" style="margin-left: 30%;" >
        <input class="form-control mr-sm-2" type="search" placeholder="Looking for Something" aria-label="Search" style="width:500px;">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
      
      
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
        <img src="../img/phone.png" height="600px" width="100px" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../img/9.jpg" height="600px" width="100px" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../img/10.jpg"height="600px" width="100px"  class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../img/11.jpg"height="600px" width="100px"  class="d-block w-100" alt="...">
    </div>
     <div class="carousel-item">
      <img src="../img/12.jpg"height="600px" width="100px"  class="d-block w-100" alt="...">
    </div>
      <div class="carousel-item">
      <img src="../img/13.jpg"height="600px" width="100px"  class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  
    <a href="../allProducts.html"><button type="button" class="btn btn-outline-danger" style="margin-top: 20px;margin-left: 45%;border: 0px;" >Our Products</button></a>
  <hr align="center" style="width: 80%;color: red;margin-bottom: 50px;">
  
  
  
  
  
  
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>


<footer>
<div class="button_cont" align="center"><a class="example_f" href="mailto:feedback@EW.com?Subject=Hello%20again" target="_top" rel="nofollow"><span>Write A Review</a></span>
</div>
</br>
<hr>
</br>
<div class="button_cont" align="center"><a class="example_f" href="mailto:help@EW.com?Subject=Hello%20again" target="_top" rel="nofollow"><span>Coustmer Services</a></span>
</div>

  <div class="rounded-social-buttons" style="margin-top: 100px;">
                    <a class="social-button facebook" href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a class="social-button twitter" href="https://www.twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a class="social-button linkedin" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin"></i></a>
                    <a class="social-button youtube" href="https://www.youtube.com/" target="_blank"><i class="fab fa-youtube"></i></a>
                    <a class="social-button instagram" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
                </div>

                 <div class="footer-copyright text-center py-3" style="color: white">© 2020 Copyright:
                           <a href="../header and footer.html"> EW</a>
  </div>
</footer>
 
    </body>
</html>