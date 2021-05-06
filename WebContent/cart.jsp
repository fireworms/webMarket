<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page = "menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">장바구니</h1>
		</div>
	</div>
	<div class = "container">
		<div class = "row">
			<table width = "100%">
				<tr>
					<td align = "left"><a href = "./deleteCart.jsp" class = "btn btn-danger">삭제하기</a></td>
					<td align = "right"><a href = "./shippingInfo.jsp" class = "btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style = "padding-top : 50px">
			<table class = "table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
					String id = (String)session.getAttribute("id");
					sql = "select p.productid, p.pname, p.unitprice, c.quantity, c.quantity*p.unitprice from product p join cart c on p.productid = c.productid where c.id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					int sum = 0;
					while(rs.next()){
						sum += rs.getInt(5);
				%>
				<tr>
					<td><%=rs.getString(1)%> - <%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><a href = "./removeCart.jsp?productid=<%=rs.getString(1)%>" class = "badge badge-danger">삭제</a></td> 
				</tr>
				<%
					}
					rs.close();
					pstmt.close();
					con.close();
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href = "./products.jsp" class = "btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page = "footer.jsp" />
</body>
</html>