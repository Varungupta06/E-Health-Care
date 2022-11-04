<%@page import="com.varun.model.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.varun.dao.Dao"%>
<%@page import="com.varun.dao.DoctorListDao"%>

<script type="text/javascript">

</script>


<%
DoctorListDao d = new DoctorListDao(Dao.getConnection());
int did = Integer.parseInt(request.getParameter("did"));
List<Doctor> doctor = d.getDoctorById(did);

%>

<% 
		  for(Doctor dd : doctor){
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
		  <p style="font-size:18px;"><%=dd.getName() %> <%=dd.getSurname() %></p>
		  </div>
		  
		  <!-- Doctor Details -->
		 
			  
		  <div id="doctor-details">
		  <div class ="card-body" >
		 <table class="table table-striped">
 
  <tbody>
    <tr>
      <th scope="row"> ID  &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getDid() %> </td>
      
    </tr>
    <tr>
      <th scope="row"> Name  &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getName() %></td>
     
    </tr>
    <tr>
      <th scope="row"> Surname &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getSurname() %></td>
     
    </tr>
    
     <tr>
      <th scope="row"> Mobile &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getMobile() %></td>
     
    </tr>
     <tr>
      <th scope="row"> Email &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getEmail() %></td>
     
    </tr>
    
    <tr>
      <th scope="row"> Experience &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getExp() %></td>
     
    </tr>
    <tr>
      <th scope="row"> Qualification &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getQual() %></td>
     
    </tr>
    <tr>
      <th scope="row"> Specialization &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getSpec() %></td>
     
    </tr>
    
    <tr>
      <th scope="row"> Address &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getAddress() %></td>
     
    </tr>
    
    <tr>
      <th scope="row"> State &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getState() %></td>
     
    </tr>
    <tr>
      <th scope="row"> Country &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: &nbsp</th>
      <td><%=dd.getCountry() %></td>
     
    </tr>
  </tbody>
</table>

		  </div>
		   <div class = "card-footer" >
		  <a type="button"  href="DoctorEdit.jsp?did=<%=dd.getDid() %>" class="btn btn-outline-primary">Edit details</a>
		  <a href="DoctorList.jsp" type="button" class="btn btn-primary" id ="back">Back</a>
		  <br>
		  </div>
		  </div>
		 
		  <%} %>
		 
		 
 </div>
		  </div>
		  </div>
		  </div>
