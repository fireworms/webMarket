<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String productid = request.getParameter("id");
	
	sql = "delete from product where productid = ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, productid);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	response.sendRedirect("./modifyProducts.jsp");
%>