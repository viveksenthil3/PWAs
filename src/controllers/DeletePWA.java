package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import db.DBConfig;
import db.PWATable;
import models.PWA;

@WebServlet("/deletePWA")
public class DeletePWA extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "static\\samplePics";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String savePath = "E:"+ File.separator +"Codes"+ File.separator +"BootCampJava"+ File.separator + "PWAs"  + File.separator + SAVE_DIR;
//		UUID uuid=UUID.randomUUID();
		HttpSession session = request.getSession(true);
		new PWATable().delPwa((String)request.getParameter("pwaId"));
		
//		PrintWriter out = response.getWriter();

//		if(pwaId!=null) {
//			int i=1;
//				 for(Part part : request.getParts()) {
//	
////			       String fileName = part.getName();	       
////			       out.println(part.getContentType());
//			       if(part.getContentType()!=null) {
//			    	   if(part.getName().equals("logo"))
//				    	   part.write(savePath + File.separator + pwaId + "-logo"  +".png");
//				       else
//				    	   part.write(savePath + File.separator + pwaId + "-" + i++ +".png");
//			       }			       
//		       }
////				 out.println(par.getContentType());
//		}	 
		response.sendError(200);
//		 response.sendRedirect(request.getContextPath()+"/home");
	}
}