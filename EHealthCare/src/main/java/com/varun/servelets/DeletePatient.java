package com.varun.servelets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.varun.dao.Dao;
import com.varun.dao.Deletedoctor;
import com.varun.dao.Deletpatient;
import com.varun.model.Message;


@WebServlet("/DeletePatient")
public class DeletePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeletePatient() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));
		System.out.println(pid);
		System.out.println("gg");
		HttpSession s = request.getSession();
		try {
			Deletpatient delete = new Deletpatient(Dao.getConnection());
			boolean ans = delete.deletePatient(pid);
			if(ans) {
				Message msg = new Message("Sucessfully Deleted !" ,"success","alert-success");
				s.setAttribute("msg", msg);
				
				response.sendRedirect("PatientsList.jsp");
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
