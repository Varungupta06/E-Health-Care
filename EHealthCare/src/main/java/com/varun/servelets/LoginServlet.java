package com.varun.servelets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.varun.dao.Dao;
import com.varun.dao.UserDao;
import com.varun.model.Message;
import com.varun.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		//fetch user name and password
		 response.setContentType("text/html");
			PrintWriter out = response.getWriter();

		
		
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		String role = request.getParameter("role");
		try {
			UserDao dao = new UserDao(Dao.getConnection());
			User u = dao.getUserByEmail(email, password , role);
			if(u == null) {
				//login error
				Message msg = new Message("Invalid details !" ,"error","alert-danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);
				
				response.sendRedirect("login.jsp");
			}
			else {
				  if(role.equalsIgnoreCase("admin")){
				HttpSession s = request.getSession();
				s.setAttribute("admin", u);
				response.sendRedirect("admin.jsp");
				
			}
				else if (role.equalsIgnoreCase("patient")) {
					HttpSession s = request.getSession();
					s.setAttribute("patient", u);
					response.sendRedirect("patienthome.jsp");
					
				}
				
				
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}
	
}
