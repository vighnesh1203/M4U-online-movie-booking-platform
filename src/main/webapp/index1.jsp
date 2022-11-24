<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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

<title>Admin Dashboard</title>

<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css" />
</head>
<body class="blur">
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
				<li class="fs-5 mb-3"><a href="index1.html">
						<div
							class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg active">
							<ion-icon size="large" name="home-outline" class="me-3"></ion-icon>
							<span>Home</span>
						</div>
				</a></li>
				<li class="fs-5 mb-3"><a href="showList2">
						<div class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg">
							<ion-icon size="large" name="play-outline" class="me-3"></ion-icon>
							<span>Shows</span>
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
						<div class="d-flex flex-start w-100 fw-500 p-1 rounded-left-lg">
							<ion-icon size="large" name="videocam-outline" class="me-3"></ion-icon>
							<span>View All Movies</span>
						</div>
				</a>  </li>
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
				<li class="fs-5 mb-3"><a href="index.html">
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
			<a class="text-white mt-2 fs-5" href="#"> <ion-icon size="large"
					name="person-circle-outline" class="text-white"></ion-icon>
			</a>
		</div>
	</nav>

	<!-- Home Page content -->
	<main class="mh-80 d-flex align-items-center justify-content-center">
		<section id="main" class="m-3">
			<div class="container p-5 bg-light shadow rounded-2">
				<h2 class="display-5 fw-600 text-center">Welcome Admin</h2>

				<h3 class="fw-500 wt text-start mt-5">Movie Actions</h3>
				<div class="linksd-flex mt-3">
					<button
						class="btn btn-success shadow-sm text-white fw-700 fs-5 me-3 hov-trans"
						data-bs-toggle="modal" data-bs-target="#addNewMovie">
						 New Movie</button>
					<a href="MovieList"
						class="btn btn-info shadow-sm text-white fw-700 fs-5 me-3 hov-trans">View
						Movie List</a>
				</div>
				<h3 class="fw-500 wt text-start mt-5">Theatre Actions</h3>
				<div class="linksd-flex mt-3">
					<button
						class="btn btn-success shadow-sm text-white fw-700 fs-5 me-3 hov-trans"
						data-bs-toggle="modal" data-bs-target="#addNewTheatre">
						Add New Theatre</button>
					<a href="TheatreList1"
						class="btn btn-info shadow-sm text-white fw-700 fs-5 me-3 hov-trans">View
						Theatre List</a>
					
				</div>
				<h3 class="fw-500 wt text-start mt-5">Show Actions</h3>
				<div class="linksd-flex mt-3">
				
					<button 
						class="btn btn-success shadow-sm text-white fw-700 fs-5 me-3 hov-trans"
						data-bs-toggle="modal" data-bs-target="#addNewShow">Add
						New Show</button>
					<a href="showList2"
						class="btn btn-info shadow-sm text-white fw-700 fs-5 me-3 hov-trans">View
						Show List</a> 
				</div>
			</div>
		</section>
	</main>

	<!-- Add Movie Modal -->
	<div class="modal fade" id="addNewMovie">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="addMovie" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="modal-input-form d-flex">
							<div class="me-5">
								<h4 class="fw-600 mb-4 mt-0 pt-0">Enter Movie Details</h4>
								<div class="mb-3 d-flex">
									<label for="movie-name" class="form-label my-auto fw-500">Movie
										Name</label> <input class="form-control"
										name="movieName" id="movie-name" placeholder="Enter name" />
								</div>
								<div class="mb-3 d-flex">
									<label for="movie-genre" class="form-label my-auto fw-500">Movie
										Genre</label> <input required type="text" class="form-control"
										name="genre" id="movie-genre" placeholder="Enter genre" />
								</div>
								<div class="mb-3 d-flex">
									<label for="ticket-price" class="form-label my-auto fw-500">Languauge</label>
									<input required type="text" min="1" step="any" name="language"
										placeholder="Enter Language" class="form-control"
										id="ticket-price" />
								</div>
								<div class="mb-3 d-flex">
									<label for="release-date" class="form-label my-auto fw-500">Release
										Date</label> <input required type="text" class="form-control"
										name="releaseDate" id="release-date"
										placeholder="Enter release date" />
								</div>
								<div class="mb-3 d-flex">
									<label for="ratings" class="form-label my-auto fw-500">Ratings</label>
									<input required type="number" min="1" max="5" step="any"
										name="rating" class="form-control" id="ratings"
										placeholder="Enter ratings" />
								</div>
								<div class="mb-4 d-flex">
									<label for="image" class="form-label my-auto fw-500">Upload
										Movie Image</label> <input required type="file" class="form-control"
										name="multipartFile" id="image" placeholder="Select Image" />
								</div>
								<div class="mb-3 d-flex">
									<label for="ticket-price" class="form-label my-auto fw-500">Time
										Duration</label> <input required type="text" min="1" step="any"
										placeholder="Enter Time Duration" class="form-control"
										name="timeDuration" id="ticket-price" />
								</div>
								<div class="mb-3 d-flex">
									<label for="movie-des" class="form-label my-auto fw-500">Movie
										Description</label>
									<textarea name="description" required type="text"
										class="form-control" id="movie-des"
										placeholder="Enter description..."></textarea>
								</div>
							</div>
							<div class="me-5">
								<h4 class="fw-600 mb-4 mt-0 pt-0">Enter Cast Details</h4>
								<div class="mb-3 d-flex">
									<label for="actor-name" class="form-label my-auto fw-500">Actor
										Name</label> <input required type="text" class="form-control"
										name="leadActor" id="actor-name" placeholder="Enter name" />
								</div>

								<div class="mb-3 d-flex">
									<label for="actor-name" class="form-label my-auto fw-500">Actress
										Name</label> <input required type="text" class="form-control"
										name="leadActress" id="actress-name" placeholder="Enter name" />
								</div>

								<div class="mb-3 d-flex">
									<label for="co-actor-name" class="form-label my-auto fw-500">Co-Actor
										Name</label> <input required type="text" class="form-control"
										name="coActor1" id="co-actor-name" placeholder="Enter name" />
								</div>

								<div class="mb-3 d-flex">
									<label for="support-actor-name"
										class="form-label my-auto fw-500">Support Actor Name</label> <input
										required type="text" class="form-control" name="coActor2"
										id="support-actor-name" placeholder="Enter name" />
								</div>

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-success">Add Movie</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Add Theatre Modal -->
	<div class="modal fade" id="addNewTheatre">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fw-700">Enter Theatre Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="addTheatre" class="modal-input-form">
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
							<button type="submit" class="btn btn-success">Add
								Theatre</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Add new Show Modal -->
	 <div class="modal fade" id="addNewShow">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title fw-700">Enter Show Details</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form action="addShow" class="modal-input-form">
              <div class="mb-3 d-flex">
                <label for="show-name" class="form-label my-auto fw-500"
                  >Movie Name</label
                >
                <input
                  required
                  type="text"
                  class="form-control"
                  id="show-name"
                  name="movieName"
                  placeholder="Enter name"
                />
              </div>
              <div class="mb-3 d-flex">
                <label for="theatreCity" class="form-label my-auto fw-500"
                  >Select Theatre City</label>
                <select class="form-control" name="theatreCity" id="theatreCity">
    				<option  class="form-control" value="" selected="selected">Select City</option>
 				 </select>
              </div>
              <div class="mb-3 d-flex">
                <label  class="form-label my-auto fw-500"
                  >Select Theatre </label
                >
                <select class="form-control" name="theatreName" id="theatreName">
    <option  class="form-control" value="" selected="selected">Select Theatre</option>
  </select>
              </div>
              <div class="mb-3 d-flex">
                <label for="show-timings" class="form-label my-auto fw-500"
                  >Show Date </label
                >
                <input
                  required
                  type="text"
                  name="showDate"
                  class="form-control"
                  id="show-timings"
                  placeholder="Enter show Date"
                  value="2022/01/01"
                />
              </div>
              <div class="mb-3 d-flex">
                <label for="show-timings" class="form-label my-auto fw-500"
                  >Show Time </label
                >
                <input
                  required
                  type="text"
                  name="showTime"
                  class="form-control"
                  id="show-timings"
                  placeholder="Enter show timings"
                />
              </div>
              <div class="mb-3 d-flex">
                <label for="show-price" class="form-label my-auto fw-500"
                  >Show Price</label
                >
                <input
                  required
                  type="number"
                  min="0"
                  class="form-control"
                  name="costOfTicket"
                  id="show-price"
                  placeholder="Enter show price"
                />
              </div>
              <div class="modal-footer">
                <button
                  type="button"
                  class="btn btn-secondary d-inline-block"
                  data-bs-dismiss="modal"
                >
                  Cancel
                </button>
                <button type="submit" class="btn btn-success">Add Show</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
	<script>
		var theatrecitymap = {
		<c:forEach var="entry" items="${citymap}">
		    '${entry.key}': [<c:forEach var="e" items="${entry.value}">'${e}',</c:forEach>],
		</c:forEach>
		}		
		window.onload = function() {
  		var tCity = document.getElementById("theatreCity");
  		var tName = document.getElementById("theatreName");
  		for (var x in theatrecitymap) {
   			 tCity.options[tCity.options.length] = new Option(x, x);
  		}
  		tCity.onchange = function() {
    	tName.length = 1;
    	for (var y in theatrecitymap[this.value]) {
      	tName.options[tName.options.length] = new Option(theatrecitymap[this.value][y], theatrecitymap[this.value][y]);
    }
  }
}
</script>

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
