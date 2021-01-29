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
import models.PWA;

/**
 * Servlet implementation class Search
 */
@WebServlet("/search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<PWA> pwa_array = new PWATable().searchPwa(request.getParameter("name"));
		
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        out.print("[");
		for(int i=0; i<pwa_array.size(); i++) {
			out.print(gson.toJson(pwa_array.get(i)));
			if(i<pwa_array.size()-1)
				out.print(",");
		}
		out.print("]");
		out.flush();
	}

}
