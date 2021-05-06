<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbConn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
 	String id = request.getParameter("id");
 	String password = request.getParameter("pass");
 	String referrer = request.getParameter("referrer");
 	
 	System.out.println(referrer);
	sql = "select id, role from member where id = ? and pass = ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	rs = pstmt.executeQuery();
	boolean isSuccess = true;
	if(rs.next()){
		session.setAttribute("id", rs.getString(1));
		session.setAttribute("role", rs.getString(2));
	}else{
		isSuccess = false;
	}
	rs.close();
	pstmt.close();
	con.close();
	if(isSuccess){
		response.sendRedirect(referrer);
		//response.sendRedirect(request.getHeader("referer"));
	}else{
		response.sendRedirect("./login.jsp?error=1");
	}
%>