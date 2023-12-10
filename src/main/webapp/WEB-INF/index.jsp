<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style>

.carousel-inner img {
	height: 300px; /* Définissez la hauteur souhaitée */
	object-fit: cover;
	/* Pour s'assurer que l'image couvre complètement la zone définie */
}
</style>
 <style type="text/css" media="screen">
      @import "/css/first.css";
    </style>
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
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link active" href="/all/reservation">Current Rental </a></li>
					<li class="nav-item"><a class="nav-link active"
						href="/search/car">Cars</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">Reclamer</a>
					</li>


						</ul>
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<c:if test="${user == null }">
					<li class="nav-item"><a class="nav-link active text-primary" 
						aria-current="page" href="/login">LogIn</a></li>
						</c:if>
						<c:if test="${user != null }">
					<li class="nav-item mt-2"> ${user.firstName }  ${user.lastName }</li>	
					<li class="nav-item"><a class="nav-link active text-danger" href="/logout">LogOut </a></li>
					</c:if>
			</ul>
			</div>
		</div>
	</nav>
	<!--first section-->
	<div class="container m-1">
		<div class="row">
			<div class="col-lg-8">
				<div class="jumbotron bg-light">
					<h1 class="display-4 text-warning">ITCA</h1>
					<p class="lead">Company of Rental Car</p>
					<hr class="my-4">
					


					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-warning" type="submit">Search</button>
					</form>

				</div>

			</div>
			<div class="col-lg-4">


				<div class="list-group">
					<a data-bs-toggle="collapse" href="#x"
						class="list-group-item list-group-item-action bg-warning"
						aria-current="true"> Brand Of Car ... </a>

					<div class="collapse show" id="x">

						<a href="#" class="list-group-item list-group-item-action">Kia</a>
						<a href="#" class="list-group-item list-group-item-action">Peaugeot
						</a> <a href="#" class="list-group-item list-group-item-action">Mercedes</a>

					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="text-center m-2">

		
		<h5>List of Cars</h5>

	</div>
	<div class="container">
		<div class="row">
			<c:forEach var="onecar" items="${allCars}">

				<div class="col-lg-4 col-md-6 col-12 p-1">


					<div class="card h-100">

						<h3>${onecar.brand}</h3>
						<div id="carouselExampleControls_${onecar.id}"
							class="carousel slide " data-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="oneligne" items="${onecar.carImages}"
									varStatus="imageStatus">
									<div
										class="carousel-item ${imageStatus.index == 0 ? 'active' : ''}">
										<img class="d-block w-100" src="${oneligne.imageUrl}"
											alt="Car Image"> <a href="/new/rental/${onecar.id}"
											class="btn btn-success text-center m-5">Rental</a>
									</div>
								</c:forEach>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleControls_${onecar.id}" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleControls_${onecar.id}" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>


						<div class="card-body">
							
								 <a class="btnreserver" href="/new/rental/${onecar.id}">RENT 24 HOURS:${onecar.price} DT</a>
								
							<p class="card-text">beautiful ${onecar.color} branded car:
								${onecar.brand} and model ${onecar.model} started ${onecar.year}
								years ago .</p>
							<a href="#" class="btn btn-warning">More details</a>
						</div>
					</div>


				</div>



			</c:forEach>
		</div>

	</div>

	<!-- slide -->
	<!--Contact-->
	<div class="container">
		<div class="text-center m-5">
			<h3>Contact</h3>


		</div>

		<div class="card mb-3">
			<div class="row g-0">
				<div class="col">
					<div class="card-body">
						<h5 class="card-title"></h5>
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<form>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label>Votre Message</label>
								<textarea class="form-control"></textarea>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							<button type="submit" class="btn btn-warning">Envoyer</button>
						</form>



					</div>
				</div>
				<div class="col ">
					<img src="images/images (1).jpg" class="card-img h-100" alt="...">
				</div>

			</div>
		</div>

	</div>

	

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

					<h3>Contact : </h3>
					<h4>Email :itca@gmail.com</h4>
					<h4>Mobile :98 888 888 / 98 777 777</h4>
					
					
				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-lg-6 col-md-12 mb-4 mb-md-0">
					<h5 class="text-warning">Service Commercial</h5>

					<h4>Adress :Route 14 janvier Tunis Berg Du Lac 2020 </h4>
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