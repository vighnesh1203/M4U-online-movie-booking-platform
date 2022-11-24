<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <link rel="stylesheet" href="Payment.css">
    <title>Document</title>
</head>
<body>
    <div class='container'>
        <div class="card mx-auto col-md-5 col-8 mt-3 p-0">
            <img class='mx-auto pic'
                src="${Show.movie.image }"/>
            <div class="card-title d-flex px-4">
                <!-- <p class="item text-muted">Barcelona<label class="register">&reg;</label> Chair</p> -->
                <p>RS ${TotalPrice }</p>
            </div>
           
            <form action="Notification" name="payForm">
            <div class="card-body">
                <p class="text-muted">Your payment details</p>
                <div class="numbr mb-3">
                    <i class=" col-1 fas fa-credit-card text-muted p-0"></i>
                    <input class="col-10 p-0" type="text" placeholder="Card Number" required>
                </div>
                <div class="line2 col-lg-12 col-12 mb-4">
                    <i class="col-1 far fa-calendar-minus text-muted p-0"></i>
                    <input class="cal col-5 p-0" type="text" placeholder="MM/YY" required>
                    <i class="col-1 fas fa-lock text-muted"></i>
                    <input class="cvc col-5 p-0" type="text" placeholder="CVC" required>
                </div>
            </div>
            <div class="footer text-center p-0">
                <div class="col-lg-12 col-12 p-0">
                    <button type="button" class="btn btn-info" >
                    <input class="order" style="background-color:#17A2B8" type="submit" value="Book Now" >
                    </button>
                </div>
            </div>
            </form>
           
        </div>

    </div>
<!--     <script>
    function validatePayment()
    {
     let x = document.forms["payForm"]["CardNumber"].value;
     if (x == "") {
       alert("Name must be filled out");
       return false;
     }
    }
    </script> -->
</body>
</html>