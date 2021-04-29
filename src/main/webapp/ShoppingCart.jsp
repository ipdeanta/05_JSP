<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.stream.*, java.util.function.*" %>
<%@ page import="model.dao.*, model.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/app_styles.css" media="screen">
	</head>
	<body>
		<h2>Carro de la compra:</h2>
		<jsp:scriptlet>
			<![CDATA[Map<Integer, Product> cartMap = new HashMap<Integer, Product>();
		        // Recuperamos lista de sesión
			    List<Producto> cartList = (List<Producto>)session.getAttribute("cartList");
			    Map<Producto, Long> groupedCart = new HashMap<Producto, Long>();
			    if (cartList != null) {
			    	//procesamos lista
			    	groupedCart = cartList.stream().collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));
			    	pageContext.setAttribute("groupedCart", groupedCart);
			    }]]>
		</jsp:scriptlet>
		<form action="">
		<table border="2">
			<tr>
			    <th>Cantidad</th>
			    <th>Producto</th>
			    <th>Descripción</th>
			    <th>Precio</th>
			    <th>Total</th>
		    </tr>			
	        <c:forEach items="${pageScope.groupedCart}" var="entry">
		        <tr>
		        	<td><c:out value="${entry.value}"></c:out></td>
		            <td><c:out value="${entry.key.nombre}"></c:out></td>
		            <td><c:out value="${entry.key.descripcion}"></c:out></td>
		            <td><fmt:formatNumber value = "${entry.key.precio / 100}" type = "currency"/></td>
		            <td><fmt:formatNumber value = "${(entry.key.precio / 100)  * entry.value}" type = "currency"/></td>
	             </tr>
           	</c:forEach>
		</table>
		</form>
	</body>
</html>