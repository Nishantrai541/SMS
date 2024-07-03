<!-- header.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- Bootstrap CSS -->
 <link rel="stylesheet" href="../css/bootstrap.min.css">

 <!-- Font Awesome CSS -->
 <link rel="stylesheet" href="../css/all.min.css">

 <!-- Custom CSS -->
 <link rel="stylesheet" href="../css/custom.css"> 
 
 <title><%=TITLE%></title>
</head>
<body>
  <!-- Top Navbar -->
  <nav class="navbar navbar-dark fixed-top bg-danger flex-md-nowrap p-0 shadow"><a class="navbar-brand col-sm-3 col-md-2 mr-0" href="dashboard.jsp">SMS</a></nav>

  <!-- Start Container -->
 <div class="container-fluid" style="margin-top:40px;">
  <div class="row"> <!-- Start Row -->
   <nav class="col-sm-2 bg-light sidebar py-5 d-print-none"> <!-- Start Side Bar 1st Column -->
    <div class="sidebar-sticky">
     <ul class="nav flex-column">
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("dashboard")){out.println("active");} %> "href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i>Dashboard</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("work")){out.println("active");} %> "href="work.jsp"><i class="fab fa-accessible-icon"></i>Work Order</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("request")){out.println("active");} %> "href="request.jsp"><i class="fas fa-align-center"></i>Requests</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("assets")){out.println("active");} %> "href="assets.jsp"><i class="fas fa-database"></i>Assets</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("technician")){out.println("active");} %> "href="technician.jsp"><i class="fab fa-teamspeak"></i>Technician</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("requesters")){out.println("active");} %> "href="requester.jsp"><i class="fas fa-users"></i>Requester</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("sellreport")){out.println("active");} %> "href="soldproductreport.jsp"><i class="fas fa-table"></i>Sell Report</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("workreport")){out.println("active");} %> "href="workreport.jsp"><i class="fas fa-table"></i>Work Report</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("changepass")){out.println("active");} %> "href="changepass.jsp"><i class="ffas fa-key"></i>Change Password</a></li>
      <li class="nav-item"><a class="nav-link" href="../logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
     </ul>
    </div>
   </nav> <!-- End Side Bar 1st Column -->