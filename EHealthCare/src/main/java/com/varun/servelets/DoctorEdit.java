package com.varun.servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.varun.dao.Dao;
import com.varun.dao.UpdatAdminDao;
import com.varun.dao.UpdateDoctorDao;
import com.varun.model.Doctor;
import com.varun.model.Message;


@MultipartConfig
@WebServlet("/DoctorEdit")
public class DoctorEdit extends HttpServlet {
	
    public DoctorEdit() {
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		  response.setContentType("text/html");
		    System.out.println(request.getParameter("did"));
		    System.out.println(request.getParameter("country"));
			PrintWriter out = response.getWriter();
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String mobile = request.getParameter("mobile");
			String  email = request.getParameter("email");
			String exp = request.getParameter("exp");
			String qual = request.getParameter("edu");
			String spec = request.getParameter("spec");
			String address = request.getParameter("address");
			String country = request.getParameter("country");
			String state = request.getParameter("state");
		    int did = Integer.parseInt(request.getParameter("did"));
			System.out.println(request.getParameter("did"));
			HttpSession s = request.getSession();
			
			Doctor doctor = new Doctor(did ,name ,surname,mobile,email,exp,qual,spec,address,country,state);
			

			try {
				UpdateDoctorDao dao  = new UpdateDoctorDao(Dao.getConnection());
				boolean ans = dao.updateDoctor(doctor);
				if(ans) {
					Message msg = new Message("Sucessfully Updated !" ,"success","alert-success");
					s.setAttribute("msg", msg);
					
					response.sendRedirect("DoctorList.jsp");
				}
				else
				{
					Message msg = new Message("Not Updated !" ,"error","alert-danger");
					s.setAttribute("msg", msg);
					
					response.sendRedirect("DoctorList.jsp");
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		
}
}
