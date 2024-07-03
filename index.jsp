<!-- Index.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">

 <link rel="stylesheet" href="css/bootstrap.min.css">

 <link rel="stylesheet" href="css/all.min.css">

 <link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">

 <link rel="stylesheet" href="css/custom.css">

 <title>SMS</title>
</head>
<body>
 <nav class="navbar navbar-expand-sm navbar-dark bg-danger pl-5 fixed-top">
  <a href="index.jsp" class="navbar-brand">SMS</a>
  <span class="navbar-text ">Happiness is our Aim</span>
  <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myMenu">
   <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="myMenu">
   <ul class="navbar-nav pl-5 custom-nav">
    <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
    <li class="nav-item"><a href="#SMS" class="nav-link">SMS</a></li>
    <li class="nav-item"><a href="#registration" class="nav-link">Registration</a></li>
    <li class="nav-item"><a href="Requester/RequesterLogin.jsp" class="nav-link">Login</a></li>
    <li class="nav-item"><a href="#Contact" class="nav-link">Contact</a></li>
   </ul>
  </div>
 </nav>

 <header   style="display:flex;
 flex-wrap:wrap;
 min-height:70vh;
 align-item:center;
 background-repeat:no-repeat;
 background-size:cover;
 backgroud-position:center;
 background-image:url(images/Banner.png);">
  <div class="myclass mainHeading"  style="padding-left:20px;">
     <h1 class="text-uppercase text-danger font-weight-bold" style="color:black; font-size:50px;padding-top:15vh;">Welcome to SMS</h1>
  <p class="font-italic" style="color:orange; font-size:40px;">Customer's Happiness is our Aim</p>
   <p class="font-italic" style="color:black; font-size:30px;">Customer login and signup</p>
   <a href="Requester/RequesterLogin.jsp" class="btn btn-success mr-4">Login</a>
   <a href="#registration" class="btn btn-danger mr-4">Sign Up</a>
  </div>
 </header>
 
  <div  style="padding: 10px;
	text-align:center;
	margin: 10px;">
     <h6 class="text-uppercase text-fried font-weight-bold" style="font-size:30px;">Technician section</h6>
   <p class="font-italic" style="color:white;">Agent login section</p>
   <a href="technician/technician-login.jsp" class="btn btn-success mr-4">Login</a>
   <a href="technician/Technician-signup.jsp" class="btn btn-danger mr-4">Sign Up</a>
  </div>


 <div class="container">
  <div class="jumbotron">
   <h3 class="text-center">SMS Goal</h3>
   <p>
    SMS(Service management service)online is India's leading chain of multi-brand Electronics and Electrical SMS workshops offering wide array of services. We focus on enhancing your uses experience by offering world-class Electronic Appliances maintenance serviec. Our sole mission is “To provide Electronic Appliances care SMS to keep the devices fit and healthy and customers happy and smiling”.
    
    With well-equipped Electronic Appliances SMS centres and fully trained mechanics, we provide quality services with excellent packages that are designed to offer you great savings.
    
    Our state-of-art workshops are conveniently located in many
    cities across the country. Now you can book your SMS online by doing Registration.    
   </p>
  </div>
 </div>
 <div class="container text-center border-bottom" id="SMS">
  <h2>Our services</h2>
  <div class="row mt-4">
   <div class="col-sm-4 mb-4">
    <a href="#"><i class="fas fa-tv fa-8x text-success"></i></a>
    <h4 class="mt-4">Electronic Appliances</h4>
   </div>
   <div class="col-sm-4 mb-4">
    <a href="#"><i class="fas fa-sliders-h fa-8x text-primary"></i></a>
    <h4 class="mt-4">Preventive Maintenance</h4>
   </div>
   <div class="col-sm-4 mb-4">
    <a href="#"><i class="fas fa-cogs fa-8x text-info"></i></a>
    <h4 class="mt-4">Fault Repair</h4>
   </div>
  </div>
