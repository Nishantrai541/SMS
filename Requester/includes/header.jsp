<!-- header.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
 <link rel="stylesheet" href="../css/bootstrap.min.css">

 <link rel="stylesheet" href="../css/all.min.css">

 <link rel="stylesheet" href="../css/custom.css">

 <title><%=TITLE%></title>
</head>
<body>
 <nav class="navbar navbar-dark fixed-top bg-danger flex-md-nowrap p-0 shadow"><a class="navbar-brand col-sm-3 col-md-2 mr-0" href="RequesterProfile.jsp">service</a></nav>

 <div class="container-fluid" style="margin-top:40px;">
  <div class="row">
   <nav class="col-sm-2 bg-light sidebar py-5 d-print-none">
    <div class="sidebar-sticky">
     <ul class="nav flex-column">
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("RequesterProfile")){out.println("active");} %> "href="RequesterProfile.jsp"><i class="fas fa-user"></i>Profile</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("SubmitRequest")){out.println("active");} %> "href="SubmitRequest.jsp"><i class="fab fa-accessible-icon"></i>Submit Request</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("CheckStatus")){out.println("active");} %> "href="CheckStatus.jsp"><i class="fab fa-accessible-icon"></i>Service Status</a></li>
      <li class="nav-item"><a class="nav-link <% if(PAGE.equals("Requesterchangepass")){out.println("active");} %>" href="Requesterchangepass.jsp"><i class="fas fa-key"></i>Change Password</a></li>
      <li class="nav-item"><a class="nav-link" href="../logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
     </ul>
    </div>
   </nav>