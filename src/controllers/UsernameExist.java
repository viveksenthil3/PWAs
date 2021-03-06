package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.UserTable;


@WebServlet("/usernameExist")
public class UsernameExist extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		if(UserTable.isExist(username))
		{			
			response.sendError(200);
		}
		else
		{
			response.sendError(400);
		}
		

		doGet(request, response);
	}

}
