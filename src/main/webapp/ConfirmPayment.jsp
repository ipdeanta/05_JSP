<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Confirmar pago</title>
		<link rel="stylesheet" type="text/css" href="css/app_styles.css" media="screen">
	</head>
	<body>
		<h2>Confirmar pago</h2>
		<br><br>
		<jsp:include page="ShoppingCart.jsp" />
		<br><br>
		<form action="" method="post">
			<p class="center">
				<button type="submit" formaction="PaymentController">Confirmar pago</button>
				<button type="submit" formaction="Shop.jsp">Volver</button>			
			</p>
		</form>	
		<br><br>
		<%@ include file="Footer.jsp" %>
	</body>
</html>