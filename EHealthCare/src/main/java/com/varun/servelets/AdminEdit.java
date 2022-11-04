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
import javax.servlet.http.HttpSession;

import com.varun.dao.Dao;
import com.varun.dao.UpdatAdminDao;
import com.varun.model.Message;
import com.varun.model.User;

/**
 * Servlet implementation class AdminEdit
 */
@MultipartConfig
@WebServlet("/AdminEdit")
public class AdminEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		doGet(request, response);
		
		//Fetch all data
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String password = request.getParameter("pwd");
				int age = Integer.parseInt(request.getParameter("age"));
				
				//get session
				
				HttpSession s = request.getSession();
				User user = (User) s.getAttribute("admin");
				user.setName(name);
				user.setEmail(email);
				user.setPassword(password);
				user.setAge(age);
				
				//update database
				 response.setContentType("text/html");
					PrintWriter out = response.getWriter();
				
				
				try {
					UpdatAdminDao dao  = new UpdatAdminDao(Dao.getConnection());
					boolean ans = dao.updateAdmin(user);
					if(ans) {
						Message msg = new Message("Sucessfully Updated !" ,"success","alert-success");
						s.setAttribute("msg", msg);
						
						response.sendRedirect("admin.jsp");
					}
					else
					{
						Message msg = new Message("Not Updated !" ,"error","alert-danger");
						s.setAttribute("msg", msg);
						
						response.sendRedirect("admin.jsp");
					}
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		
		
	}
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	
	}

}
