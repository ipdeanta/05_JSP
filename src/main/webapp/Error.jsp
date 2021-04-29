<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>
	<h1>Se ha detectado un error.</h1>
	<div>Redireccionado aquí desde <%= request.getAttribute("javax.servlet.error.request_uri") %></div>
	<br>
	<div><%= request.getAttribute("javax.servlet.error.message") %></div>
	<div>
		<jsp:scriptlet>
			<![CDATA[
	         	StackTraceElement[] stackTrace = exception.getStackTrace();
			   	for (int i=0; i < stackTrace.length; i++) {
			   		out.println(stackTrace[i]);
			   	}		   	
		   	]]>
		</jsp:scriptlet>
	</div>
</body>
</html>