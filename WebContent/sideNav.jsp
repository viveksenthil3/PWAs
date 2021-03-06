<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
	.logo{
		
	    width: 90px;
    	margin: 3em 0 0 0;
    	cursor: pointer;
	}
	
	.addPwaBtn{
		background-color: #ffc61a;
		height: 2.2em;
		width: 8.3em;
	    display: flex;
	    justify-content: center;
	    align-items: center;
		border-radius: 5em;
		margin: 6.5em 0 0 0;
	}
	
	a{
		text-decoration: none;
		color: black;
	}
	
	a:hover{
		text-decoration: none;
	}
	
	.categoryContainerSideNav{
		margin: 10em 0 0 0;
	}
	
	.categoriesSideNav{
	
		display: flex;
    	justify-content: start;
    	align-items: center;
    	margin: .5em 0;
    	
	}
	
	
	
	.categoriesSideNav i{
		margin: 0 .5em 0 0;
	}
	
	.categoriesSideNav p{
		margin: .2em 0;
	}
	
	.loginOrSignup{
		display: flex;
		margin: 12em 0 0 0;
		justify-content: center;
		align-items: center;
	}
	
	.loginOrSignup a{
		margin: 0 .5em;
		cursor: pointer;
	}
	
	.logout{
		display: flex;
		margin: 12em 0 0 0;
		justify-content: center;
		align-items: center;
	}
	
	.logoutBtn{
		cursor: pointer;
	}
	
</style>
</head>
<div style="height:100%; width:100%; background-color:white; display: flex; flex-direction:column; align-items: center; justify-conten: center;">
	<img class="logo" src="/PWAs/images/PWAS.png"> 
	
	<a href="/PWAs/addPWA" class="addPwaBtn"><i style="background-color: rgb(0,0,0,0); color:black;" class='material-icons'>add</i><p>Add PWA</p> </a>
	
	<div class="categoryContainerSideNav">
		<a href="/PWAs/home#Entertainment" class="categoriesSideNav"><i class="material-icons">casino</i> <p>Entertainment</p> </a>
		<a href="/PWAs/home#Food" class="categoriesSideNav"><i class="material-icons">restaurant</i> <p>Food</p> </a>
		<a href="/PWAs/home#Tool" class="categoriesSideNav"><i class="material-icons">construction</i> <p>Tool</p> </a>
		<a href="/PWAs/home#Sports" class="categoriesSideNav"><i class="material-icons">sports_cricket</i> <p>Sports</p> </a>
		<a href="/PWAs/home#Education" class="categoriesSideNav"><i class='material-icons'>school</i> <p>Education</p> </a>
	</div>
	
	<%
		if(session.getAttribute("username")!=null){
			out.print("<div style='display:none' class='loginOrSignup'>");
		}
		else{
			out.print("<div class='loginOrSignup'>");
		}
	%>
	
		<a href="/PWAs/login">Login</a>
		<p>|</p>
		<a href="/PWAs/register">Register</a>
	</div>
	
	<%
		if(session.getAttribute("username")!=null){
			out.print("<div class='logout'>");
		}
		else{
			out.print("<div style='display: none;' class='logout'>");
		}
	%>
	
	
		<a class="logoutBtn">Logout</a>
	</div>
	
</div>

<script>
$(".logoutBtn").click(e=>{
	$.post('/PWAs/login', {
		username: 'nill',
		password: 'nill'
	}, _=>{
		window.location.href = '/PWAs/home';
	})
});

$(".logo").click(_=>{
	window.location.href = '/PWAs/home';
})
</script>

