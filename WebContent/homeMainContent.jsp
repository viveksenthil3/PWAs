<%@page import="models.PWA"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<div style=" min-height: 100%; height:fit-content; width:100%; display:flex;flex-direction:column; padding: 2em 0 8em 3em; overflow-y: auto">
	
	<%
		for(String category : PWA.getCategories()){
			
			ArrayList<PWA> pwas = (ArrayList<PWA>)request.getAttribute(category);
			//out.println("<h3>"+category+"</h3><ul>");
			
			out.println("<div id=\""+category.substring(0, 1).toUpperCase() + category.substring(1) +"\" class='categoryLink'>");
			out.println("<a href='#"+category+".jsp'>"+category.substring(0, 1).toUpperCase() + category.substring(1)+"</a>");
			out.println("</div>");
			out.println("<div class= 'categoryList'>");//block open
				
			
			for(int i=0; i<pwas.size(); i++){
				PWA pwa=pwas.get(i);
				//out.println(String.format("<li>%s</li>", pwa.getName()));
				out.println("<div class='box'>");
				
				
				out.println("<img  src='"+request.getContextPath()+"/samplePics/"+pwa.getPwaId()+"-logo.png'style='height:70%;width:100%'>");
				out.println(String.format("<p>%s</p>", pwa.getName()));
				//out.println(pwa.getPwaId());
				
				out.println("</div>");
			//out.println("</ul>");
			}
			out.println("</div>");// block close
			//out.println("<div class='clr'></div>");
			//out.println("<br><br>");
		}
	%>
	
</div>
<style>
		
		.categoryLink{
			margin: 1em 0 0 0;
		}
		
		.categoryLink a{
			font: bold 22px Arial,Helvetica,sans-serif;
			color: black;
		}
		
		.categoryList{
			display: flex;
			margin: 1em 0 2em 0;
			
		}
		
		.box{
			display:flex;
			flex-direction:column;
			border-radius: .5em;
			overflow: hidden;
			min-height: 16em;
			min-width: 11em;
			height: 16em;
			width: 11em;
			margin: 0 1em;
			cursor: pointer;
			
			box-shadow: 10px 10px 30px rgb(0, 0, 0, 0.2);
		}
			
		.box img{
			object-fit: cover;
		}
		
		.box p{
			padding: 1.2em .6em;
			min-height: 4em;
			font-size: 14px;
			overflow: hidden;
   			height: 4em;	
		}
			
		
	</style>