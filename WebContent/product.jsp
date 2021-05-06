<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%@ include file="./dbConn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		sql = "select * from product where productid = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		rs.next();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/upload/<%=rs.getString("filename")%>" style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("pname")%></h3>
				<p><%=rs.getString("description")%>
				<p>
					<b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("productid")%></span>
				<p>
					<b>제조사</b> :
					<%=rs.getString("manufacturer")%>
				<p>
					<b>분류</b> :
					<%=rs.getString("category")%>
				<p>
					<b>재고 수</b> :
					<%=rs.getString("unitsinstock")%>
				<h4><%=rs.getString("unitprice")%>원
				</h4>
				<p>
				<form name="addForm"
					action="./addCart.jsp?id=<%=rs.getString("productid")%>" method="post">
					<p>
						<a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문
							&raquo;</a> <a href="./cart.jsp" class="btn btn-warning"> 장바구니
							&raquo;</a> <a href="./products.jsp" class="btn btn-secondary">
							상품 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(con!=null){con.close();}
	%>
	<jsp:include page="footer.jsp" />
</body>
</html>