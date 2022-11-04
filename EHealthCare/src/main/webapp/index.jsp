<!DOCTYPE html>

<html lang="en">
<head>
  <title>Welcome to E Health Care</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.banner-background{
	
	clip-path: polygon(50% 0%, 100% 0, 100% 96%, 67% 100%, 37% 97%, 0 100%, 0 0);
	}

</style>


</head>
<body>
<%@include file="nav.jsp" %>
<div class = "container-fluid p-0 m-0">
<div class = "jumbotron primary-background text-white banner-background">
<div class = "container">
<h2 class = "display-3">Welcome to E-Health Care System</h2>
<p>E-Health is the delivery of health care using modern electronic information and communication technologies when health care providers and patients are not directly in contact and their interaction is mediated by electronic means. </p>
<p> Having a digital health record means information can be stored in one place but be available anywhere, so patients can share it safely and healthcare staff can access it at any time.</p>
<a href="signup.jsp" class ="btn btn-outline-light btn-lg"> <span class = "fa fa-user-plus"></span> Get Started </>

<a href="login.jsp" class ="btn btn-outline-light btn-lg"><span class = "fa fa-user-circle-o fa-spin"></span>  &nbsp Login</a>

</div>
</div>
<div class ="container">
<div class = "row">
<div class ="col-md-4">
<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">About us</h5>
    <p class="card-text"> Check out for our terms and conditons</p>
    <p class="card-text"> Developer information and contact</p>
    <a href="#" class="btn btn-primary"><span class ="fa fa-address-book-o"></span> &nbsp Click to know more </a>
  </div>
  
 
</div>
  
</div>


<div class ="col-md-4">
<div class="card" style="width: 18rem;">
 
  <div class="card-body">
    <h5 class="card-title">Book an appointment</h5>
   
    <p class="card-text"> Search date and time </p>
    <p class ="card-text">book appointment  according to your preference</p>
    <br>
    <a href="#" class="btn btn-primary"><span class ="fa fa-edit"></span> Book an appointment</a>
  </div>
  
 
</div>
  
</div>
<div class ="col-md-4">
<div class="card" style="width: 18rem;">
  
  <div class="card-body">
    <h5 class="card-title">New User</h5>
    <p class="card-text">Get StartedStarted you medical journey</p>
     <p class ="card-text">Started you medical journey</p>
    <a href="#" class="btn btn-primary"><span class = "fa fa-user-plus"></span>Sign UP</a>
  </div>
  
 
</div>
  
</div>
</div>
</div>
</div>

</div>
</body>
</html>