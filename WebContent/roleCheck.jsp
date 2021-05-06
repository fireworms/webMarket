<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String role = (String) session.getAttribute("role");
		String pageName = request.getRequestURI();
		String roleCheck = request.getParameter("roleCheck");
		if (role == null || !role.equals(roleCheck)) {
	%>
		<jsp:forward page="login.jsp">
		<jsp:param value="<%=pageName %>" name="pageName"/>
		</jsp:forward>
	<%
		}
	%>