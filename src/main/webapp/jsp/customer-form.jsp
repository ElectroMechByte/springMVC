<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Registration</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- JavaScript -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/semantic.min.css" />
<!-- Bootstrap theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/bootstrap.min.css" />
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
				<c:if test="${empty customer.firstname}">
					<c:url var="saveUrl" value="saveCustomer" />
				</c:if>
				<c:if test="${not empty customer.firstname}">
					<c:url var="saveUrl" value="updateCustomer">
						<c:param name="customerId" value="${customer.id}" />
					</c:url>
				</c:if>
				<form:form id="regForm" modelAttribute="customer"
					action="${saveUrl}" method="post">
					<c:set var="customerId" value="${customer.firstname}" />
					<c:if test="${empty customerId}">
						<h2 style="text-align: center;">Registration</h2>

					</c:if>

					<c:if test="${not empty customerId}">
						<h2 style="text-align: center;">Update Customer</h2>
					</c:if>
					<br>


					<div class="form-group row">
						<form:label path="firstname" class="col-sm-2 col-form-label">FirstName:</form:label>
						<form:input path="firstname" id="firstname" required="true"
							onchange="checkDuplicate('firstname','Firstname Already Exists')" />
					</div>

					<div class="form-group row">
						<form:label path="lastname" class="col-sm-2 col-form-label">LastName:</form:label>
						<form:input path="lastname" id="lastname" required="true" />
					</div>

					<div class="form-group row">
						<form:label path="password" class="col-sm-2 col-form-label">Password:</form:label>
						<form:input path="password" id="password" required="true" />
					</div>

					<div class="form-group row">
						<form:label path="email" class="col-sm-2 col-form-label">Email:</form:label>
						<form:input path="email" id="email" required="true" />
					</div>

					<div class="form-group row">
						<form:label path="address" class="col-sm-2 col-form-label">Address:</form:label>
						<form:input path="address" id="address" required="true" />
					</div>

					<div class="form-group row">
						<form:label path="phone" class="col-sm-2 col-form-label">Phone:</form:label>
						<form:input path="phone" id="phone" required="true" />
					</div>
					<c:if test="${empty customer.firstname}">
						<form:button id="register" name="register" class="btn btn-info">Register</form:button>

						<a href="<c:url value="/home"/>" class="btn btn-info"
							role="button" style="float: right;">Home</a>

					</c:if>

					<c:if test="${not empty customer.firstname}">
						<form:button id="register" name="register" class="btn btn-info">Update</form:button>

						<a href="<c:url value="/customer/list"/>" class="btn btn-info"
							role="button" style="float: right;">Home</a>

					</c:if>

				</form:form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function checkDuplicate(id,msg) {

		var url = "<c:url value="/customer/checkName"/>";
		var dataString = "name=" + $('#' + id).val();
		$.ajax({
			type : "GET",
			url : url,
			data : dataString,
			success : function(result) {
				if (result == true) {
					alertify.error(msg);
					$('#' + id).val('');
					$('#' + id).html(msg);
				} else {
					$('#' + id).html('');
				}
			}
		});

	}
</script>
</html>