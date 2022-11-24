<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" contentType="text/html; charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />

<!-- Custom CSS -->
<link rel="stylesheet" href="style.css" />

<title>To Admin Dashboard</title>

<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css" />
	<style>
	 .error{
	 color:red;
	 }
	</style>
</head>
<body>
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg navbar-light pt-1 pb-1 sticky-div shadow"
		style="background-color: #06283d">
		<div class="container-fluid pb-1" style="background-color: #06283d">
			<button class="open-sidebar bg-transparent border-0">
				<ion-icon name="menu-outline" class="text-white me-md-4 me-1 mt-2"></ion-icon>
			</button>
			<div class="mx-auto my-3" id="navbarSupportedContent"
				style="width: 800px">
				<form class="d-flex mx-auto mt-1 w-100 me-md-3">
					<input type="text" required
						class="form-control rounded-left border-0 fs-6"
						placeholder="Search a movie..." />
					<button type="submit"
						class="input-group-text rounded-right bg-white border-0"
						id="basic-addon2">
						<ion-icon size="large" name="search-outline" class="text-blue"></ion-icon>
					</button>
				</form>
			</div>
			<a class="text-white mt-2 fs-5" href="#"> <ion-icon size="large"
					name="person-circle-outline" class="text-white"></ion-icon>
			</a>
		</div>
	</nav>
	<!-- Add Movie Modal -->
	<div  id="addNewMovie">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>				
					<form action="updateMovie" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="modal-input-form d-flex">
							<div class="me-5">
								<h4 class="fw-600 mb-4 mt-0 pt-0">Enter Movie Details</h4>
								<div class="mb-3 d-flex">
									<label for="movie-name" class="form-label my-auto fw-500">Movie
										Name</label> <input type="text" class="form-control"
										name="movieName" id="movie-name" value="${movie.movieName}" placeholder="Enter name" />
								</div>
<%-- 								<form:errors class="form-control" path="movieName" cssClass="error" /> --%>
								<div class="mb-3 d-flex">
									<label for="movie-genre" class="form-label my-auto fw-500">Movie
										Genre</label><input type="text" class="form-control" value="${movie.genre}"
										name="genre" id="movie-genre" placeholder="Enter genre" />
										
								</div>
<%-- 								<form:errors path="genre" cssClass="error" /> --%>
								<div class="mb-3 d-flex">
									<label for="ticket-price" class="form-label my-auto fw-500">Languauge</label>
									<input type="text"  name="language"
										placeholder="Enter Language" class="form-control"
										id="ticket-price" value="${movie.language}"/>
										
								</div>
<%-- 								<form:errors path="language" cssClass="error" /> --%>
								<div class="mb-3 d-flex">
									<label for="release-date" class="form-label my-auto fw-500">Release
										Date</label> <input type="text"  class="form-control"
										name="releaseDate" id="release-date" value="${movie.releaseDate}"
										placeholder="Enter release date" />
										
										
								</div>
<%-- 								<form:errors path="releaseDate" cssClass="error" /> --%>
								<div class="mb-4 d-flex">
									<label for="image" class="form-label my-auto fw-500">Upload
										Movie Image</label> <input type="file" class="form-control"
										name="multipartFile" id="image" placeholder="Select Image" />
								</div> 
								<div class="mb-3 d-flex">
									<label for="ratings" class="form-label my-auto fw-500">Ratings</label>
									<input type="text" 
										name="rating" class="form-control" id="ratings"
										placeholder="Enter ratings" value="${movie.rating}" />
									
								</div>
<%-- 								<form:errors path="rating" cssClass="error" /> --%>
								<div class="mb-3 d-flex">
									<label for="ticket-price" class="form-label my-auto fw-500">Time
										Duration</label> <input type="text"
										placeholder="Enter Time Duration" class="form-control"
										name="timeDuration" id="ticket-price" value="${movie.timeDuration}" />
										
								</div>
<%-- 								<form:errors path="timeDuration" cssClass="error" /> --%>
								<div class="mb-3 d-flex">
									<label for="movie-des" class="form-label my-auto fw-500">Movie
										Description</label>
									<textarea name="description" 
										class="form-control" id="movie-des"
										placeholder="Enter description..." value="${movie.description}" ></textarea>
										
								</div>
<%-- 								<form:errors path="description" cssClass="error" /> --%>
							</div>
							<div class="me-5">
								<h4 class="fw-600 mb-4 mt-0 pt-0">Enter Cast Details</h4>
								<div class="mb-3 d-flex">
									<label for="actor-name" class="form-label my-auto fw-500">Actor
										Name</label> <input type="text"  class="form-control"
										name="leadActor" id="actor-name" placeholder="Enter name" value="${movie.leadActor}" />
										
								</div>
<%-- 								<form:errors path="leadActor" cssClass="error" /> --%>

								<div class="mb-3 d-flex">
									<label for="actor-name" class="form-label my-auto fw-500">Actress
										Name</label> <input type="text" class="form-control"
										name="leadActress" id="actress-name" placeholder="Enter name" value="${movie.leadActress}" />
										
								</div>
<%-- 								<form:errors  path="leadActress" cssClass="error" /> --%>

								<div class="mb-3 d-flex">
									<label for="co-actor-name" class="form-label my-auto fw-500">Co-Actor
										Name</label> <input type="text" class="form-control"
										name="coActor1" id="co-actor-name" placeholder="Enter name" value="${movie.coActor1}"/>
								</div>
<%-- 								<form:errors path="coActor1" cssClass="error" /> --%>

								<div class="mb-3 d-flex">
									<label for="support-actor-name"
										class="form-label my-auto fw-500">Support Actor Name</label> <input
										type="text" class="form-control" name="coActor2"
										id="support-actor-name" placeholder="Enter name" value="${movie.coActor2}"/>
										
								</div>
<%-- 								<form:errors path="coActor2" cssClass="error" /> --%>

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-success">Update</button>
					</div>
				</form>
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
