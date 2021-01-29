package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.UserTable;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(UserTable.isValid(request.getParameter("username"), request.getParameter("pass"))) {
//			response.getWriter().println("Successfully logged in");
			
			HttpSession session = request.getSession(true);
			session.setAttribute("username", request.getParameter("username"));
			
			response.sendError(200);
//			request.getParameter("redirect");
		}
		else {
			HttpSession session = request.getSession();
			if(session!=null)
				session.removeAttribute("username");
			response.sendError(400);
			
		}
//			response.getWriter().println("Invalid username and password");
	}

}
