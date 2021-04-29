<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.time.format.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<div class="footerText center">
			<div>Hora de la petición =&nbsp<%= LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:SS")) %></div>
			<!-- <div>Navegador de la petición =&nbsp<%= request.getHeader("user-agent") %></div>  -->
			<div>Lenguaje de la petición =&nbsp<%= request.getLocale() %></div>
			<div>Todos los derechos reservados.&nbsp<a href="https://policies.google.com/privacy?hl=es">Politica de privacidad</a></div>
		</div>
	</body>
</html>