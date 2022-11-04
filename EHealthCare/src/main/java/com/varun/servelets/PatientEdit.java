package com.varun.servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.varun.dao.Dao;
import com.varun.dao.PatientDao;
import com.varun.dao.PatientUpdateDao;
import com.varun.model.Patient;

@MultipartConfig
@WebServlet("/PatientEdit")
public class PatientEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   PatientEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		     doGet(request, response);
		     response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			int pid = Integer.parseInt(request.getParameter("pid"));
			System.out.println(pid);
			String name = request.getParameter("name");
			String mobile = request.getParameter("mobile");
			String  email = request.getParameter("email");
			String address = request.getParameter("address");
			String issue = request.getParameter("issue");
			String gender = request.getParameter("gender");
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
		    Date date = new Date();  
		    System.out.println(formatter.format(date));  
			
			Patient patient = new Patient(name, address, email, mobile, gender, issue,formatter.format(date));
			
			try {
				PatientUpdateDao dao = new PatientUpdateDao(Dao.getConnection());
				if(dao.updatePatient(patient)) {
					 out.println("Successfully Register");  
				   }
				 else {
					
					 out.println("Something went Wrong");
					 out.println("Try again!");
				 }
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

