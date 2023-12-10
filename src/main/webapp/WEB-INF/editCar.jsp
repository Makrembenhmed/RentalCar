<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>

	<!--navbar-->
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
					<li class="nav-item"><a class="nav-link active" href="#">Demander
							Devis</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">Commander</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="#">Reclamer</a>
					</li>

				</ul>
			</div>
		</div>
	</nav>


	<!--Contact-->
	<div class="container">
		<div class="text-center m-5">
			<h3>Add New Car</h3>


		</div>

		<div class="card mb-3">
			<div class="row g-0">
				<div class="col">
					<div class="card-body">
						<h5 class="card-title">Add Car</h5>

						<form:form action="/editCar/${car.id }" modelAttribute="car" class="form"
							method="put">

							<div class="form-group">
								<form:errors path="brand" class="error" />
								<form:label for="brand" path="brand">Brand</form:label>
								<form:input type="text" path="brand" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter brand" />
							</div>
							<div class="form-group">
								<form:errors path="model" class="error" />
								<form:label for="model" path="model">Model</form:label>
								<form:input type="text" path="model" class="form-control"
									 aria-describedby="model"
									placeholder="Enter model" />

							</div>
							<div class="form-group">
								<form:errors path="color" class="error" />
								<form:label for="color" path="color">color</form:label>
								<form:input type="text" path="color" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter color" />

							</div>
														<div class="form-group">
								<form:errors path="year" class="error" />
								<form:label for="year" path="year">year</form:label>
								<form:input type="number" path="year" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter year" />
							</div>
							<div class="form-group">
								<form:errors path="price" class="error" />
								<form:label for="price" path="price">Rental Price In DT:</form:label>
								<form:input type="number" step="any" path="price" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter year" />
							</div>
							<div class="form-group col-md-6">
								<label>State :</label>
								<form:select path="state" class="form-select">
									<option selected>Open this select menu</option>

									
										<form:option value="New Car">New Car</form:option>
										<form:option value="Old Car">Old Car</form:option>
										
																		
										
									<form:errors path="state" />
									<br>
								</form:select>
							</div>

							<button type="submit" class="btn btn-warning">Update</button>
						</form:form>

					</div>
				</div>
				<div class="col ">
					<img src="images/images (1).jpg" class="card-img h-100" alt="...">
				</div>

			</div>
		</div>

	</div>

	<!--table-->

	



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