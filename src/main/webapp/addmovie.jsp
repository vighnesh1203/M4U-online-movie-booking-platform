<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />

<!-- Custom CSS -->
<link rel="stylesheet" href="style.css" />

<title>Add Movie</title>

<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css" />
</head>
<body class="blur">
	<nav id="sidebar" class="p-3 pe-0 shadow-lg">
		<div class="mt-1 mb-5 text-start">
			<p class="fw-600 fs-4 text-white">DashBoard</p>

			<button class="close-sidebar bg-transparent border-0">
				<ion-icon size="large" name="close" class="text-white me-3 mt-1"></ion-icon>
			</button>
		</div>

		<div class="links d-flex-flex-column align-items-center mt-1">
			<ul>
				<li class="fs-5 mb-3"><a href="/index1.jsp">
						<div class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg">
							<ion-icon size="large" name="home-outline" class="me-3"></ion-icon>
							<span>Home</span>
						</div>
				</a></li>
				</ul>
				</div>
				</nav>

	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-light pt-1 pb-1 sticky-div shadow"
		style="background-color: #06283d">
		<div class="container-fluid pb-1" style="background-color: #06283d">
			<button class="open-sidebar bg-transparent border-0">
				<ion-icon name="menu-outline" class="text-white me-md-4 me-1 mt-2"></ion-icon>
			</button>
			<a class="text-white mt-2 fs-5" href="#"> <ion-icon size="large"
					name="person-circle-outline" class="text-white"></ion-icon>
			</a>
		</div>
	</nav>


	<!-- Add Movie Modal -->
	<div id="addNewMovie">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form:form action="addMovie" modelAttribute="admov" method="post"
					enctype="multipart/form-data">
					<div class="modal-body">
						<div class="modal-input-form d-flex">
							<div class="me-5">
								<h4 class="fw-600 mb-4 mt-0 pt-0">Enter Movie Details</h4>
								<div class="mb-3 d-flex">
									<label for="movie-name" class="form-label my-auto fw-500">Movie
										Name</label>
									<form:input class="form-control" path="movieName" name="movieName"
										id="movie-name" placeholder="Enter name" />
								</div>
								<form:errors class="form-control" path="movieName"
									cssClass="text-danger" />
								<div class="mb-3 d-flex">
									<label for="movie-genre" class="form-label my-auto fw-500">Movie
										Genre</label>
									<form:input class="form-control" path="genre" name="genre" id="movie-genre"
										placeholder="Enter genre" />

								</div>
								<form:errors path="genre" cssClass="text-danger" />
								<div class="mb-3 d-flex">
									<label for="ticket-price" class="form-label my-auto fw-500">Languauge</label>
									<form:input path="language" name="language" placeholder="Enter Language"
										class="form-control" id="ticket-price" />

								</div>
								<form:errors path="language" cssClass="text-danger" />
								<div class="mb-3 d-flex">
									<label for="release-date" class="form-label my-auto fw-500">Release
										Date</label>
									<form:input class="form-control" path="releaseDate" name="releaseDate"
										id="release-date" placeholder="Enter release date" />


								</div>
								<form:errors path="releaseDate" cssClass="text-danger" />
								<div class="mb-3 d-flex">
									<label for="ratings" class="form-label my-auto fw-500">Ratings</label>
									<form:input  path="rating" name="rating" class="form-control" id="ratings"
										placeholder="Enter ratings" />

								</div>
								<form:errors path="rating" cssClass="text-danger" />
								
								<div class="mb-4 d-flex">
									<label for="image" class="form-label my-auto fw-500">Upload
										Movie Image</label> <input type="file" class="form-control"
										name="multipartFile" id="image" placeholder="Select Image" />
								</div>
								
								<div class="mb-3 d-flex">
									<label for="ticket-price" class="form-label my-auto fw-500">Time
										Duration</label>
									<form:input placeholder="Enter Time Duration"
										class="form-control" path="timeDuration" name="timeDuration" id="ticket-price" />

								</div>
								<form:errors path="timeDuration" cssClass="text-danger" />

								<div class="mb-3 d-flex">
									<label for="movie-des" class="form-label my-auto fw-500">Movie
										Description</label>
									<form:textarea path="description"  name="description" class="form-control"
										id="movie-des" placeholder="Enter description..."></form:textarea>

								</div>
								<form:errors path="description" cssClass="text-danger" />
							</div>
							<div class="me-5">
								<h4 class="fw-600 mb-4 mt-0 pt-0">Enter Cast Details</h4>
								<div class="mb-3 d-flex">
									<label for="actor-name" class="form-label my-auto fw-500">Actor
										Name</label>
									<form:input class="form-control" path="leadActor"  name="leadActor"
										id="actor-name" placeholder="Enter name" />

								</div>
								<form:errors path="leadActor" cssClass="text-danger" />

								<div class="mb-3 d-flex">
									<label for="actor-name" class="form-label my-auto fw-500">Actress
										Name</label>
									<form:input class="form-control" path="leadActress" name="leadActress"
										id="actress-name" placeholder="Enter name" />

								</div>
								<form:errors path="leadActress" cssClass="text-danger" />

								<div class="mb-3 d-flex">
									<label for="co-actor-name" class="form-label my-auto fw-500">Co-Actor
										Name</label>
									<form:input class="form-control" path="coActor1" name="coActor1"
										id="co-actor-name" placeholder="Enter name" />
								</div>
								<form:errors path="coActor1" cssClass="text-danger" />

								<div class="mb-3 d-flex">
									<label for="support-actor-name"
										class="form-label my-auto fw-500">Support Actor Name</label>
									<form:input class="form-control" path="coActor2" name="coActor2"
										id="support-actor-name" placeholder="Enter name" />

								</div>
								<form:errors path="coActor2" cssClass="text-danger"/>

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a href="index1.jsp" class="btn btn-secondary"
							data-bs-dismiss="modal">Go Back</a>
						<button type="submit" class="btn btn-success">Add Movie</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<!-- Icons Package -->
	<script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
	<script src="app.js"></script>
</body>
</html>
