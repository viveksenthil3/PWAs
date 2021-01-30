package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import db.PWATable;
import db.ReviewTable;
import models.PWA;
import models.Review;


@WebServlet("/getReviews")
public class GetReviews extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Review> reviews = new ReviewTable().getReviews(request.getParameter("pwaId"));
		
//			System.out.println(request.getParameter("pwaId"));
		
			Gson gson = new Gson();
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        
	        out.print("[");
			for(int i=0; i<reviews.size(); i++) {
				out.print(gson.toJson(reviews.get(i)));
				if(i<reviews.size()-1)
					out.print(",");
			}
			out.print("]");
			out.flush();
	}
}


