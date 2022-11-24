<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CodePen - Movie Ticket</title>
<link
	href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="Ticket.css">

</head>
<body>
	<!-- partial:index.partial.html -->
	<!--
Inspired by: https://dribbble.com/shots/1166639-Movie-Ticket/attachments/152161
-->
	<a href="UserFrontPage">Home</a>
	<div class="ticket" style="height: 1000px;">
		<div class="holes-top"></div>
		<div class="title">
			<p class="cinema">${userDetails.theatreName}</p>
			<p class="movie-title">${userDetails.movieName }</p>
		</div>
		<div class="poster">
			<img style="width:400px;" src="${userDetails.image}" alt="Movie: Only God Forgives"  />
		</div>
		<div class="info">
			<table>
				<tr>
					<th>City</th>
					<th>Total Seat</th>
					<th>Seat Nos</th>
				</tr>
				<tr>
					<td class="bigger">${userDetails.theatreCity }</td>
					<td class="bigger">${userDetails.totalSeats}</td>
					<td class="bigger">
						<div style="display: inline-flex;">
							<c:forEach var="SeatNo" items="${userDetails.seatsList}">${SeatNo },
</c:forEach>
						</div>
					</td>

				</tr>
			</table>
			<table>
				<tr>
					<th>PRICE</th>
					<th>DATE</th>
					<th>TIME</th>
				</tr>
				<tr>
					<td>${userDetails.totalPrice}</td>
					<td>${userDetails.showDate}</td>
					<td>${userDetails.showTime}</td>
				</tr>
			</table>
		</div>
		<div class="holes-lower"></div>
		<div class="serial">
			<table class="barcode">
				<tr></tr>
			</table>
			<table class="numbers">
				<tr>
					<td>9</td>
					<td>1</td>
					<td>7</td>
					<td>3</td>
					<td>7</td>
					<td>5</td>
					<td>4</td>
					<td>4</td>
					<td>4</td>
					<td>5</td>
					<td>4</td>
					<td>1</td>
					<td>4</td>
					<td>7</td>
					<td>8</td>
					<td>7</td>
					<td>3</td>
					<td>4</td>
					<td>1</td>
					<td>4</td>
					<td>5</td>
					<td>2</td>
				</tr>
			</table>
		</div>
	</div>

	<!-- partial -->
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
	<script src="Ticket.js"></script>

</body>
</html>