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
					<li class="nav-item"><a class="nav-link active" href="/addCar"
						style="color: blue">Car Management</a></li>
					<li class="nav-item"><a class="nav-link active" href="/admin/dashboard">Rental
							Management</a></li>





				</ul>
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active text-primary"
						aria-current="page" href="/login">LogIn</a></li>
					<li class="nav-item"><a class="nav-link active text-danger"
						href="/logout">LogOut </a></li>
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
					<c:forEach var="onebrand" items="${brands}">
					
					
						<a href="/admin/dashboard/brand/${onebrand}" class="list-group-item list-group-item-action">${onebrand}</a>
						
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="text-center m-2">


		<h5>List of Rentals</h5>




		<div class="text-center m-3 "
			style="background-color: #ffc107; color: aliceblue;">
			<h4>show All Current Rentals</h4>
		</div>


		<table class="table table-hover">
			<thead class="table-dark">
				<tr class="text-center">

					<th scope="col">Car</th>
					<th scope="col">Depart Of Rental</th>
					<th scope="col">End Of Rental</th>
					<th scope="col">Customer :</th>
					<th scope="col">

						<form name="form1" method="post"
							action="/editreservation/admin/{status}" class="d-flex">
							
							
							
							<label class="p-1 mb-1 bg-dark text-white">Status:</label>
							<select id="status" name="status" class="form-select bg-dark text-white"  >
								
								<option class=" text-white" value="CONFIRMED">CONFIRMED</option>
								<option value="COMPLETED">COMPLETED</option>
								<option value="CANCELED">CANCELED</option>
								<option value="INPROGRESS">INPROGRESS</option>
							</select>
							
							
							
							<input type="submit" name="Submit" value="Search"> <br>
							
							

						</form>
					</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="oneReservation" items="${rentals}">
					<tr
					
					<c:if test="${oneReservation.status == 'CONFIRMED' }"> class ="table-primary"</c:if>
				<c:if test="${oneReservation.status == 'CANCELED' }"> class ="table-danger"</c:if>
				<c:if test="${oneReservation.status == 'INPROGRESS' }"> class ="table-success"</c:if>
				<c:if test="${oneReservation.status == 'COMPLETED' }"> class ="table-secondary"</c:if>
				
					
					
					>


						<td><c:out value="${oneReservation.car.brand}  ${oneReservation.car.model}  ${oneReservation.car.color}" /></td>


						<td><c:out value="${oneReservation.startDate}" /></td>
						<td><c:out value="${oneReservation.endDate}" /></td>
						<td><c:out
								value="${oneReservation.customer.firstName} ${oneReservation.customer.lastName}" /></td>
						<td><c:out value="${oneReservation.status}" /></td>

						<td class="row"><a class="col text-center btn btn-link"
							href="/editreservation/admin/${oneReservation.id}">Concel</a> /
							<form
								onclick="if (!confirm('Etes-vous sûr de vouloir supprimer the rental car :${oneReservation.car.brand} ?')) return false"
								action="/reservation/${oneReservation.id}" method="post"
								class="col text-center btn-link ">

								<input type="hidden" name="_method" value="delete" /> <input
									type="Submit" value="Delete" />
							</form></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>
</body>
</html>