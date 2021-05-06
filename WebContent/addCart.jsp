<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./dbConn.jsp" %>
<%	
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String productid = request.getParameter("id");
	sql = "select * from cart where id = ? and productid = ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, productid);
	rs = pstmt.executeQuery();
	if(rs.next()){
		sql = "update cart set quantity = ? where id = ? and productid = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, rs.getInt(3)+1);
		pstmt.setString(2, id);
		pstmt.setString(3, productid);
		pstmt.executeUpdate();
	}else{
		sql = "insert into cart values(?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, productid);
		pstmt.setInt(3, 1);
		pstmt.executeUpdate();
	}
	rs.close();
	pstmt.close();
	con.close();
	response.sendRedirect("product.jsp?id=" + productid);
%>
