<%@page import="org.w3c.dom.stylesheets.StyleSheet"%>
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


	<div class="text-center m-3 "
		style="background-color: #ffc107; color: aliceblue;"><h4>Welcome ${user.firstName } show All your Current Rentals </h4></div>


	<table class="table table-striped table-hover">
		<thead class="table-dark">
			<tr>
				
				<th scope="col">Car</th>		
				
				<th scope="col">Depart Of Rental</th>
				<th scope="col">End Of Rental</th>
				<th scope="col">Amount DT :</th>
				<th scope="col">Status :</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="oneReservation" items="${reserbyuser}">
				<tr 
				<c:if test="${oneReservation.status == 'CONFIRMED' }"> class ="table-primary"</c:if>
				<c:if test="${oneReservation.status == 'CANCELED' }"> class ="table-danger"</c:if>
				<c:if test="${oneReservation.status == 'INPROGRESS' }"> class ="table-success"</c:if>
				<c:if test="${oneReservation.status == 'COMPLETED' }"> class ="table-sECONDARY"</c:if>
				
				
				
				>
			
					
					<td><c:out value="${oneReservation.car.brand}${oneReservation.car.model}${oneReservation.car.color}" /></td>
					
					
					<td><c:out value="${oneReservation.startDate}" /></td>
					<td><c:out value="${oneReservation.endDate}" /></td>
					<td><c:out value="${oneReservation.totalCost}" /></td>
					<td><c:out value="${oneReservation.status}" /></td>
					
					<td >
					<c:if test="${oneReservation.status == 'CONFIRMED'}">
					<div class="row">
					<a class="col text-center"
						href="/editreservation/${oneReservation.id}">Edit</a> / 
						<form
							onclick="if (!confirm('Etes-vous sûr de vouloir supprimer the rental car :${oneReservation.car.brand} ?')) return false"
							action="/reservation/${oneReservation.id}" method="post" class="col text-center" >

						<input type="hidden" name="_method" value="delete" /> <input
						type="Submit" value="Delete" />
					</form>
					</div>
					
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

   
</body>
</html>