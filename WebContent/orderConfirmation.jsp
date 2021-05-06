<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file="./dbConn.jsp"%>

<%
	request.setCharacterEncoding("utf-8");

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
			if (n.equals("Shipping_name")) {
				shipping_name = URLDecoder.decode(
						(thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_shippingDate")) {
				shipping_shippingDate = URLDecoder.decode(
						(thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_country")) {
				shipping_country = URLDecoder.decode(
						(thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_zipCode")) {
				shipping_zipCode = URLDecoder.decode(
						(thisCookie.getValue()), "utf-8");
			}
			if (n.equals("Shipping_addressName")) {
				shipping_addressName = URLDecoder.decode(
						(thisCookie.getValue()), "utf-8");
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>

	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br> 성명 :
				<%=shipping_name%>
				<br> 우편번호 :
				<%=shipping_zipCode%>
				주소 :
				<%=shipping_addressName%>(<%=shipping_country%>)<br>
			</div>
			<div class="col-4" align="right">
				<p>
					<em>배송일 : <%=shipping_shippingDate%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">도서</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					String id = (String) session.getAttribute("id");
					sql = "select p.pname, p.unitprice, c.quantity, c.quantity*p.unitprice from product p join cart c on p.productid = c.productid where c.id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					int sum = 0;
					while (rs.next()) {
						sum += rs.getInt(4);
				%>
				<tr>
					<td class="text-center"><em><%=rs.getString(1)%></em></td>
					<td class="text-center"><%=rs.getString(3)%></td>
					<td class="text-center"><%=rs.getString(2)%>원</td>
					<td class="text-center"><%=rs.getInt(4)%>원</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액 : </strong></td>
					<td class="text-center text-danger"><strong><%=sum%></strong></td>
				</tr>
			</table>

			<a href="./shippingInfo.jsp" class="btn btn-secondary" role="button">
				이전 </a> <a href="./thankCustomer.jsp" class="btn btn-success"
				role="button"> 주문 완료 </a> <a href="./checkOutCancelled.jsp"
				class="btn btn-secondary" role="button"> 취소 </a>
		</div>
	</div>
</body>
</html>