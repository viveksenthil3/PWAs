<%@page import="models.PWA"%>
<%@page import="db.PWATable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<div style="height:100%; width:100%;">
	
	<%
		out.println("<h1>"+request.getContextPath()+"</h1>");
		PWA pwa = (PWA)request.getAttribute("pwa");
		out.println("<h1>"+pwa.getName()+"</h1>");
	%>
</div>