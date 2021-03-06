<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            
</head>
<body>
	<div class="registerMainContainer">
		<div class="registerCard">
			
			<h4>Register </h4>
			<%	if(request.getAttribute("error")!=null){
				
				out.println("<div class='errorMsgRegister'>"+request.getAttribute("error")+"</div>");
			}
				%>
				
				<div style="display:none;" class='errorUserExists'>User Name already exists</div>
				
				<form method="post" action="register">				
				<input name="uname" placeholder="User Name" type="text" title="Enter valid User Name" pattern="[a-zA-Z]+[\w]*" required>
				<br>
				<input name="pass" placeholder="Password" type="password" title="Minumum of 8 characters" pattern="[\W\w]{8,32}" required>		
				<br>
				<input name="email" placeholder="Email" type="text" title="Enter valid email" pattern="^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+$" required>		
				<br>
				<input class="btn orange" value="Register" type="submit" >
			</form>
			
			<div style="display: flex; justify-content: center;">Already have an account? <a style="text-decorations:none; margin-left:.3em;" href="login">Login</a></div>
		</div>
	</div>
	
	<style>
		body{
			margin: 0;	
			padding: 0;	
		}

		
		.registerMainContainer{
			background: radial-gradient(orange, #ffc61a);
			width: 100%;
			height: 100vh;
			
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.registerCard{
			background-color: white;
			width: 25em;
			height: 25em;
			padding: 2em 1em 2em 1em; 			
			border-radius: .3em;
			box-shadow: 25px 30px 30px rgb(0,0,0,0.2);
		}
		
		.errorMsgRegister{
			width: 100%;
			border: dashed red 2px;
			color: red;
			text-align: center;
			
			padding: .2em 0;
		}
		
		.errorUserExists{
			width: 100%;
			border: dashed red 2px;
			color: red;
			text-align: center;
			
			padding: .2em 0;
		}
		
	</style>
	
	<script>
		$("input[name='uname']").on('keyup', e=>{
			$.post('/PWAs/usernameExist',{
				username: $(e.target).val()
			}).fail(_=>{
				$(".errorUserExists").hide();
			}).done(_=>{
				$(".errorUserExists").show();
			})
		});
	</script>
</body>
</html>