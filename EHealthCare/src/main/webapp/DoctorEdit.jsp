<%@page import="com.varun.model.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.varun.dao.Dao"%>
<%@page import="com.varun.dao.DoctorListDao"%>
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
<title>Edit Doctor</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

 
 
 <!-- Edit Doctor JS -->
 <script>
  $(document).ready(function(){
	  console.log("loaded........")
	  
	 $('#editDoctor').on('submit',function(event){
		 console.log("found")
		 event.preventDefault();
		 let form = new FormData(this);
		 $('#submit').hide();	 
		 
		 $.ajax({
			url : "DoctorEdit",
			type : 'POST',
			data : form,
			success:function(data,textStatus , jqXHR){
				console.log("s")
               if (data.trim()==='Successfully Updated'){
					 
					 swal("Good job!", "Successfully Updated", "success")
					 .then((value) => {
					   window.location = "DoctorList.jsp";
					 });				 
				 }
				 else{
					 swal(data);
				 }
				
				 
				 
				
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
      
      <li class="nav-item">
        <a class="nav-link" href="Appointment.jsp"> <span class = "fa fa-address-book-o"></span> Book Appointment</a>
      </li>
      
      
    </ul>
    <ul class = "navbar-nav mr-right">
  <a class="nav-link" href="admin.jsp"  > <span class ="fa fa-user-circle"></span> <%=user.getName() %></a>
  
  </ul>
  <ul class = "navbar-nav mr-right">
  <a class="nav-link" href="LogoutServlet"  > <span class ="fa fa-user-o"></span> Logout</a>
  
  </ul>
  </div>
</nav>
<%
DoctorListDao dd = new DoctorListDao(Dao.getConnection());
List<Doctor> list = dd.getDoctorById(Integer.parseInt(request.getParameter("did")));
Doctor d1;
for( Doctor d :list){
	%>
 <form action="DoctorEdit" method="post">
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="images/doctor.png">
            <span class="font-weight-bold">Enter Doctor details</span>
            <span class="text-black-50"></span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile</h4>
                </div>
               
                <div class="row mt-2 ">
               <div class="col-md-6"><label class="labels" >Doctor ID</label>
                    <input name="did" required type="number" class="form-control" id="did"  placeholder="<%=d.getDid()%>"></div>
                    <div class="col-md-6"><label class="labels" >Name</label>
                    <input name="name" required type="text" class="form-control" id="name"  placeholder="<%=d.getName()%>"></div>
                    <div class="col-md-6"><label class="labels" >Surname</label>
                    <input name ="surname" required type="text" class="form-control" value="" placeholder="<%=d.getSurname()%>"></div>
               
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels" >Mobile Number</label>
                    <input name ="mobile" type="text" class="form-control" placeholder="<%=d.getMobile()%>" value=""></div>
                    <div class="col-md-12"><label class="labels" >Address</label>
                    <input name ="address" type="text" class="form-control" placeholder="<%=d.getAddress()%> " value=""></div>
                    <div class="col-md-12"><label class="labels">Email ID</label>
                    <input name ="email" type="text" class="form-control" placeholder="<%=d.getEmail()%>" value=""></div>
                    <div class="col-md-12"><label class="labels">Education</label>
                    <input name="edu" type="text" class="form-control" placeholder="<%=d.getQual()%>" value=""></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6"><label class="labels">Country</label>
                    <input name="country" type="text" class="form-control" placeholder="<%=d.getCountry()%>" value=""></div>
                    <div class="col-md-6"><label class="labels">State/Region</label>
                    <input name="state" type="text" class="form-control" value="" placeholder="<%=d.getState()%>"></div>
                </div>
                <div class="mt-5 text-center">
                 <button type="submit" class="btn btn-outline-primary" id ="admit-Edit-btn">Edit details</button>
                 </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center experience">
                <span>Edit Experience</span>
                <span class="border px-3 p-1 add-experience"><i class="fa fa-plus">
                </i>&nbsp;Experience</span></div><br>
                <div class="col-md-12"><label class="labels">Experience </label>
                <input name="exp" type="text" class="form-control" placeholder="<%=d.getExp()%>" value=""></div> <br>
                <div class="col-md-12">
                <label class="labels">Specialist</label>
                <input name="spec" type="text" class="form-control" placeholder="<%=d.getSpec()%>" value=""></div>
            </div>
        </div>
    </div>
</div>
</form>
	<%
}
%>


</body>
</html>