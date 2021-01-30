package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.ReviewTable;


@WebServlet("/addReview")
public class AddReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
//		System.out.println((String)request.getAttribute("pwaId")+(String) request.getAttribute("message")+(int)request.getAttribute("rating"));
		response.getWriter().println(new ReviewTable().addReview((String)session.getAttribute("username"), (String)request.getParameter("pwaId"),(String) request.getParameter("message"), Integer.parseInt(request.getParameter("rating"))));
	}

}
