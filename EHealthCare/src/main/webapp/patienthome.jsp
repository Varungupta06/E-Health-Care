<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p"%>
<p:if test="${sessionScope.patient==null}">
<p:redirect url="login.jsp"></p:redirect>
</p:if>

<%@page import="com.varun.model.Message"%>
<%@page import="com.varun.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
User user = (User)session.getAttribute("patient");
if(user==null){
	
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function(){
	
	
	$('#admit-Edit-btn').click(function(){
		
			$('#Patient-Details').hide()
			$('#admin-Edit').show()
	
		
		
	})
	
	$('#submit').click(function(){
		
			$('#Patient-Details').show()
			$('#Patient-Edit').hide()
	
		
		
	})
	
	$('#back').click(function(){
		
			$('#Patient-Details').show()
			$('#admin-Edit').hide()
	
		
		
	})
	
});
</script>

 <style type="text/css">
.primary-background{
	
	background:#2196f3!important;
	}

</style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class ="fa fa-code-fork" style="font-size:24px"></span>  E-Health Care</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="DoctorList.jsp"><span class = "fa fa-group"></span> View Doctors<span class="sr-only">(current)</span></a>
      </li>
    
      <li class="nav-item">
        <a class="nav-link" href="AddPatient.jsp"> <span class = "fa fa-user-plus"></span> Add Patient</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Appointment.jsp"> <span class = "fa fa-address-book-o"></span> Book Appointment</a>
      </li>
      
    </ul>
    
     <ul class = "navbar-nav mr-right">
  <a class="nav-link" href="patienthome.jsp"  > <span class ="fa fa-user-circle"></span> <%=user.getName() %></a>
  
  </ul>
  <ul class = "navbar-nav mr-right">
  <a class="nav-link" href="LogoutServlet"  > <span class ="fa fa-user-o"></span> Logout</a>
  
  </ul>
  </div>
</nav>

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

<div class="row">
 <div class="col-sm-2">
 <img alt="User" class = "rounder-circle " style = "margin-top: 60px ; margin-left: 160px"width = "350px"src="images/man.png" style="margin-left:60px">
  <span class="font-weight-bold" >
  <div class="align-items-center text-center p-0 py-5">
 <h4 style = "margin-top: 0px ; margin-left: 290px"><u>Profile</u></h4>
  </div></span><span class="text-black-50">
 </div>
 
 <div class="col-sm-10">
<div class = "container-fluid mr-right " >
	<div class = " offset-md-5">
		<div class ="card">
		  <div class ="card-header primary-background text-white text-center">
		  <br>
		  <span class ="fa fa-user-o fa-3x"></span>
		  <p style="font-size:18px;"><%=user.getName() %></p>
		  </div>
		  
		  <!-- Admin Details -->
		  <div id="Patient-Deails">
		  <div class ="card-body" >
		 <table class="table table-striped">
 
  <tbody>
    <tr>
      <th scope="row"> ID &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td> <%=user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row"> Name &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=user.getName() %></td>
     
    </tr>
    <tr>
      <th scope="row"> Email &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=user.getEmail() %></td>
     
    </tr>
    
     <tr>
      <th scope="row"> Gender &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=user.getGender().toUpperCase() %></td>
     
    </tr>
     <tr>
      <th scope="row"> Age &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=user.getAge() %></td>
     
    </tr>
  </tbody>
</table>

		  </div>
		   <div class = "card-footer">
		  <button type="button" class="btn btn-primary" id ="admit-Edit-btn">Edit details</button>
		  <a href = "ShowAppointment.jsp" type="button" class="btn btn-outline-primary">Appointments</a>
		  <br>
		  </div>
		  </div>
		 
		  
		  
		  
		  <!-- profile edit -->
		   <div class ="card-body" id="admin-Edit" style="display:none;">
		   
		   <div class ="card-body">
		  <form action ="AdminEdit"  method ="POST">  
		  
		   <div class="form-group">
   			 <label for="name"><h5>User ID &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp&nbsp <%=user.getId() %></h5></label>
    			
   				 
  			</div>
		  <div class="form-group">
   			 <label for="name">Full Name</label>
    			<input name = "name"type="text" class="form-control" id="name"  value="<%=user.getName()%>">
   				 
  			</div>
  			<div class="form-group">
   			 <label for="exampleInputEmail1">Email address</label>
    			<input  name ="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" value="<%=user.getEmail()%>">
   				 <small  id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  			</div>
 			 <div class="form-group">
  		  <label for="exampleInputPassword1">Password</label>
  		  <input required type="password" name = "pwd" class="form-control" id="pwd" placeholder="Password">
  		  <small  id="emailHelp" class="form-text text-muted">Never share your password with anyone.</small>
 		 </div>
       
 
		  <div class="form-group">
   			 <label for="age">Age</label>
    			<input  name ="age" type="number" class="form-control" id="age" value="<%=user.getAge()%>">
   				 
  			</div>

  		<br>
  		<div style="text-align: center ;display:none;" id = "loader">
  		<span class = "	fa fa-refresh fa-spin fa-3x"></span>
  		<h4>Please wait...</h4>
  		</div>
  		<br>
  		  <div class = "card-footer">
		  <button type="submit" class="btn btn-outline-primary" id ="submit">Submit</button>
		  <button type="button" class="btn btn-primary" id ="back">Back</button>
		  <br>
		  </div>
</form>
		  </div>
		   
		  
		   </div>
		  
		  <!--  -->
		  
		 
 </div>
		  </div>
		  </div>
		  </div>
		  </div>

</body>
</html>