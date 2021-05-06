<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file = "./dbConn.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type = "text/javascript" src ="./resources/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String role = (String)session.getAttribute("role");
		if(role==null || !role.equals("admin")){
			response.sendRedirect("./login.jsp");
		}
	%>
	<%
		request.setCharacterEncoding("utf-8");
		String productid = request.getParameter("id");
		sql = "select * from product where productid = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, productid);
		rs = pstmt.executeQuery();
		rs.next();
	%>
	<fmt:setLocale value = '<%= request.getParameter("language") %>' />
	<fmt:bundle basename="resourceBundle.message">
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key = "modifyProduct" /></h1>
		</div>
	</div>
	<div class="container">
		<div class = "text-right">
			<a href = "?id=<%=productid %>&language=ko" > Korean</a>|<a href = "?id=<%=productid %>&language=en">English</a>
			<a href = "logout.jsp" class = "btn btn-sm btn-success pull-right">logout</a>	
		</div>
		<form name="newProduct" action="./processModifyProduct.jsp"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "productId" /></label>
				<div class="col-sm-3">
					<input type="text" id = "productId" name="productId" class="form-control" value = "<%=rs.getString(1) %>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "pname" /></label>
				<div class="col-sm-3">
					<input type="text" id = "name" name="name" class="form-control" value = "<%=rs.getString(2) %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "unitPrice" /></label>
				<div class="col-sm-3">
					<input type="text" id = "unitPrice" name="unitPrice" class="form-control" value = "<%=rs.getString(3) %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "description" /></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control"><%=rs.getString(4) %></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "manufacturer" /></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control" value = "<%=rs.getString(5) %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "category" /></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value = "<%=rs.getString(6) %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" id = "unitsInStock" name="unitsInStock" class="form-control" value = "<%=rs.getString(7) %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key = "condition" /></label>
				<div class="col-sm-5">
				<%System.out.println(rs.getString(8)); %>
					<input type="radio" name="condition" value="new" <%=rs.getString(8).equals("new") ? "checked" : "" %>> <fmt:message key = "condition_New" /> <input
						type="radio" name="condition" value="old" <%=rs.getString(8).equals("old") ? "checked" : "" %>> <fmt:message key = "condition_Old" /> <input
						type="radio" name="condition" value="refurbished" <%=rs.getString(8).equals("refurbished") ? "checked" : "" %>> <fmt:message key = "condition_Refurbished" />
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2"><fmt:message key = "productImage" /></label>
				<div class = "col-sm-5">
					<input type = "file" name = "productImage" class = "form-control">	
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="<fmt:message key = "button" />" onclick = "CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
	</fmt:bundle>
</body>
</html>