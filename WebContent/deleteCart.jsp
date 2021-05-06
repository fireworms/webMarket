<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbConn.jsp" %>
<%
	
	String id = (String)session.getAttribute("id");
	sql = "delete from cart where id = ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();

	response.sendRedirect("cart.jsp");
%>