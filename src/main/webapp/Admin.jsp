<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="adm.css">
<style>
.error{
	color:red;
	font-size:large;
}
</style>
</head>
<body>
<div class="login">
<form:form action="adminLogin" method="post" modelAttribute="adm">
  <div class="form-group">
  <i class="bi bi-arrow-right-square-fill"></i>
  	<h1 align="center"> Admin Login</h1>
    <label for="InputUseId">Admin ID</label>
    <form:input path="adminUserId"  class="form-control" id="InputUseId"  placeholder="Enter Admin ID"/>
  	<form:errors path="adminUserId" cssClass="error" />
  </div>
  <div class="form-group">
    <label for="InputPassword1">Password</label>
    <form:input  path="password"  class="form-control" id="InputPassword1" placeholder="Enter Password"/>
  <form:errors path="password" cssClass="error" />
  </div>
  <button type="submit" class="btn btn-success"> Login</button>
</form:form>
</div>
</body>
</html>