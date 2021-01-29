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
 * Servlet implementation class DetailedView
 */
@WebServlet("/detailedView")
public class DetailedView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PWA pwa = new PWATable().getPwa(request.getParameter("pwaId"));
		
		request.setAttribute("pwa", pwa);
		request.getRequestDispatcher("detailedView.jsp").forward(request, response);
	}

	

}
