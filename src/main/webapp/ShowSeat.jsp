<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="seat.js">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">

    <title>Book-ticket</title>
    <style>
body {
	background-color: aliceblue;
}
</style>
  </head>
  <body>
  

  <div class="content"> 
    
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-10">
          

          <div class="row justify-content-center">
            <div class="col-md-6">
              
              <h3 class="heading mb-4">Book Your Seats!</h3>
              <p>Pick Your Favourite Seats</p>

              <p><img src="images/seat_img.webp" alt="Image" class="img-fluid"></p>
              <div class="row">
                <div class="col-md-12 form-group">
                  <h4>Available Seats</h4>
                  <div class="form-control" style="height:100px;width:200px; "name="message" id="message" placeholder="Available Seats">
                  <c:forEach items="${list}" var="e" >
                  ${e},
                  </c:forEach>
                  </div>
                </div>
              </div> 

            </div>
            
            <div class="col-md-6">
                <div class="row">
                  <div class="col-md-12 form-group">
                    <input type="text" class="form-control" name="name" id="seatno" placeholder="Enter Your Seat no" >
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
                    <input type="submit" value="Add Seats" class="btn btn-primary rounded-0 py-2 px-4" onclick="add()">
                  <span class="submitting"></span>
                  </div>
                </div>
                <br>  
                <div class="row">
                  <div class="col-12">
                    <input type="submit" value="Back" class="btn btn-primary rounded-0 py-2 px-4" onclick="back()">
                  <span class="submitting"></span>
                  </div>
                </div>
                <br>
                <form action="checkSeats">
                <div class="row">
                  <div class="col-md-12 form-group">
                    <textarea class="form-control" name="message" id="seatlist" cols="25" rows="5" placeholder="Here you can see you entered seats"></textarea>
                  </div>
                </div>  
                <div class="row">
                  <div class="col-12">
                    <input type="submit" value="Book Your Tickets" class="btn btn-primary rounded-0 py-2 px-4">
                  <span class="submitting"></span>
                  </div>
                   </form>
                </div>
                <br>
                <!-- <div class="row">
                  <div class="col-md-12 form-group">
                    <textarea class="form-control" name="message" id="message" cols="30" rows="7" placeholder="Available Seats"></textarea>
                  </div>
                </div>  -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
    
     <!-- footer -->
<div style=" height: 50px; padding-top:10px;background-color:grey;text-align: center;">
  @copyright
  </div>
<script>
  function add()
{
//let row=document.getElementById("row").value;
let col=document.getElementById("seatno").value;
let no=Number(col);
document.getElementById("seatlist").innerHTML+=no+",";

}
function back()
{
//var marcards =
document.getElementById("seatno").innerHTML="";
//document.getElementById("row").innerHTML="";
document.getElementById("seatlist").innerHTML="";
 //   marcards.style.display =none;

//.getElementById("div").innerHTML-=no;
}
</script>

  </body>
</html>