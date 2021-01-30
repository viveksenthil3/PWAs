<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
            
</head>
<body>
	<div class="loginMainContainer">
		<div class="loginCard">
			
			<h4>Login </h4>
				<form method="post" action="login">				
				<input name="username" placeholder="User Name" type="text">
				<br>
				<input name="pass" placeholder="Password" type="password">		
				<br>
				<input style="" class="btn orange" value="Login" type="submit">
			</form>
			<div style="display: flex; justify-content: center;">Don't have an account? <a style="text-decorations:none; margin-left:.3em;" href="register">Register</a></div>
		</div>
	</div>
	
	<style>
		body{
			margin: 0;	
			padding: 0;	
		}

		
		.loginMainContainer{
			background: radial-gradient(orange, #ffc61a);
			width: 100%;
			height: 100vh;
			
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.loginCard{
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