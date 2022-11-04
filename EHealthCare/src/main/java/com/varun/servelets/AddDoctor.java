package com.varun.servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.varun.dao.Dao;
import com.varun.dao.DoctorListDao;
import com.varun.model.Doctor;

/**
 * Servlet implementation class AddDoctor
 */
@WebServlet("/AddDoctor")
@MultipartConfig
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
		String surname = request.getParameter("surname");
		String mobile = request.getParameter("mobile");
		String  email = request.getParameter("email");
		String exp = request.getParameter("exp");
		String qual = request.getParameter("edu");
		String spec = request.getParameter("spec");
		String address = request.getParameter("address");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		
		
		
		Doctor doctor = new Doctor(name ,surname,mobile,email,exp,qual,spec,address,country,state);
		try {
			DoctorListDao dao = new DoctorListDao(Dao.getConnection());
			if(dao.saveDoctor(doctor)) {
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
