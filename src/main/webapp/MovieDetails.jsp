<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
       body
      {
         background-color:aliceblue;
      }

    </style>
  </head>
  <body>
   <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg sticky-top" style="background-color:seashell;style="background-color:seashell;padding:30px 30px;>
  <div class="container-fluid" >
    <a class="navbar-brand" href="UserFrontPage" style="color:#cd8c38;font-family:'Cantata One', serif;"><h2>M4You</h2></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="padding-left: 20px;">
        <li class="nav-item" style="padding-left:15px;">
          <a class="nav-link active" style="font-size:25px;font-family:'Cantata One', serif;" aria-current="page" href="UserFrontPage">Home</a>
        </li>
         <li class="nav-item" style="padding-left:15px;padding-right: 250px;">
          <a class="nav-link active" style="font-size:25px;font-family:'Cantata One', serif;" aria-current="page" href="MoviesCards">Movie</a>
        </li>
        
      
           </div>
              <a class="navbar-brand" href="#"><img style="padding-left:10px;height:40px;width: 40px;"src="https://tse2.mm.bing.net/th?id=OIP.4VVwkQSlryrjuY89M4r_tgHaHa&pid=Api&P=0"></a>
          </div>

      </ul>
    </div>
  </div>
</nav>
<!-- NavBar End -->

       
        <!-- Movies container -->
        <!-- <h2 class="upcoming-movies">Upcoming Movies</h2> -->
<!-- Grid -->
<div style="border-radius: 5px;border:5px solid black;">
<div class="container ">

  <div class="row">

    <div class="col-4">
      <div class="card" style="width: 18rem; margin:10px 10px 10px;">
  <img src="${Movie.image }" class="card-img-top" alt="...">
  </div>
    </div>

    <div class="col-8 " style="text-align:left; margin-top: 20px;">
       <span ><h5>${Movie.movieName }</h5></span><br>
            <span ><h5>${Movie.timeDuration } </h5></span><br>
            <span ><h5>${Movie.language }</h5></span><br>
            <span ><h5>${Movie.genre }</h5></span><br>
            <span ><h5>${Movie.releaseDate } </h5></span><br>
            <form action="MovieShows">
            <button type="button" class="btn btn-info" style="background-color:black;color:white;">
            <input type="text"   style="display: none" value="${Movie.movieId}" name="movieId">
            <input class="btn" target="_parent" style="background-color:black;color:white; border:none;" type="submit" value="Book Ticket"></button>
          </form>
    </div>
  </div>
</div>
</div>
 <hr color="black">
    <div style="padding: 2% 2% 2% 2%;">
        <h3 style="color:black;">About The Movie</h3>
        <p style=" word-wrap: break-word;color:black;font-size:18px">
           ${Movie.description }
        </p>
    </div>

  <hr color="black">
  <h2 style="color:black ;padding: 2% 2% 2% 2%;">Cast</h2>
    <div style="display:grid; grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    grid-gap: 20px;
    align-items: stretch; padding-left: 20px;" >
       <h3>${Movie.leadActor } </h3>
       <h3>${Movie.leadActress }</h3>
       <h3>${Movie.coActor1 }</h3>
       <h3>${Movie.coActor2 }</h3>
    </div>



    <hr color="black">
    <div style="padding: 2% 2% 2% 2%;">
        <h3 style="color:black;">Review</h3>
        Reviews,
        ${Movie.rating}<br>
    </div>

    <!-- footer -->
<div style=" height: 50px; padding-top:10px;background-color:grey;text-align: center;">
  @copyright
  </div>


   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>    