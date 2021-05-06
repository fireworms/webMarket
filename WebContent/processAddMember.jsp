<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");	
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birthday");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	tel = tel.replace("-", "");
	tel = tel.substring(0, 3)+"-"+tel.substring(3, 7)+"-"+tel.substring(7, 11);
	String address = request.getParameter("address");
	String role = request.getParameter("role");
	
	sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birthday);
	pstmt.setString(6, email);
	pstmt.setString(7, tel);
	pstmt.setString(8, address);
	pstmt.setString(9, role);
	pstmt.executeUpdate();
	
	if(pstmt!=null){
		pstmt.close();
	}
	if(con!=null){
		con.close();
	}
	
	response.sendRedirect("./welcome.jsp");
%>