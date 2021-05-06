<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	session.invalidate();
%>
<script>
	location.replace(document.referrer);
</script>