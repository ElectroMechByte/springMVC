<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LOGIN</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container" style="margin-top: 30px">

		<div class="card">
			<div class="card-body" style="background: aliceblue;">

				<c:url var="loginUser" value="/loginProcess">
					<c:param name="${loginUser}" value="${customer.firstname}" />
				</c:url>
				<form:form id="loginForm" modelAttribute="customer"
					action="loginProcess" method="post">

					<h2 style="text-align: center;">Login</h2>
					<br>

					<div class="form-group row">
						<form:label path="firstname" class="col-sm-2 col-form-label">FirstName:</form:label>
						<form:input path="firstname" id="firstname" required="true" />
					</div>

					<div class="form-group row">
						<form:label path="password" class="col-sm-2 col-form-label">Password:</form:label>
						<form:password path="password" name="password" id="password"
							required="true" />
					</div>

					<form:button id="login" name="login" class="btn btn-info">Login</form:button>

					<a href="<c:url value="/home"/>" class="btn btn-info" role="button"
						style="float: right;">Home</a>


				</form:form>
			</div>
		</div>
	</div>
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>
</body>
</html>