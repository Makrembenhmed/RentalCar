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
	height: 460px; /* Définissez la hauteur souhaitée */
	object-fit: cover;
	/* Pour s'assurer que l'image couvre complètement la zone définie */
}
</style>

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



	<div class="container">

		
<div class="row">
<div class="col col-8">
			<h5>Welcome ${user.firstName } Your select Car : ${car.brand }
				${car.model}</h5>
				</div>
				<div class="col col-4 ">
				<a class="btn btn-warning" href="/"> Return</a>
				</div>
</div>

<c:forEach var="oneres" items="${Rescar}">

<c:if test="${oneres.status == 'INPROGRESS' }">

<c:set var="idres" value="${oneres.id}" />
<h4 class="text text-warning"> you can rent this car after this Date : ${oneres.endDate }</h4>

</c:if>

</c:forEach>
<c:if test="${idres!= null }">
			<form:form action="/new/reservation/${car.id }/${user.id }/${idres}" modelAttribute="rental"
				class="form" method="post">
				<div class="row mt-3 mb-2">
				<div class="col-lg-4 col-md-6 col-12 p-1">
					<div class="form-group">
						<form:errors path="startDate" class="error" />
						<form:label for="startDate" path="startDate">Depart Date :</form:label>
						<input type="datetime-local" path="startDate" class="date" name="startDate"
							value="<fmt:formatDate value="" pattern="yyyy-MM-dd'T'HH:mm" />" />
							<p class="text-danger">${message}</p>
							<p class="text-danger">${message1}</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12 p-1">
					<div class="form-group">
						<form:errors path="endDate" class="error" />
						<form:label for="endDate" path="endDate">End Date :</form:label>
						<input   type="datetime-local" path="endDate" class="date" name="endDate"
							value="<fmt:formatDate value="" pattern="yyyy-MM-dd'T'HH:mm" />" />
							<p class="text-danger">${message}</p>

					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12 p-1 ">
					<button type="submit" class="btn btn-primary">Create</button>
				</div>
				<div class="col-lg-4 col-md-6 col-12 p-1 ">
					<h3></h3>
				</div>
				</div>
				
			</form:form>
		
</c:if>
<c:if test="${idres == null }">
			<form:form action="/new/reservation/${car.id }/${user.id }/0" modelAttribute="rental"
				class="form" method="post">
				<div class="row mt-3 mb-2">
				<div class="col-lg-4 col-md-6 col-12 p-1">
					<div class="form-group">
						<form:errors path="startDate" class="error" />
						<form:label for="startDate" path="startDate">Depart Date :</form:label>
						<input type="datetime-local" path="startDate" class="date" name="startDate"
							value="<fmt:formatDate value="" pattern="yyyy-MM-dd'T'HH:mm" />" />
							<p class="text-danger">${message}</p>
							<p class="text-danger">${message1}</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12 p-1">
					<div class="form-group">
						<form:errors path="endDate" class="error" />
						<form:label for="endDate" path="endDate">End Date :</form:label>
						<input   type="datetime-local" path="endDate" class="date" name="endDate"
							value="<fmt:formatDate value="" pattern="yyyy-MM-dd'T'HH:mm" />" />
							<p class="text-danger">${message}</p>

					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12 p-1 ">
					<button type="submit" class="btn btn-primary">Create</button>
				</div>
				<div class="col-lg-4 col-md-6 col-12 p-1 ">
					<h3></h3>
				</div>
				</div>
				
			</form:form>
		
</c:if>




		<div class="card h-100">

			<h3>${car.brand}</h3>
			<div id="carouselExampleControls_${car.id}" class="carousel slide "
				data-ride="carousel">
				<div class="carousel-inner">
					<c:forEach var="oneligne" items="${car.carImages}"
						varStatus="imageStatus">
						<div
							class="carousel-item ${imageStatus.index == 0 ? 'active' : ''}">
							<img class="d-block w-100" src="${oneligne.imageUrl}"
								alt="Car Image">

						</div>
					</c:forEach>
				</div>
				<a class="carousel-control-prev"
					href="#carouselExampleControls_${car.id}" role="button"
					data-slide="prev"> <span class="carousel-control-prev-icon"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next"
					href="#carouselExampleControls_${car.id}" role="button"
					data-slide="next"> <span class="carousel-control-next-icon"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>
			</div>


			<div class="card-body">
				<h4 class="card-title badge bg-primary text-wrap "
					style="width: 8rem;">RENT 24 HOURS by :${car.price} DT</h4>
				<p class="card-text">beautiful ${car.color} branded car:
					${car.brand} and model ${car.model} started ${car.year} years ago .</p>

			</div>
		</div>
</div>
	
</body>
</html>