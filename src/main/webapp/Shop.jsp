<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.dao.*, model.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shop</title>
		<link rel="stylesheet" type="text/css" href="css/app_styles.css" media="screen">
	</head>
	<body>
		<!-- Declarations -->
		<%!final static int MOUSE_ID = 1;
			final static String COOKIE_NAME_MOUSE = "shop_prueba.seen_mouse";
			boolean recomendMouse = false;
			
			Map<Integer, Producto> productMap = ProductDAO.getProductoMap();%>
		
		<!-- Scriptlet -->
		<%
			// Cargamos los productos
			List<Producto> productList = new ArrayList(productMap.values());
			pageContext.setAttribute("productList", productList);
			 
			// Procesamos las cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				
				System.out.println("cookies antes =" + cookies.length);
				
			  	for (Cookie cookie : cookies) {
				  if (cookie.getName().equals(COOKIE_NAME_MOUSE)) {
					  recomendMouse = Boolean.parseBoolean(cookie.getValue());
					  break;
				  }
			  	}
				  	}
		%>
		
		<h3>Bienvenido, ${sessionScope.clientName}.</h3>
		<div><%=recomendMouse ? "Tenemos las siguientes recomendaciones de mouses para ti <a href=\"https:\\www.google.es\"class=\"button\">aquí</a>." : ""%></div>
		<br><br>
		<h2>Listado de productos: </h2>
		<form action="" method="post">
			<table border="2">
				<tr>
				    <th>Añadir</th>
				    <th>Producto</th>
				    <th>Descripción</th>
				    <th>Precio</th>
			    </tr>
			    <c:forEach items="${pageScope.productList}" var="producto" varStatus="status" begin="0" end="${pageScope.productList.size() - 1}">
			        <tr>
			        	<td><input type="checkbox" id="chkItem${producto.id}" name="shopItems" value="${producto.id}"></td>
			            <td><c:out value="${producto.nombre}"></c:out></td>
			            <td><c:out value="${producto.descripcion}"></c:out></td>
			            <td><fmt:formatNumber value = "${producto.precio / 100}" type = "currency"/></td>		            
			        </tr>
			    </c:forEach>
			</table>
			<p class="center">
				<!-- <input type="submit" value="Comprar" id="button-create" />
				<input type="reset" value="Limpiar" id="button-clean" /> -->
				<button type="submit" formaction="Shop.jsp">Añadir al carro</button>
				<button type="reset" >Limpiar</button>				
			</p>
		</form>
		
		<!-- Scriptlet -->
		<%
			// Recuperamos el carro de la compra
			List<Producto> cartList = (List<Producto>)session.getAttribute("cartList");
			if (cartList == null) {
				cartList = new ArrayList<Producto>();
			}
				  
			// procesamos productos seleccionados
			boolean hasMouse = false;
			String[] selectedProducts = request.getParameterValues("shopItems");
			if (selectedProducts != null) {
				for (String selectedId : selectedProducts) {
					int productId = Integer.parseInt(selectedId);
					cartList.add(productMap.get(productId));
					hasMouse = hasMouse || productId == MOUSE_ID;
				} 
			}
			session.setAttribute("cartList", cartList);
				  
			// creamos cookie con par nombre-valor
			if (hasMouse) {
				Cookie mouseCookie = new Cookie(COOKIE_NAME_MOUSE, "true");
				// vida de la cookie (en segundos)
				mouseCookie.setMaxAge(5 * 60); // 5 min
				response.addCookie(mouseCookie);
			}
		%>
		<br><br>
		
		<!-- Carro de la compra -->
		<div><jsp:include page="ShoppingCart.jsp" /></div>
		<form>
			<p class="center">
				<button type="submit" formaction="ConfirmPayment.jsp">Pagar</button>			
			</p>
		</form>			
		<br><br>
		
		<!-- Footer -->
		<%@ include file="Footer.jsp" %>
		
	</body>
</html>