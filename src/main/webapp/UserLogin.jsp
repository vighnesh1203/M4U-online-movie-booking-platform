<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="UserLog.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Login Page</title>
</head>
<body>
    <!-- <section class="vh-100 bg-image" -->
  <!-- style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');"> -->
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Login here</h2>

              <form action="UserLogin">
              <!-- :form action="UserLogin" method="post" modelAttribute="ULoginModel"> -->

                <div class="form-outline mb-4">
                  <input  id="form3Example3cg" class="form-control form-control-lg" name="emailId"/>
                  <label class="form-label" for="form3Example3cg" >Your Email</label>
                 <%--  <form:errors path="emailId" cssClass="error" /> --%>
                </div>

                <div class="form-outline mb-4">
                  <input  id="form3Example4cg" class="form-control form-control-lg" name="password"/>
                  <label class="form-label" for="form3Example4cg">Password</label>
                 <%--  <form:errors path="password" cssClass="error" /> --%>
                </div>


                <div class="d-flex justify-content-center">
                <button
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
                    <input type="submit" style="display:none;">
                    Login</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Don't have an account? <a href="UserRegistrationMap"
                    class="fw-bold text-body"><u>Register here</u></a></p>

               </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- </section> -->
</body>
</html>