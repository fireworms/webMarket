<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
	String cfm = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "webmarket";
	String pass = "1234";
	Class.forName(cfm);
	Connection con = DriverManager.getConnection(url, user, pass);
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
