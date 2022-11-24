<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="ShowListUser.css" />
<title>BookMyShow - Book Tickets on the Fly</title>
<style>
body {
	background-color: aliceblue;
}
</style>
</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg sticky-top"
		style="background-color: seashell;style="background-color:seashell;padding:30px 30px;>
		<div class="container-fluid">
			<a class="navbar-brand" href="UserFrontPage"
				style="color: #cd8c38; font-family: 'Cantata One', serif;"><h2>M4You</h2></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0"
					style="padding-left: 20px;">
					<li class="nav-item" style="padding-left: 15px;"><a
						class="nav-link active"
						style="font-size: 25px; font-family: 'Cantata One', serif;"
						aria-current="page" href="UserFrontPage">Home</a></li>
					<li class="nav-item"
						style="padding-left: 15px; padding-right: 250px;"><a
						class="nav-link active"
						style="font-size: 25px; font-family: 'Cantata One', serif;"
						aria-current="page" href="MMoviesCards">Movie</a></li>
			</div>
			<a class="navbar-brand" href="#"><img
				style="padding-left: 10px; height: 40px; width: 40px;"
				src="https://tse2.mm.bing.net/th?id=OIP.4VVwkQSlryrjuY89M4r_tgHaHa&pid=Api&P=0"></a>
		</div>

		</ul>
		</div>
		</div>
	</nav>
	<!-- NavBar End -->
	<main class="container">
		<form action="filterByDate">
			<div class="bg-white flex-between">
				<div class="movie-date flex-between" style="margin-left: 190px;">
					<label for="movie-date" class="date-name"
						style="margin-right: 20px;"><h5>Select
							Date</h5></label> <input type="text" id="movie-date"
						style="margin-right: 20px;" name="movie-date"
						placeholder="yyyy/mm/dd" /> <input
						style="width: 40px; background-color: black; color: white; margin-right: 20px;"
						type="submit" value="Ok">
				</div>
			</div>
		</form>
	</main>



	<div class="bg-light-white p-lg">
		<div class="container">

			<c:forEach var="Show" items="${ShowsList}">
				<div class="theatre flex-between bg-white p-lg">
					<div class="theatre-name me-3">
						<a href="#" class="fw-500 text-dark">${Show.theatre.theatreName }</a>
						<br> <a href="#" class="fw-500 text-dark">${Show.theatre. theatreCity}</a>
						<br> <a href="#" class="fw-500 text-dark"
							style="color: green;">${Show.showDate}</a> <br>
						<div class="mt-3 flex-start">
							<div class="flex-around me-4">
								<ion-icon name="ticket-outline" class="green me-2"></ion-icon>
								<small class="green">M-Ticket</small>
							</div>
							<div class="flex-center">
								<ion-icon name="fast-food-outline" class="pink me-2"></ion-icon>
								<small class="pink">Food & Beverage</small>
							</div>
						</div>
					</div>
					<div class="theatre-timings">
						<form action="availableSeats"
							class="timing rounded-1 flex-center me-3 active">
							<button type="button" class="btn btn-info"
								style="background-color: #32E0C4; border: none;">
								<input type="text" style="display: none;" value="${Show.shId}"
									name="showId"> <input type="submit"
									style="background-color: #32E0C4; border: none;" class="fw-500"
									value="${Show.shTime }">
							</button>
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- footer -->
	<div
		style="height: 50px; padding-top: 10px; background-color: grey; text-align: center;">
		@copyright</div>
	<!-- Ion Icons -->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<script src="app.js"></script>
</body>
</html>