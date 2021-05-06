<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="./roleCheck.jsp">
<jsp:param value="admin" name="roleCheck"/>
</jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="./dbConn.jsp"%>
			<%
				sql = "select * from product";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="/upload/<%=rs.getString("filename")%>"
					style="width: 100%">
				<h3><%=rs.getString("pname")%></h3>
				<p><%=rs.getString("description")%>
				<p><%=rs.getString("unitprice")%>원
				<p>
					<a
						href="./modifyProduct.jsp?id=<%=rs.getString("productid")%>"
						class="btn btn-secondary" role="button"> 상품 수정 </a> <a
						href="./processDeleteProduct.jsp?id=<%=rs.getString("productid")%>"
						class="btn btn-secondary" role="button"> 상품 삭제 </a>
			</div>
			<%
				}
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
