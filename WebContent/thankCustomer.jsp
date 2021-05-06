<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 완료</title>
</head>
<body>
	<%
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if (n.equals("Shipping_shippingDate")) {
					shipping_shippingDate = URLDecoder.decode(
							(thisCookie.getValue()), "utf-8");
				}
			}
		}
	%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>
			주문은
			<%=shipping_shippingDate%>에 배송될 예정입니다!
	</div>
	<div class="container">
		<p>
			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
	</div>
</body>
</html>
<%@ include file="dbConn.jsp"%>
<%
	session.invalidate();
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_name")) {
			thisCookie.setMaxAge(0);
		}
		if (n.equals("Shipping_shippingDate")) {
			thisCookie.setMaxAge(0);
		}
		if (n.equals("Shipping_country")) {
			thisCookie.setMaxAge(0);
		}
		if (n.equals("Shipping_zipCode")) {
			thisCookie.setMaxAge(0);
		}
		if (n.equals("Shipping_addressName")) {
			thisCookie.setMaxAge(0);
		}

		response.addCookie(thisCookie);
	}

	String id = (String) session.getAttribute("id");
	sql = "delete from cart where id = ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
%>