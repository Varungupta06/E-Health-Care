<%@page import="com.varun.model.Appointment"%>
<%@page import="com.varun.dao.AppointmentDao"%>
<%@page import="com.varun.dao.Dao"%>
<%@page import="java.util.List"%>
<%@page import="com.varun.dao.PatientDao"%>
<%@page import="com.varun.model.Patient"%>
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










<div id = "patient-list-container">	

<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-left">
            <div class="d-flex flex-column align-items-center text-center p-0 py-5">
            <img class="rounded-circle mt-5" width="250px" src="images/patient.png">
            <span class="font-weight-bold">Patient's</span><span class="text-black-50">
            </span><span> </span></div>
        </div>
        <div class="col-md-8 border-right">
            <div class="p-8 py-9">
             <h4 class="text-center">Patients Lists</h4>
                <div class="d-flex justify-content-between align-items-center mb-3">
            
                    <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Appointment ID</th>
      <th scope="col">Name</th>
      <th scope="col">Gender</th>
      <th scope="col">Issue</th>
      <th scope="col">Date</th>
       <th scope="col">Booked Doctor ID</th>
      <th scope="col">  # </th>
    </tr>
  </thead>
  <tbody>
  <%
AppointmentDao pp = new AppointmentDao(Dao.getConnection());
List<Appointment> list = pp.getAllapp();
for( Appointment a :list){
	%>
    <tr>
      <th scope="row"><%=a.getAid() %></th>
      <td><%=a.getName() %></td>
      <td><%=a.getGender() %></td>
      <td><%=a.getIssue() %></td>
      <td><%=a.getpDate()%></td>
      <td><%=a.getDid()%></td>
     
       <td> 
		  &nbsp<a href="#"  class="btn btn-danger" >Delete</a></td>
    </tr>
	<%
}
%>
  </tbody>
</table>
                
             </div>
             <a href = "admin.jsp" type = "button" class ="btn btn-outline-primary">Back</a>
             </div>
             </div>
                 
    </div>
</div>
</div>
</body>
</html>