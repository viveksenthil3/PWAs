package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.PWATable;
import db.UserTable;
import models.PWA;


@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		
		UserTable user = new UserTable();
		String result="";
		try {
			result = user.insert(uname,pass,email);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result=="Success") {
			HttpSession session = request.getSession(true);

			session.setAttribute("username", uname);
			response.sendRedirect(request.getContextPath()+"/home");
			}
		else {
			request.setAttribute("error", "Please enter valid details");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
//			response.getWriter().print(result);

	}
}
