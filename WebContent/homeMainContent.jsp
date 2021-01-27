<%@page import="models.PWA"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<div style="height:100%; width:100%; display:flex; justify-content: center; align-items: center;">
	<h2>Home Main Contents</h2>
	
	<%
		for(String category : PWA.getCategories()){
			ArrayList<PWA> pwa = (ArrayList<PWA>)request.getAttribute(category);
			out.println("<h3>"+category+"</h3><ul>");
			for(int i=0; i<pwa.size(); i++)
				out.println(String.format("<li>%s</li>", pwa.get(i).getName()));
			out.println("</ul><br><br>");
		}
	%>
</div>