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


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">
							Administration </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/addCar" style="color: blue">Car
									Management</a></li>
							<li><a class="dropdown-item" href="#">Rental Management</a></li>
							<li><a class="dropdown-item" href="#">.... </a></li>
							<li><a class="dropdown-item" href="#">.... </a></li>
							<li><hr class="dropdown-divider"></li>
							<li style="background-color: red"><a class="dropdown-item" href="/logout">Logout</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active text-primary" 
						aria-current="page" href="/login">LogIn</a></li>
					<li class="nav-item"><a class="nav-link active text-danger" href="/logout">LogOut </a></li>
			</ul>
			</div>
		</div>
	</nav>


   
</body>
</html>