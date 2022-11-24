<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Registration.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">\
    <style>
    .error
    {
    color:red;
    }
    </style>
    <title>Document</title>
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
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>

              <form:form action="UserRegistration" method="post" modelAttribute="URegistrationModel">

                <div class="form-outline mb-4">
                  <form:input  id="form3Example1cg" class="form-control form-control-lg" 
                  path="firstName" placeholder="First Name"/>
                 <!--  <label class="form-label" for="form3Example1cg">First Name</label> -->
                   <form:errors path="firstName" cssClass="error" />
                </div>

                <div class="form-outline mb-4">
                    <form:input  id="form3Example1cg" class="form-control form-control-lg" path="lastName"
                    placeholder="Last Name"/>
                   <!--  <label class="form-label" for="form3Example1cg">Last Name</label> -->
                     <form:errors path="lastName" cssClass="error" />
                  </div>
  

                <div class="form-outline mb-4">
                  <form:input  id="form3Example3cg" class="form-control form-control-lg" 
                  path="emailId"
                  placeholder="Email"/>
                 <!--  <label class="form-label" for="form3Example3cg">Your Email</label> -->
                   <form:errors path="emailId" cssClass="error" />
                </div>

                <div class="form-outline mb-4">
                  <form:input  id="form3Example4cdg" class="form-control form-control-lg" path="mobileNo" 
                  placeholder="Mobile Number"/>
                 <!--  <label class="form-label" for="form3Example4cdg">Mobile No</label> -->
                   <form:errors path="mobileNo" cssClass="error" />
                </div>

                <div class="form-outline mb-4">
                  <form:input id="form3Example4cg" class="form-control form-control-lg" path="password"
                  placeholder="Password"/>
                  <!-- <label class="form-label" for="form3Example4cg">Password</label> -->
                   <form:errors path="password" cssClass="error" />
                </div>


             <div class="d-flex justify-content-center">
                <button
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
                    <input type="submit" style="display:none;">
                    Register</button>
                </div>
                </form:form>
              
               <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="UserLogin.jsp"
                    class="fw-bold text-body"><u>Login here</u></a></p>
              

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- </section> -->
</body>
</html>