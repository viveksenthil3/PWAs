package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.PWATable;
import models.PWA;

/**
 * Servlet implementation class HomePage
 */
@WebServlet("/home")
public class HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PWATable p = new PWATable();
//		p.getTenPwa("entertainment");
		
		for(String category : PWA.getCategories()) {
//			System.out.println(category);
			request.setAttribute(category, p.getPwa(category, true));
		}
		
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

}
