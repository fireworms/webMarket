<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbConn.jsp" %>
<%
	String id = (String)session.getAttribute("id");
	String productid = request.getParameter("productid");
	sql = "delete from cart where id = ? and productid = ?";
	pstmt = con.prepareStatement(sql);
 	pstmt.setString(1, id);
 	pstmt.setString(2, productid);
 	pstmt.executeUpdate();
 	
	pstmt.close();
	con.close();
	
	response.sendRedirect("cart.jsp");
%>