</div>

 <!-- Start Registration Form -->
 <%@ include file="UserRegistration.jsp" %>
 <!-- End Registration Form Container -->

 <!-- Start Happy Customer -->
 <div class="jumbotron bg-danger">
   <div class="container">
    <h2 class="text-center text-white">Happy Customers</h2>
    <div class="row mt-5">
     <div class="col-lg-3 col-sm-6"> <!-- Start 1st Column -->
      <div class="card shadow-lg mb-2">
       <div class="card-body text-center">
        <img src="images/avtar1.jpeg" class="img-fluid" style="border-radius:100px;" alt="avt1">
        <h4 class="card-title">Rahul Kumar</h4>
        <p class="card-text">Excellent Service Good job SMS</p>
       </div>
      </div>
     </div> <!-- End 1st Column -->
     <div class="col-lg-3 col-sm-6"> <!-- Start 2nd Column -->
      <div class="card shadow-lg mb-2">
       <div class="card-body text-center">
        <img src="images/avtar2.jpeg" class="img-fluid" style="border-radius:100px;" alt="avt2">
        <h4 class="card-title">Sonam Sharma</h4>
        <p class="card-text">Excellent Service Good job SMS</p>
       </div>
      </div>
     </div> <!-- End 2nd Column -->
     <div class="col-lg-3 col-sm-6"> <!-- Start 3rd Column -->
      <div class="card shadow-lg mb-2">
       <div class="card-body text-center">
        <img src="images/avtar3.jpeg" class="img-fluid" style="border-radius:100px;" alt="avt3">
        <h4 class="card-title">Sumit Vyas</h4>
        <p class="card-text">Excellent Service Good job SMS</p>
       </div>
      </div>
     </div> <!-- End 3rd Column -->
     <div class="col-lg-3 col-sm-6"> <!-- Start 4th Column -->
      <div class="card shadow-lg mb-2">
       <div class="card-body text-center">
        <img src="images/avtar4.jpeg" class="img-fluid" style="border-radius:100px;" alt="avt4">
        <h4 class="card-title">Jyoti Sinha</h4>
        <p class="card-text">Excellent Service Good job SMS</p>
       </div>
      </div>
     </div> <!-- End 4th Column -->
    </div>
   </div>
 </div> <!-- End Happy Customer -->

 <!-- Start Contact US -->
 <div class="container" id="Contact">
  <h2 class="text-center mb-4">Contact Us</h2>
  <div class="row">
   <!-- Start 1st Column -->
    <%@ include file="contactform.jsp" %>
   <!-- End 1st Column -->
   <div class="col-md-4 text-center"> <!-- Start 2nd Column -->
    <strong>Branch</strong><br>
    Hatia Park,<br>
    West Sagarpur, delhi<br>
    Phone: +869585949<br>
    <a href="#" target="_blank">www.SMS.com</a><br>
    <br> <br>
    <strong>Branch:</strong><br>
    Hatia Park,<br>
    West Sagarpur, delhi<br>
    Phone: +567657656<br>
    <a href="#" target="_blank">www.SMS.com</a><br>    
   </div>
  </div>
 </div>

 <footer class="container-fluid bg-dark mt-5 text-white">
  <div class="container">
   <div class="row py-3">
    <div class="col-md-6">
     <span class="pr-2">Follow Us: </span>
     <a href="#" target="_blank" class="pr-2 fi-color"><i class="fab fa-facebook-f"></i></a>
     <a href="#" target="_blank" class="pr-2 fi-color"><i class="fab fa-twitter"></i></a>
     <a href="#" target="_blank" class="pr-2 fi-color"><i class="fab fa-youtube"></i></a>
     <a href="#" target="_blank" class="pr-2 fi-color"><i class="fab fa-google-plus-g"></i></a>
     <a href="#" target="_blank" class="pr-2 fi-color"><i class="fas fa-rss"></i></a>
    </div>
    <div class="col-md-6 text-right">
     <small>Designed by Nishant kumar, atul kumar sharma, vaibhav gupta, sandeep yadav, shashi kant singh,saurabh kumar sagar&copy; 2021</small>
     <small class="ml-2"><a href="Admin/login.jsp">Admin Login</a></small>
    </div>
   </div>
  </div>
 </footer>

 <script src="js/jquery.min.js"></script>
 <script src="js/popper.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="js/all.min.js"></script>
</body>
</html>