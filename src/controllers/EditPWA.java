package controllers;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.eclipse.core.resources.IProject;
import org.eclipse.core.resources.IResource;
import org.eclipse.core.resources.ResourcesPlugin;
//import org.eclipse.equinox.;
import org.eclipse.core.runtime.NullProgressMonitor;

import db.DBConfig;
import db.PWATable;
import db.ReviewTable;
import models.PWA;
import models.Review;

@WebServlet("/editPWA")
@MultipartConfig(maxFileSize = 16177215)
public class EditPWA extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "static\\samplePics";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PWA pwa = new PWATable().getPwa(request.getParameter("pwaId"));
	request.setAttribute("pwa", pwa);
	
	request.getRequestDispatcher("addPwa.jsp").forward(request, response);
	
	
	
	

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String savePath = "E:"+ File.separator +"Codes"+ File.separator +"BootCampJava"+ File.separator + "PWAs"  + File.separator + SAVE_DIR;
//		UUID uuid=UUID.randomUUID();
		HttpSession session = request.getSession(true);
//		System.out.println(request.getParameter("samplePicsCount"));
		String pwaId = new PWATable().editPwa((String)request.getParameter("pwaId"),(String)session.getAttribute("username"), (String)request.getParameter("category"), (String)request.getParameter("name"), (String)request.getParameter("description"), Integer.parseInt((String)request.getParameter("samplePicsCount")), (String)request.getParameter("link"));
		
		PrintWriter out = response.getWriter();

		if(pwaId!=null) {
			int i=1;
				 for(Part part : request.getParts()) {
					
					 System.out.println(part.getSize() + part.getSubmittedFileName() + " " +part.getContentType());
					 
//			       String fileName = part.getName();	       
//			       out.println(part.getContentType());
			       if(part.getSize()>0 &&  part.getContentType()!=null) {
			    	   if(part.getName().equals("logo"))
				    	   part.write(savePath + File.separator + pwaId + "-logo"  +".png");
				       else
				    	   part.write(savePath + File.separator + pwaId + "-" + i++ +".png");
			       }			       
		       }
//				 out.println(par.getContentType());
		}	 

//		try {
//			for(IProject project : ResourcesPlugin.getWorkspace().getRoot().getProjects()){
//			    project.refreshLocal(IResource.DEPTH_INFINITE, new NullProgressMonitor());
//			}
//		}catch(Exception e) {System.out.println(e);}
		
		
		response.sendRedirect(request.getContextPath()+"/detailedView?pwaId="+(String)request.getParameter("pwaId"));
		 
	}
	
	
	
	
	
	
	}
