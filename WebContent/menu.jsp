<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value='<%=request.getParameter("language")%>' />
<fmt:bundle basename="resourceBundle.menu">
<script>

</script>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<%
			String sessionId = (String) session.getAttribute("id");
		%>
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./welcome.jsp"><fmt:message
						key="welcome" /></a>
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<%
						if (sessionId == null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/login.jsp'/>"><fmt:message key="login" /></a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/addMember.jsp'/>"><fmt:message
								key="addMember" /></a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/logout.jsp'/>"><fmt:message key="logout" /></a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/modifyMember.jsp'/>"><fmt:message
								key="modifyMember" /></a></li>
					<%
						}
					%>

					<li class="nav-item"><a class="nav-link" href="./products.jsp"><fmt:message
								key="products" /></a></li>
					<li class="nav-item"><a class="nav-link"
						href="./addProduct.jsp"><fmt:message key="addProduct" /></a></li>
					<li class="nav-item"><a class="nav-link"
						href="./modifyProducts.jsp"><fmt:message key="modifyProduct" /></a></li>
				</ul>
			</div>
		</div>
	</nav>
</fmt:bundle>