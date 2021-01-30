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
            
</head>
<body>
	<div class="registerMainContainer">
		<div class="registerCard">
			
			<h4>Register </h4>
				<form method="post" action="register">				
				<input name="uname" placeholder="User Name" type="text">
				<br>
				<input name="pass" placeholder="Password" type="password">		
				<br>
				<input name="email" placeholder="Email" type="text">		
				<br>
				<input class="btn orange" value="Register" type="submit">
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
	</style>
</body>
</html>