<!-- login.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
 Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
 String aEmail = request.getParameter("aEmail");
 String aPassword = request.getParameter("aPassword");
 String sql;
 String msg = "";
 dbConnection db = null;
 ResultSet rs = null;
 if(is_adminlogin == null){
  if(!(aEmail == null)){
    db = new dbConnection();
    sql = "SELECT a_email, a_password FROM adminlogin_tb WHERE a_email = " + "\"" + aEmail + "\"" + " AND a_password = "+ "\"" + aPassword + "\"";
    rs = db.data(sql);
    if(rs.next()){
        session.setAttribute("is_adminlogin", 1);
        session.setAttribute("aEmail", aEmail);
        response.sendRedirect("dashboard.jsp");
        db.closeConnection();
    } else {
        msg = "<div class='alert alert-warning mt-2'>Enter Valid Email and Password</div>";
    }
  }
 } else {
    response.sendRedirect("dashboard.jsp");
 }
%>

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

 <style>
  .custom-margin {
   margin-top: 8vh;
  }
 </style>

 <title>Login</title>
</head>
<body>
 <div class="mb-3 mt-5 text-center" style="font-size: 30px;">
  <i class="fas fa-stethoscope"></i>
  <span>Online Service Management System</span>
 </div>
 <p class="text-center" style="font-size:20px;"><i class="fas fa-user-secret text-danger"></i>Admin Area (Demo)</p>
 <div class="container-fluid">
  <div class="row justify-content-center custom-margin">
   <div class="col-sm-6 col-md-4">
    <form action="" class="shadow-lg p-4" method="POST">
     <div class="form-group">
      <i class="fas fa-user"></i><label for="email" class="font-weight-bold pl-2">Email</label><input type="email" class="form-control" placeholder="Email" name="aEmail">
      <small class="form-text">We'll never share your email with anyone else.</small>
     </div>
     <div class="form-group">
      <i class="fas fa-key"></i><label for="pass" class="font-weight-bold pl-2">Password</label><input type="password" class="form-control" placeholder="Password" name="aPassword">
     </div>
     <button type="submit" class="btn btn-outline-dark mt-3 font-weight-bold btn-block shadow-sm">Login</button>
     <%if(!(msg.equals(""))){out.println(msg);}%>
    </form>
    <div class="text-center"><a href="../index.jsp" class="btn btn-info mt-3 font-weight-bold shadow-sm">Back to Home</a></div>
   </div>
  </div>
 </div>

 <!-- JavaScript Files -->
 <script src="../js/jquery.min.js"></script>
 <script src="../js/popper.min.js"></script>
 <script src="../js/bootstrap.min.js"></script>
 <script src="../js/all.min.js"></script>
</body>
</html>