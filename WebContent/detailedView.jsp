<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
<meta charset="ISO-8859-1">
<title>PWA store</title>

<!-- Google material icons CDN -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Jquery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body style="margin:0;">
<div style="display:flex;width:100%;height:100vh;">
	
	<div style="background-color: red;height: 100%;flex: 1;"><jsp:include page="sideNav.jsp"></jsp:include></div>
	
	<div style="background-color: #f3f3f3;height: 100%;flex: 5;display: flex;flex-direction: column;">
		<jsp:include page="searchBar.jsp"></jsp:include>
		<jsp:include page="detailedViewMainContent.jsp"></jsp:include>
	</div>
</div>
</body>
</html>