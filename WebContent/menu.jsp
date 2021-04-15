<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = '<%= request.getParameter("language") %>' />
<fmt:bundle basename="resourceBundle.menu">
<nav class = "navbar navbar-expand navbar-dark bg-dark">
	<div class = "container">
		<div class = "navbar-header">
			<a class="navbar-brand" href="./welcome.jsp"><fmt:message key = "welcome" /></a>
			<a class="navbar-brand" href="./products.jsp"><fmt:message key = "products" /></a>
			<a class="navbar-brand" href="./addProduct.jsp"><fmt:message key = "addProduct" /></a>
		</div>
	</div>
</nav>
</fmt:bundle>