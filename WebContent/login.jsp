<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<jsp:include page = "menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">로그인</h1>
		</div>
	</div>
	<div class = "container" align = "center">
		<div class = "col-md-4 col-md-offset-4">
			<h3 class = "form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class = 'alert alert-danger'>");
					out.println("아이디와 비밀번호를 입력하세요");
					out.println("</div>");
				}
				System.out.println(request.getRequestURI());
			%>
			<form class = "form-signin" action = "./processLogin.jsp" method = "post" onsubmit = "javascript:referrer()">
				<input id = "referrer" type = "hidden" name = "referrer" value = "<%=request.getParameter("pageName")!=null ? request.getParameter("pageName") : request.getHeader("referer")%>">
				<div class = "form-group">
					<label for = "inputUserName" class = "sr-only">User Name</label>
					<input type = "text" class = "form-control" placeholder = "ID" name = 'id' required autofocus>
				</div>
				<div class = "form-group">
					<label for = "inputPassword" class = "sr-only">Password</label>
					<input type = "password" class = "form-control" placeholder = "Password" name = 'pass' required>
				</div>
				<button class = "btn btn btn-lg btn-success btn-block" type = "submit">로그인</button>
			</form>
		</div>
	</div>
</body>
</html>