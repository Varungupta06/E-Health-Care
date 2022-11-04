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
import com.varun.dao.UserDao;
import com.varun.model.User;

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	 
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public RegisterServlet() {
        
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
		doGet(request, response);
		 String check = request.getParameter("check");
		    response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(check == null) {
				out.println("Please agree with terms and conditions:");
			}
			else {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("pwd");
			String role = request.getParameter("role");
			String Gender = request.getParameter("gender");
			int age = Integer.parseInt(request.getParameter("age"));
			
			//create user obejct and set all data to that object
			User user = new User(name,email,password,role,Gender,age);
		
			//database
			 UserDao dao;
			
			try {
				dao = new UserDao(Dao.getConnection());
				 if(dao.saveUser(user)) {
					 out.println("Successfully Register");  
				   }
				 else {
					
					 out.println("Something went Wrong");
					 out.println("Try again!");
				 }
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
			 
			  
}
		
	}
	private void database(User user) throws ClassNotFoundException, SQLException {
       
          
          
		 }
}
