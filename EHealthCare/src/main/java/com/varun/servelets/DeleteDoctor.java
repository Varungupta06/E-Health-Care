package com.varun.servelets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.varun.dao.Dao;
import com.varun.dao.Deletedoctor;
import com.varun.model.Message;

@MultipartConfig
@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
	
    public DeleteDoctor() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int did = Integer.parseInt(request.getParameter("did"));
		System.out.println(did);
		HttpSession s = request.getSession();
		try {
			Deletedoctor delete = new Deletedoctor(Dao.getConnection());
			boolean ans = delete.delteDoctor(did);
			if(ans) {
				Message msg = new Message("Sucessfully Deleted !" ,"success","alert-success");
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
