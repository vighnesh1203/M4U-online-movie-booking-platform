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

<title>Three Admin Dashboard</title>

<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css" />
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
						placeholder="Search a theatre..." />
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

	<!-- Add Theatre Modal -->
	<div id="addNewTheatre">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-700">Enter Theatre Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="updateTheatre1" class="modal-input-form">
						<div class="mb-3 d-flex">
							<label for="theatre-name" class="form-label my-auto fw-500">Theatre
								Name</label> <input required type="text" class="form-control"
								name="theatreName" id="theatre-name" placeholder="Enter name" />
						</div>
						<div class="mb-3 d-flex">
							<label for="theatre-city" class="form-label my-auto fw-500">Add
								Theatre City</label> <input required type="text" class="form-control"
								name="theatreCity" id="theatre-city" placeholder="Enter city" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary d-inline-block"
								data-bs-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-success">Update
								Theatre</button>
						</div>
					</form>

				</div>
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
