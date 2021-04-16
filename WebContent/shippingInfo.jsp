<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css" />
<script type = "text/javascript" src ="./resources/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배송 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">배송 정보</h1>
		</div>
	</div>
	<div class = "container">
		<form name = "shippingProduct" action = "./processShippingInfo.jsp" class = "form-horizontal" method = "post">
			<input type = "hidden" name = "cartId" value = "<%=request.getParameter("cartId") %>" />
			<div class = "form-group row">
				<label class = "col-sm-2">성명</label>
				<div class = "col-sm-3">
					<input id = "name" name = "name" type = "text" class = "form-control" />	
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2">배송일</label>
				<div class = "col-sm-3">
					<input id = "shippingDate" name = "shippingDate" type = "text" class = "form-control" />(yyyy/mm/dd)
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2">국가</label>
				<div class = "col-sm-3">
					<input id = "country" name = "country" type = "text" class = "form-control" />
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2">우편번호</label>
				<div class = "col-sm-3">
					<input id = "zipCode" name = "zipCode" type = "text" class = "form-control" />
				</div>
			</div>
			<div class = "form-group row">
				<label class = "col-sm-2">주소</label>
				<div class = "col-sm-5">
					<input id = "addressName" name = "addressName" type = "text" class = "form-control" />
				</div>
			</div>
			<div class = "form-group row">
				<div class = "col-sm-offset-2 col-sm-10">
					<a href = "./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class = "btn btn-secondary" role = "button"> 이전 </a>
					<input type = "button" class = "btn btn-primary" value = "등록" onclick = "CheckShippingProduct()"/>
					<a href = "./checkOutCancelled.jsp" class = "btn btn-secondary" role = "button"> 취소 </a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>