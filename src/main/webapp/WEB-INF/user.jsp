<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tacos</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/premiere.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->

<style type="text/css" media="screen">
@import "/css/first.css";
</style>
</head>
<body>
<div class="container">
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand text-warning" href="#">ITCA</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="/all/reservation">Current Rental </a></li>
					<li class="nav-item"><a class="nav-link active"
						href="/search/car">Cars</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">claim</a>
					</li>


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">
							Administration </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/addCar"
								style="color: blue">Car Management</a></li>
							<li><a class="dropdown-item" href="#">Rental Management</a></li>
							<li><a class="dropdown-item" href="#">.... </a></li>
							<li><a class="dropdown-item" href="#">.... </a></li>
							<li><hr class="dropdown-divider"></li>
							<li style="background-color: red"><a class="dropdown-item"
								href="/logout">Logout</a></li>
						</ul></li>
				</ul>
			</div>

		</div>
	</nav>


	

		<div class="row">
			<div class="col col-8"></div>

			<!-- Representation  -->
			<!-- Welcome -->
			<div class="jumbotron bg-light">
					<h1 class="display-4 text-warning">ITCA</h1>
					<p class="lead">Company of Rental Car</p>
					<hr class="my-4">
					


					

				</div>
			
			
			
			
			
			
			
			<div class="col col-6">
				<div class="row mt-3">
					<div
						class="col-6 login-reg-main border-round give-me-space-up-down">
						<h3>Register:</h3>
						<form:form action="/register" method="post"
							modelAttribute="newUser">
							<div class="form-group">
								<label>First Name:</label>
								<form:input path="firstName" class="form-control" />
								<form:errors path="firstName" class="text-danger" />
							</div>
							<div class="form-group">
								<label>Last Name:</label>
								<form:input path="lastName" class="form-control" />
								<form:errors path="lastName" class="text-danger" />
							</div>
							<div class="form-group">
								<label>Phone:</label>
								<form:input path="phone" class="form-control" />
								<form:errors path="phone" class="text-danger" />
							</div>
							<div class="form-group">
								<label>Email:</label>
								<form:input path="email" class="form-control" />
								<form:errors path="email" class="text-danger" />
							</div>
							<div class="form-group">
								<label>Password:</label>
								<form:password path="password" class="form-control" />
								<form:errors path="password" class="text-danger" />
							</div>
							<div class="form-group">
								<label>Confirm Password:</label>
								<form:password path="confirm" class="form-control" />
								<form:errors path="confirm" class="text-danger" />
							</div>
							<input type="submit" value="Register"
								class="btn btn-primary mt-3" />
						</form:form>
					</div>
					<!-- LOGIN -->
					<!-- newLogin object will touch the model to validate only -->
					<div class="col-6   login-reg-main border-round">
						<h3>Login:</h3>
						<form:form action="/login" method="post" modelAttribute="newLogin">
							<div class="form-group">
								<label>Email:</label>
								<form:input path="email" class="form-control" />
								<form:errors path="email" class="text-danger" />
							</div>
							<div class="form-group">
								<label>Password:</label>
								<form:password path="password" class="form-control" />
								<form:errors path="password" class="text-danger" />
							</div>
							<input type="submit" value="Login" class="btn btn-success mt-3" />
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-6">
			
			<img src="/images/firstimg.png" class="card-img h-100" alt="...">
			
			</div>
		</div>
	
</div>

	<div class="text-center m-5 "
		style="background-color: #5e3f8b; color: aliceblue;">Tableau</div>


	<table class="table table-striped table-hover">
		<thead class="table-dark">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">First Name</th>
				<th scope="col">Email</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto@gmail.com</td>
				<td>@mdo</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>Jacob</td>
				<td>Thornton@gmail.com</td>
				<td>@fat</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>@twitter</td>
				<td>Thornton@gmail.com</td>

				<td>@fat</td>
			</tr>
		</tbody>
	</table>



	<!--Footer-->

	<footer class="bg-dark text-light text-center text-lg-start"
		style="border-top: 10px solid #ffc107;">
		<!-- Grid container -->
		<div class="container p-4">
			<!--Grid row-->
			<div class="row">
				<!--Grid column-->
				<div class="col-lg-6 col-md-12 mb-4 mb-md-0">
					<h5 class=" text-warning">ITCA</h5>

					<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
						Iste atque ea quis molestias. Fugiat pariatur maxime quis culpa
						corporis vitae repudiandae aliquam voluptatem veniam, est atque
						cumque eum delectus sint!</p>
				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-lg-6 col-md-12 mb-4 mb-md-0">
					<h5 class="text-warning">Service Commercial</h5>

					<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
						Iste atque ea quis molestias. Fugiat pariatur maxime quis culpa
						corporis vitae repudiandae aliquam voluptatem veniam, est atque
						cumque eum delectus sint!</p>
				</div>
				<!--Grid column-->
			</div>
			<!--Grid row-->
		</div>
		<!-- Grid container -->

		<!-- Copyright -->
		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0.2);">
			© 2020 Copyright: <a class="text-dark" href="https://ITCA.com/">ITCA.com</a>
		</div>
		<!-- Copyright -->
	</footer>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>



</body>
</html>