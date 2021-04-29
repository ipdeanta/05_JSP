<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%! String nombreClase = "Login Tienda";
	
	public String getNombreClase() {
		return nombreClase;
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title><%= getNombreClase() %></title>
	</head>
	<body>
		<h1 class="center fontCalibri">Login</h1>
		<%@ include file="LoginForm.html" %>
		<br><br>
		<%@ include file="Footer.jsp" %>
	</body>
</html>