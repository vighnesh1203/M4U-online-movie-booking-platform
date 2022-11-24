<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="UserFrontPage.css">
<style>

</style>
<title>Movie Booking</title>
</head>
<body>
<nav>
        <a href="#" class="logo">
            <img src="images/logo.webp" >
        </a>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="MoviesCards">Movies</a></li>
            <li><a href="#">Cities</a>
            <div class="dropdown-menu">
						<c:forEach var="a" items="${LocationList}">
							<form action="locationSearch">
								<button>
									<input type="text" style="display: none" value="${a}"
										name="city">${a}</button>
							</form>
						</c:forEach>
			</div>
			</li>
        </ul>
        <div class="search">
        <form action="SearchMovie">
            <input type="text" placeholder="Search Movie">
            <button><img id="icon" src="images/mag.svg"></button>
        </form>
        </div>
        <!-- <div class="right_stuff"> -->
          <!--   <ul>-->
                
                <div class="action">
			<div class="profile" onclick="menuToggle();">
				<img src="images/dp.jpg" />
			</div>
			<div class="menu">
				<h3>
					Hii,${UserName}<br />
					<span></span>
				</h3>
				<ul>
					<li><a href="UserUpdateMap">Edit profile</a></li>
					<li><a href="MyOrderUser">My Order</a></li>
					<li><a href="LogOut">Logout</a></li>
				</ul>
			</div>
		</div>
           <!--  </ul>
        </div> -->
       
    </nav>
    <script>
            function menuToggle() {
              const toggleMenu = document.querySelector(".menu");
              toggleMenu.classList.toggle("active");
            }
          </script>
	<!-- <section class="top-bar">
		<div class="left-content">
			<h2 class="title">M4You</h2>
			<div class="navbar" id="nav">
				<a href="#" class="active">Home</a> <a href="MoviesCards">Movies</a>

				<div class="dropdown">
					<button class="btn">
						City <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-menu">
						<c:forEach var="a" items="${LocationList}">
							<form action="locationSearch">
								<button>
									<input type="text" style="display: none" value="${a}"
										name="city">${a}</button>
							</form>
						</c:forEach>

					</div>
				</div>
				<a href="javascript:void(0);" style="font-size: 15px;" class="icon"
					onclick="myFunction()">&#9776;</a>
			</div>
			<!-- search bar right align 
			<div class="search">
				<form action="SearchMovie">
					<input type="text" placeholder=" Search Movie,Theater"
						name="search">
					<button>
						<i class="fa fa-search" style="font-size: 18px;"></i>Search
					</button>
				</form>
			</div>
			<a id="login-button" ms-hide-element="true" href="LoginPage"
				class="button logout login w-button">Sign in/Login</a>

		</div>
		<div class="action">
			<div class="profile" onclick="menuToggle();">
				<img src="images/Profile-icon.jpg" />
			</div>
			<div class="menu">
				<h3>
					Hii,${UserName}<br />
					<span></span>
				</h3>
				<ul>
					<li><a href="UserUpdateMap">Edit profile</a></li>
					<li><a href="MyOrderUser">My Order</a></li>
					<li><a href="LogOut">Logout</a></li>
				</ul>
			</div>
		</div>
		<script>
            function menuToggle() {
              const toggleMenu = document.querySelector(".menu");
              toggleMenu.classList.toggle("active");
            }
          </script>
	</section> -->
	<section class="main-container">

		<!-- Movies container -->
		<!-- <h2 class="upcoming-movies">Upcoming Movies</h2> -->
		<div class="movies-container">
			<div class="slider-frame">
				<div class="slide-image">
					<div class="img-container">
						<img src="images/avengers.jpg">
					</div>
					<div class="img-container">
						<img src="images/Kgf2.jpg">
					</div>
					<div class="img-container">
						<img src="images/salaar-prabhas.jpg">
					</div>
				</div>
			</div>
		</div>
	</section>

	<h1 class="title-log">Now in Cinemas</h1>
	<div class="movies-list">
		<div class="card-container" >
			<c:forEach var="Movie" items="${MovieList}">
				<form action="MovieDetails">
					<div class="card" style="height: 400px; width: 350px;">
						<img src="${Movie.image}" class="card-img">
					</div>
					<button style="margin-left: 130px; margin-top: 10px;"
						class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
						<input type="text" style="display: none;" value="${Movie.movieId}"
							name="movieId"> <input type="submit"
							style="display: none;" value="Book Now"> Book Now
					</button>

				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>