<%@page import="com.varun.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p"%>
<p:if test="${sessionScope.admin==null}">
<p:redirect url="login.jsp"></p:redirect>
</p:if>
<%User user = (User)session.getAttribute("admin"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Patient</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 
 
 <!-- Add Doctor JS -->
 <script>
  $(document).ready(function(){
	  console.log("loaded........")
	  
	 $('#addPatient').on('submit',function(event){
		 console.log("found")
		 event.preventDefault();
		 let form = new FormData(this);
		 $('#submit').hide();
		// $('#loader').show();
		 
		 
		 $.ajax({
			url : "AddPatient",
			type : 'POST',
			data : form,
			success:function(data,textStatus , jqXHR){
				console.log("s")
					 swal("Good job!", "Successfully Added", "success")
					 .then((value) => {
					   window.location = "PatientsList.jsp";
					 });				 
				  
				
			},
			error:function(jqXHR , textStatus , errorThrown){
				console.log(jqXHR)
				 swal("Something went wrong");
				 
			},
			processData:false,
			contentType:false,
		 });
	 }) ;
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
     
      <li class="nav-item active">
        <a class="nav-link" href="AddDoctor.jsp"><span class ="fa fa-user-plus"></span> Add Doctor<span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="PatientsList.jsp"> <span class = "fa fa-address-book-o"></span> View Patients</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="AddPatient.jsp"> <span class = "fa fa-user-plus"></span> Add Patient</a>
      </li>
      
    </ul>
    <ul class = "navbar-nav mr-right">
  <a class="nav-link" href="admin.jsp"  > <span class ="fa fa-user-circle"></span> <%=user.getName() %></a>
  <li class="nav-item">
        <a class="nav-link" href="Appointment.jsp"> <span class = "fa fa-address-book-o"></span> Book Appointment</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Appointment.jsp"> <span class = "fa fa-address-book-o"></span> Book Appointment</a>
      </li>
      
  </ul>
  <ul class = "navbar-nav mr-right">
  <a class="nav-link" href="LogoutServlet"  > <span class ="fa fa-user-o"></span> Logout</a>
  
  </ul>
  </div>
</nav>

 <form action="AddPatient" id ="addPatient" method="POST">
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            <img class="rounded-circle mt-5" width="150px" src="images/patient.png">
            <span class="font-weight-bold">Enter Patient Details</span>
             <span class="text-black-50"></span><span> </span>
           </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile</h4>
                </div>
               
                <div class="row mt-2 ">
               
                    <div class="col-md-12"><label class="labels" >Full Name</label>
                    <input name="name" required type="text" class="form-control" id="name"  placeholder="Enter name"></div>
                   
               
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels" >Mobile Number</label>
                    <input name ="mobile" type="text" class="form-control" placeholder="enter phone number" value=""></div>
                    
                    <div class="col-md-12"><label class="labels">Email ID</label>
                    <input name ="email" type="text" class="form-control" placeholder="enter email id" value=""></div>
                  
                </div>
                <div class="row mt-3">
                    <label for="gender">Select Gender : 
   		 <input type="radio"  name="gender" value = "male"> Male
   		 <input type="radio"  name="gender" value = "female"> Female 
                </label>
                </div>
                <div class="mt-5 text-center"> <button type="submit" class="btn btn-outline-primary" id ="submit">Submit</button></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5">
              <div class="col-md-12"><label class="labels">Issue</label>
              <input name="issue" type="text" class="form-control" placeholder="Enter Issue" value=""></div>
               <div class="col-md-12"><label class="labels">Address</label>
               <input name="address" type="text" class="form-control" placeholder="Enter address" value=""></div>
            </div>
        </div>
    </div>
</div>
</form>

</body>
</html>