<%@page import="com.varun.model.Patient"%>
<%@page import="java.util.List"%>
<%@page import="com.varun.dao.Dao"%>
<%@page import="com.varun.dao.PatientDao"%>
<script type="text/javascript">
$(document).ready(function(){
	
	
	$('#patient-Edit-btn').click(function(){
		
			$('#patient-Details').hide()
			$('#patient-Edit').show()
	
		
		
	})
	
	$('#submit').click(function(){
		
			$('#patient-Details').show()
			$('#patient-Edit').hide()
	
		
		
	})
	
	$('#back').click(function(){
		
			$('#patient-Details').show()
			$('#patient-Edit').hide()
	
		
		
	})
	
});
</script>

<%
PatientDao p = new PatientDao(Dao.getConnection());
int pid = Integer.parseInt(request.getParameter("pid"));
List<Patient> patient = p.getPatientById(pid); 

%>
<% 
		  for(Patient pp : patient){
			  %>
<div class="row">
 <div class="col-sm-2">
  <img class="rounded-circle mt-5" width="350px" src="images/doctor.png" style="margin-left:130px;margin-top:60px">
<span class="font-weight-bold"  style="margin-left:130px;margin-top:60px"> <h4 class="text-center"></h4></span>
 </div>
 
 <div class="col-sm-10">
<div class = "container-fluid mr-right " >
	<div class = " offset-md-5">
		<div class ="card">
		  <div class ="card-header primary-background text-white text-center">
		  <br>
		  <span><i class="fa fa-user-md fa-3x" aria-hidden="true"></i></span>
		  <p style="font-size:18px;"><%=pp.getName() %></p>
		  </div>
		  
		  <!-- Patient Details -->
		 
			  
		  <div id="patient-Details">
		  <div class ="card-body" >
		 <table class="table table-striped">
 
  <tbody>
    <tr>
      <th scope="row"> ID  &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=pp.getPid() %> </td>
      
    </tr>
    <tr>
      <th scope="row"> Name  &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=pp.getName() %></td>
     
    </tr>
    <tr>
      <th scope="row"> Date &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=pp.getpDate() %></td>
     
    </tr>
    
     <tr>
      <th scope="row"> Mobile &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=pp.getMobile() %></td>
     
    </tr>
     <tr>
      <th scope="row"> Email &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=pp.getEmail() %></td>
     
    </tr>
    
    <tr>
      <th scope="row"> Issue &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=pp.getIssue() %></td>
     
    </tr>
    <tr>
      <th scope="row"> Gender &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=pp.getGender()%></td>
     
    </tr>
    <tr>
      <th scope="row"> Age &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td></td>
     
    </tr>
    
    <tr>
      <th scope="row"> Address &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=pp.getAddress() %></td>
     
    </tr>
    
  </tbody>
</table>

		  </div>
		   <div class = "card-footer">
		  <a type="button"  href="PatientEdit.jsp?pid=<%=pp.getPid() %>" class="btn btn-outline-primary">Edit details</a>
		  <a href="PatientsList.jsp" type="button" class="btn btn-primary" id ="back">Back</a>
		  <br>
		  </div>
		  </div>
		 
		  <%} %>
		  
		  
		 
		  
		 
 </div>
		  </div>
		  </div>
		  </div>
		  </div>
