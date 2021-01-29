package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import db.PWATable;



@WebServlet("/registerPWA")
@MultipartConfig(maxFileSize = 16177215)
public class RegisterPWA extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "static\\samplePics";
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("registerPwa.jsp").forward(request, response);;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String savePath = "E:"+ File.separator +"Codes"+ File.separator +"BootCampJava"+ File.separator + "PWAs"  + File.separator + SAVE_DIR;
//		UUID uuid=UUID.randomUUID();
		String pwaId = new PWATable().addPwa((String)request.getParameter("category"), (String)request.getParameter("name"), (String)request.getParameter("description"), Integer.parseInt((String)request.getParameter("samplePicsCount")), (String)request.getParameter("link"));
		
		PrintWriter out = response.getWriter();

		if(pwaId!=null) {
			int i=1;
				 for(Part part : request.getParts()) {
	
//			       String fileName = part.getName();	       
//			       out.println(part.getContentType());
			       if(part.getContentType()!=null) {
			    	   if(part.getName().equals("logo"))
				    	   part.write(savePath + File.separator + pwaId + "-logo"  +".png");
				       else
				    	   part.write(savePath + File.separator + pwaId + "-" + i++ +".png");
			       }			       
		       }
//				 out.println(par.getContentType());
		}	 
		 
	}

}
