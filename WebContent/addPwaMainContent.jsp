<%@page import="models.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.PWA"%>
<%@page import="db.PWATable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<style>

.form{
	max-width: 500px;
	padding: 20px 12px 10px 20px;
}

.form label{
	display: block;
	margin: 0px 0px 15px 0px;
	color: black
}
.form label > span{
	width: 100px;
	font-weight: bold;
	float: left;
	padding-top: 8px;
	padding-right: 5px;
}
.form span.required{
	color:red;
}

.form input.input, .form .select{
	width: 48%;	
}
.form input.input, 
.form .textarea, 
 .form .select{
	box-sizing: border-box;
	border: 1px solid #C2C2C2;
	border-radius: 3px;
	padding: 7px;
	outline: none;
}
.form.input-field:focus,  
.form .textarea-field:focus,  
.form .select-field:focus{
	border: 1px solid #0C0;
}
.form .textarea{
	height:100px;
	width: 55%;
}
.form input.sub,
.form input.sub{
	background-color: #0099cc;
  color: white;
    border: 1px solid #0099cc;
  border-radius: 30px;
  cursor: pointer;
	outline:none;
	padding: 8px 15px 8px 15px;
	
}
.form input.sub:hover,
.form input.sub:hover{
	background: #0099cc;
	color: white;
}

</style>


<div style="height:100%; width:100%; background-color:white; display: flex; align-items: center; justify-content: center; overflow-y:auto;">
  <div class="form">
  
  <%
		//out.println("<h1>"+request.getContextPath()+"</h1>");
		PWA pwa = (PWA)request.getAttribute("pwa");
		String category="entertainment";
		String name="";
		String description="";
		String link="";
		
		if(pwa!=null)
		{
			category=pwa.getCategory();
			name=pwa.getName();
			description=pwa.getDescription();
			link=pwa.getLink();
		}
		if(pwa!=null)
		{
			 out.println("<form method='POST' action ='editPWA' enctype='multipart/form-data'>");
			 out.println("<input type=\"hidden\" name=\"pwaId\" value=\""+ pwa.getPwaId() +"\"> ");
		}
		else if(pwa==null)
		{
			out.println("<form method='POST' action ='addPWA' enctype='multipart/form-data'>");
		} 
	%>
	

	
  
  
  <label Style="color:black; font-weight: bold;">Category</label>
  <select name="category" id="myselect" class="browser-default">    
    <option value="entertainment">Entertainment</option>
          <option value="food">Food</option>
          <option value="tool">Tool</option>
          <option value="sports">Sports</option>
          <option value="education">Education</option>
  </select>
  <br>
  <br>
<label><span>Name</span>
<input type="text" value="<%= name %>" class="input" name="name" /></label>
<label><span>Description</span>
<textarea name="description" id="mytextarea" class="textarea"></textarea>
</label>
<label><span>Logo</span>
<input type="file" name="logo" /></label>

<input type="hidden" name="samplePicsCount" value="4">  

<label><span>Sample Pic</span>
<input type="file" name="sample1" /></label>
<label><span>Sample Pics</span>
<input type="file" name="sample1" /></label>
<label><span>Sample Pics</span>
<input type="file" name="sample1" /></label>
<label><span>Sample Pics</span>
<input type="file" name="sample1" /></label>
<label><span>Link</span>
<input type="text" value="<%= link %>" class="input" name="link" /></label>

<label><span> </span><input class="sub" type="submit" value="submit" /></label>
</form>
</div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
    document.getElementById("mytextarea").defaultValue = "<%=description%>";

  });
document.getElementById("myselect").value = "<%=category%>";
document.getElementById("mytextarea").defaultValue = "<%=description%>";
</script>