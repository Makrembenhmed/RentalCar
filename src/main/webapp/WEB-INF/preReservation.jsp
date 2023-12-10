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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!-- change to match your file/naming structure -->
</head>
<body>
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
						href="/search/car">Cars</a></li>
					


					
				</ul>
			</div>
			
		</div>
	</nav>
	<div class="container" >

		<div class="text-center m-5">

			<h3>List Of Cars</h3>
			<a href="/"> Return</a>


		</div>

		<c:forEach var="onecar" items="${allCars}">
			<h3>${onecar.brand}</h3>
			<div><a href="/new/rental/${onecar.id}" class="btn btn-success text-center">Reserver</a></div>
			<div id="carouselExampleControls_${onecar.id}" class="carousel slide "
				data-ride="carousel">
				<div class="carousel-inner">
				
					<c:forEach var="oneligne" items="${onecar.carImages}"
						varStatus="imageStatus">
						<div
							class="carousel-item ${imageStatus.index == 0 ? 'active' : ''}">
							<img class="d-block w-100" src="${oneligne.imageUrl}"
								alt="Car Image">
								
						</div>
					</c:forEach>
					 
					
				</div>
				<a class="carousel-control-prev"
					href="#carouselExampleControls_${onecar.id}" role="button"
					data-slide="prev"> <span class="carousel-control-prev-icon"
					aria-hidden="true"></span> <span class="sr-only"
					style="background-color: black">Previous</span>
				</a> <a class="carousel-control-next"
					href="#carouselExampleControls_${onecar.id}" role="button"
					data-slide="next"> <span class="carousel-control-next-icon"
					aria-hidden="true"></span> <span class="sr-only"
					style="background-color: black">Next</span>
				</a>
			</div>
		</c:forEach>


	</div>

</body>
</html>



