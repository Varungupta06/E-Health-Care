<%@page import="com.varun.model.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

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
	
	clip-path: polygon(50% 0%, 100% 0, 100% 100%, 72% 97%, 45% 100%, 0 100%, 0 0);
	}

</style>

</head>
<body>
<!-- Navbar -->
<%@include file="nav.jsp" %>
<main class=" primary-background banner-background "style="height:100vh">
<div class = "container">
	<div class = "col-md-4 offset-md-4">
		<div class ="card">
		  <div class ="card-header text-center primary-background text-white text-center">
		  <br>
		  <span class ="fa fa-user-o fa-3x"></span>
		  <p>Login here</p>
		  </div>
		 <%
		Message m = (Message) session.getAttribute("msg");
		 if(m!=null){
			 
			 %>
			  <div class="alert <%=m.getCss() %>" role="alert">
            <%= m.getContent() %>
          </div>
			 <% 
			 session.removeAttribute("msg");
		 }
		 %>
		  <div class ="card-body">
		  <form action ="LoginServlet" method = "POST">
  			<div class="form-group">
   			 <label for="exampleInputEmail1">Email address</label>
    			<input required type="email" name = "email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
   				 <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  			</div>
 			 <div class="form-group">
  		  <label for="exampleInputPassword1">Password</label>
  		  <input required type="password" name = "pwd" class="form-control" id="pwd" placeholder="Password">
 		 </div>
 		 <div class="form-group">
      <label for="role">Role:</label>
      <select name ="role" class="form-control" id="role">
		<option>Select From Below:</option>
        <option>Admin</option>
        <option>Doctor</option>
        <option>Patient</option>
      </select>
    </div>
  		<div class="container text-center">
  		<button type="submit" class="btn btn-primary" name="login">Submit</button>
  		</div>
 		 
</form>
		  </div>
		</div>
	
	</div>

</div>

</main>


</body>
</html>