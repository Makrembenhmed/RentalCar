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


		<h3>Upload Photo Of : ${car.brand} ${car.model} ${car.color}</h3>
		<hr>

		<form method="post" action="/upload/${car.id}"
			enctype="multipart/form-data">
			<div class="form-group">
				<input type="file" name="pic" class="form-control-file"
					id="inlineFormInput">
				<p class="text-danger">${message}</p>

			</div>
			
			<button class="btn btn-primary">Upload Picture</button>

		</form>
		<hr>
		<p>pics uploaded :</p>
		<div class="row">
			<c:forEach items="${car.carImages}" var="pic">
				<div class="col">
					
					<img src="${pic.imageUrl}" alt="..." height="400" width="300" />
				
				</div>

			</c:forEach>
		</div>
		
		<a href="/addCar" class="btn btn-warning"> Return </a>
	</div>

</body>
</html>