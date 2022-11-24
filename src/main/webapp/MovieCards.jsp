<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Movies List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="MovieCards.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/dbed6b6114.js"
	crossorigin="anonymous"></script>
<style>
body {
	background-color: aliceblue;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg sticky-top"
		style="background-color: aliceblue; padding: 30px 30px;">
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
						style="font-size: 25px; font-family: 'Cantata One', serif; background-color: aliceblue;"
						aria-current="page" href="UserFrontPage">Home</a></li>
					<li class="nav-item"
						style="padding-left: 15px; padding-right: 250px;"><a
						class="nav-link active"
						style="font-size: 25px; font-family: 'Cantata One', serif; background-color: aliceblue"
						aria-current="page" href="MoviesCards">Movie</a></li>
			</div>
			<a class="navbar-brand" href="#"><img
				style="padding-left: 10px; height: 40px; width: 40px;"
				src="https://tse2.mm.bing.net/th?id=OIP.4VVwkQSlryrjuY89M4r_tgHaHa&pid=Api&P=0"></a>
		</div>

		</ul>
		</div>
		</div>
	</nav>
	<div class="main-container">
		<h2>Movies</h2>
		<div class="filter-container">
			<div class="category-head">
				<ul>
					<div class="category-title active" id="all">
						<li>All</li>
						<!-- <span><i class = "fas fa-border-all"></i></span> -->
					</div>
					<div class="category-title" id="Marathi">
						<li>Marathi</li>
						<!-- <span><i class = "fas fa-theater-masks"></i></span> -->
					</div>
					<div class="category-title" id="Hindi">
						<li>Hindi</li>
						<!-- <span><i class = "fas fa-landmark"></i></span> -->
					</div>
					<div class="category-title" id="English">
						<li>English</li>
						<!-- <span><i class = "fas fa-chart-area"></i></span> -->
					</div>
					<div class="category-title" id="Telagu">
						<li>Telugu</li>
						<!-- <span><i class = "fas fa-coins"></i></span> -->
					</div>
					<div class="category-title" id="Tamil">
						<li>Tamil</li>
						<!-- <span><i class = "fas fa-running"></i></span> -->
					</div>
				</ul>
			</div>

			<div class="posts-collect">
				<div class="posts-main-container">
					<!-- single post -->

					<c:forEach var="Telugu" items="${TeluguMovieList}">
						<div class="all Telagu">
							<div class="post-img">
								<img src="${Telugu.image}" alt="post"> <span
									class="category-name">${Telugu.genre}</span>
							</div>

							<div class="post-content">
								<div class="post-content-top">
									<span><i class="fas fa-calendar"></i>${Telugu.releaseDate }</span>

								</div>
								<h2>${Telugu.movieName }</h2>
							</div>

							<form action="MovieDetails">
								<input type="text" style="display: none;"
									value="${Telugu.movieId}" name="movieId"> <input
									type="submit" class="read-btn" value="Book ">
							</form>

						</div>
					</c:forEach>

					<!-- end of single post -->

					<!-- single post -->
					<c:forEach var="Marathi" items="${MarathiMovieList}">
						<div class="all Marathi">
							<div class="post-img">
								<img src="${Marathi.image }" alt="post"> <span
									class="category-name">${Marathi.genre}</span>
							</div>

							<div class="post-content">
								<div class="post-content-top">
									<span><i class="fas fa-calendar"></i>${Marathi.releaseDate }</span>

								</div>
								<h2>${Marathi.movieName }</h2>
							</div>

							<form action="MovieDetails">
								<input type="text" style="display: none;"
									value="${Marathi.movieId}" name="movieId"> <input
									type="submit" class="read-btn" value="Book ">
							</form>


						</div>
					</c:forEach>
					<!-- end of single post -->

					<!-- single post -->
					<c:forEach var="English" items="${EnglishMovieList}">
						<div class="all English">
							<div class="post-img">
								<img src="${English.image }" alt="post"> <span
									class="category-name">${English.genre}</span>
							</div>

							<div class="post-content">
								<div class="post-content-top">
									<span><i class="fas fa-calendar"></i>${English.releaseDate }</span>

								</div>
								<h2>${English.movieName }</h2>
							</div>

							<form action="MovieDetails">
								<input type="text" style="display: none;"
									value="${English.movieId}" name="movieId"> <input
									type="submit" class="read-btn" value="Book ">
							</form>

						</div>
					</c:forEach>
					<!-- end of single post -->

					<!-- single post -->
					<c:forEach var="Hindi" items="${HindiMovieList}">
						<div class="all Hindi">
							<div class="post-img">
								<img src="${Hindi.image }" alt="post"> <span
									class="category-name">${Hindi.genre}</span>
							</div>

							<div class="post-content">
								<div class="post-content-top">
									<span><i class="fas fa-calendar"></i>${Hindi.releaseDate }</span>
								</div>
								<h2>${Hindi.movieName }</h2>
							</div>

							<form action="MovieDetails">
								<input type="text" style="display: none;"
									value="${Hindi.movieId}" name="movieId"> <input
									type="submit" class="read-btn" value="Book ">
							</form>

						</div>
					</c:forEach>
					<!-- end of single post -->

					<!-- single post -->
					<c:forEach var="Tamil" items="${TamilMovieList}">
						<div class="all Tamil">
							<div class="post-img">
								<img src="${Tamil.image }" alt="post"> <span
									class="category-name">${Tamil.genre}</span>
							</div>

							<div class="post-content">
								<div class="post-content-top">
									<span><i class="fas fa-calendar"></i>${Tamil.releaseDate }</span>

								</div>
								<h2>${Tamil.movieName }</h2>
							</div>
							<form action="MovieDetails">
								<input type="text" style="display: none;"
									value="${Tamil.movieId}" name="movieId"> <input
									type="submit" class="read-btn" value="Book ">
							</form>
						</div>
					</c:forEach>
					<!-- end of single post -->
					<!-- single post -->
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<div
		style="height: 50px; padding-top: 10px; background-color: grey; text-align: center;">
		@copyright</div>
	<!-- JS file -->
	<script src="MovieCards.js"></script>
</body>
</html>