<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
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
		


			<h5>Welcome ${user.firstName } Your Rental select Car : ${car.brand }
				${car.model}</h5>

			<form:form action="/editrental/${rental.id}" modelAttribute="rental"
				class="form" method="put">
				<div class="row mt-3 mb-2">
				<div class="col-lg-4 col-md-6 col-12 p-1">
					<div class="form-group">
						<form:errors path="startDate" class="error" />
						<form:label for="startDate" path="startDate">Depart Date :</form:label>
						<input type="datetime-local" path="startDate" class="date" name="startDate"
							value="<fmt:formatDate value="${curentrental.startDate }" pattern="yyyy-MM-dd'T'HH:mm" />" />
							<p class="text-danger">${message}</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12 p-1">
					<div class="form-group">
						<form:errors path="endDate" class="error" />
						<form:label for="endDate" path="endDate">End Date :</form:label>
						<input   type="datetime-local" path="endDate" class="date" name="endDate"
							value="<fmt:formatDate value="${curentrental.endDate }" pattern="yyyy-MM-dd'T'HH:mm" />" />
							<p class="text-danger">${message}</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12 p-1">
					<div class="form-group">
						<form:errors path="totalCost" class="error" />
						<form:label for="totalCost" path="totalCost">Total In DT  :</form:label>
						<input   type="number" path="totalCost"  name="totalCost" value="${curentrental.totalCost }"
							 />

					</div>
				</div>
				</div>
				<div class="row">
				
				<div class="col-lg-4 col-md-6 col-12 p-1 ">
					<button type="submit" class="btn btn-warning">Confirm</button>
					
					
				</div>
				
				</div>
				
			</form:form>
		

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