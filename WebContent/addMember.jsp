<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				회원 가입
			</h1>
		</div>
	</div>
	<div class="container">
		<form name="newMember" action="./processAddMember.jsp"
			class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="password" name="password"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-5">
					<input type="radio" name="gender" value="1" checked> 남자
					<input type="radio" name="gender" value="2"> 여자
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생년월일 ex)20010101</label>
				<div class="col-sm-3">
					<input type="text" id="birthday" name="birthday" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" id="email" name="email" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" id="tel" name="tel" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" id="address" name="address" class="form-control">
				</div>
			</div>
			<input type = "hidden" name = "role" value = "user">
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록"
						onclick="checkAddMember()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>