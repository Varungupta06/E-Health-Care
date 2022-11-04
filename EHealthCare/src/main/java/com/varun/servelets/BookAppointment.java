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

import com.varun.dao.AppointmentDao;
import com.varun.dao.Dao;
import com.varun.dao.PatientDao;
import com.varun.model.Appointment;
import com.varun.model.Patient;

@MultipartConfig
@WebServlet("/BookAppointment")
public class BookAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BookAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
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
			String pdate = request.getParameter("pdate");
			int pid = Integer.parseInt(request.getParameter("pid"));
			int did = Integer.parseInt(request.getParameter("did"));
			System.out.println("DDDDDDDDDDDDD");
			System.out.println(pid);
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
		    Date date = new Date();  
		    System.out.println(formatter.format(date));  
			
			Appointment app = new Appointment(name, address, email, mobile, gender, issue, pdate,pid,did);
			System.out.println(name);
			try {
				AppointmentDao dao = new AppointmentDao(Dao.getConnection());
				if(dao.bookAppointment(app)) {
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
