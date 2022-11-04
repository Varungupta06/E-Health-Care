package com.varun.servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.varun.dao.Dao;
import com.varun.dao.DoctorListDao;
import com.varun.dao.PatientDao;
import com.varun.model.Doctor;
import com.varun.model.Patient;

/**
 * Servlet implementation class AddPatient
 */
@WebServlet("/AddPatient")
@MultipartConfig
public class AddPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPatient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 response.setContentType("text/html");
		PrintWriter out = response.getWriter();
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
		System.out.println(formatter.format(date));
		System.out.println(name);
	
		try {
			PatientDao dao = new PatientDao(Dao.getConnection());
			if(dao.savePatient(patient)) {
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
