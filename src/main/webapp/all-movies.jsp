<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>Update/Delete Movies</title>

<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css" />
</head>
<body>
	<!-- Sidebar -->
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
				<li class="fs-5 mb-3"><a href="addShow" data-bs-toggle="modal"
					data-bs-target="#addNewShow">
						<div class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg">
							<ion-icon size="large" name="add-circle-outline" class="me-3"></ion-icon>
							<span>Add New Show</span>
						</div>
				</a></li>
				<li class="fs-5 mb-3"><a href="showList2">
						<div class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg">
							<ion-icon size="large" name="play-outline" class="me-3"></ion-icon>
							<span>View All Shows</span>
						</div>
				</a></li>
				<li class="fs-5 mb-3"><a href="addMovie" data-bs-toggle="modal"
					data-bs-target="#addNewMovie">
						<div class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg">
							<ion-icon size="large" name="cloud-upload-outline" class="me-3"></ion-icon>
							<span>Upload New Movie</span>
						</div>
				</a></li>
				<li class="fs-5 mb-3"><a href="MovieList">
						<div
							class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg active">
							<ion-icon size="large" name="videocam-outline" class="me-3"></ion-icon>
							<span>View All Movies</span>
						</div>
				</a></li>
				<li class="fs-5 mb-3"><a href="addTheatre"
					data-bs-toggle="modal" data-bs-target="#addNewTheatre">
						<div class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg">
							<ion-icon size="large" name="add-circle-outline" class="me-3"></ion-icon>
							<span>Add New Theatre</span>
						</div>
				</a></li>
				<li class="fs-5 mb-3"><a href="TheatreList1">
						<div class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg">
							<ion-icon size="large" name="albums-outline" class="me-3"></ion-icon>
							<span>View All Theatre</span>
						</div>
				</a></li>
				<li class="fs-5 mb-3"><a href="/index.html">
						<div class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg">
							<ion-icon size="large" name="log-out-outline" class="me-3"></ion-icon>
							<span>Logout</span>
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

	<!-- Main content -->
	<section id="all-movies" class="mh-80 my-5 bg-light">
		<div class="p-5">
			<h2 class="display-5 fw-600 text-center mt-3">Movies List</h2>
			<div class="movies-list my-4">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Image</th>
								<th scope="col">Movie Name</th>
								<th scope="col">Genre</th>
								<th scope="col">Release Date</th>
								<th scope="col">Duration</th>
								<th scope="col">Rating</th>
								<th scope="col">Language</th>
								<th scope="col">Actor</th>
								<th scope="col">Actress</th>
								<th scope="col">CoActor 1</th>
								<th scope="col">CoActor 2</th>
								<th scope="col">Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="a" items="${list}">
								<tr>
									<th scope="row"><img src="${a.image }" alt="iMAGE"
										class="table-img img-fluid" /></th>
									<td>${a.movieName}</td>
									<td>${a.genre }</td>
									<td>${a.releaseDate}</td>
									<td>${a.timeDuration}</td>
									<td>${a.rating}</td>
									<td>${a.language}</td>
									<td>${a.leadActor}</td>
									<td>${a.leadActress}</td>
									<td>${a.coActor1}</td>
									<td>${a.coActor2}</td>
									<td>
										<div class="d-flex align-items-center justify-content-center">
											<form action="updateMovieMapping"><input type="text" value="${a.movieId}" style="display:none" name="movieId"><button type="submit" class="btn btn-warning fw-700 text-white me-4">
											Update</button>
												 </form> 
												<form action="deleteMovieMapping"><input type="text" value="${a.movieId}" style="display:none" name="movieId"><button type="submit" class="btn btn-danger fw-700 text-white"> 
												Delete</button></form> 
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>

	

	

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
