<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
<meta charset="ISO-8859-1">
<title>PWA store</title>

<!-- Google material icons CDN -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            

</head>
<body style="margin:0;">
<div style="display:flex;width:100%;height:100vh;">
	
	<div style="background-color: red;height: 100%;flex: 1;"><jsp:include page="sideNav.jsp"></jsp:include></div>
	
	<div style="background-color: green;height: 100%;flex: 5;display: flex;flex-direction: column;">
		<jsp:include page="searchBar.jsp"></jsp:include>
		<jsp:include page="addPwaMainContent.jsp"></jsp:include>
	</div>
</div>
</body>
</html>