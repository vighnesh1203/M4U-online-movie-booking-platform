<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
<!-- Grid -->
<div style="border-radius: 5px;border:5px solid black;">
<div class="container ">
<c:forEach var="a" items="${booklist}">
  <div class="row">

    <div class="col-4">
      <div class="card" style="width: 18rem; margin:10px 10px 10px;">
  <img src="${a.image}" class="card-img-top" alt="...">
  </div>
    </div>

    <div class="col-8 " style="text-align:left; margin-top: 20px;">
       <span ><h6>Movie Name :${a.movieName }</h6></span><br>
            <span ><h6>Show Date :${a.showDate }</h6></span><br>
            <span ><h6>Show Time :${a.showTime }</h6></span><br>
            <span ><h6>Theatre Name :${a.theatreName }</h6></span><br>
            <span ><h6>Theatre City :${a.theatreCity }</h6></span><br>
            <span ><h6>Total Seats :${a.totalSeats }</h6></span><br>
            <span ><h6>Total Price :${a.totalPrice }</h6></span><br>
            <span><h6>Seat nos :</h6><c:forEach var="s" items="${a.seatsList }">
								<h6>${s}</h6>
			</c:forEach></span>
    </div>
  </div>
  </c:forEach>
</div>
</div>
<h3></h3>

</body>
</html>