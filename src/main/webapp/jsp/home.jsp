<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html lang="en">
<head>
<title>Spring MVC</title>
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
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}
</style>
</head>
<body>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>Spring MVC</h1>
	</div>


	<div class="container" style="margin-top: 30px">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-sm-6">
						<!-- <a href="login" class="btn btn-info" role="button">Login</a> -->
						<a href="login" class="btn btn-info" role="button" >Login</a> 
						<hr class="d-sm-none">
					</div>
					<div class="col-sm-6">
					<a href="<c:url value="/customer/showForm"/>" class="btn btn-info" role="button"
							style="float: right;">Register</a> 
						 
					</div>


				</div>
			</div>
		</div>

	</div>



</body>
</html>
