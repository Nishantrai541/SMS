 <!-- Technician-login.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<%
    String msg = "";
    if(request.getMethod().equals("POST")) {
        ResultSet rs = null;
        String email = request.getParameter("rEmail");
        String password = request.getParameter("rPassword");
        dbConnection db = new dbConnection();
        String sql = "SELECT * FROM technician_tb WHERE empEmail=" + "\"" + email + "\"" + " AND empPass=" + "\"" + password + "\"";
        rs = db.data(sql);
        if(rs.next()){
            session.setAttribute("email", email);
            session.setAttribute("is_login", 1);
            response.sendRedirect("technician-profile.jsp");
            db.closeConnection();
        } else {
            msg = "<div class=" + "\"alert alert-warning mt-2" + "\"" + ">Enter Valid Email and Password</div>";
        }


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
  <span>Service Management Service(SMS)</span>
 </div>
 <p class="text-center" style="font-size:20px;"><i class="fas fa-user-secret text-danger"></i>Technician Area</p>
 <div class="container-fluid">
  <div class="row justify-content-center custom-margin">
   <div class="col-sm-6 col-md-4">
    <form action="" class="shadow-lg p-4" method="POST">
     <div class="form-group">
      <i class="fas fa-user"></i><label for="email" class="font-weight-bold pl-2">Email</label><input type="email" class="form-control" placeholder="Email" name="rEmail">
      <small class="form-text">We'll never share your email with anyone else.</small>
     </div>
     <div class="form-group">
      <i class="fas fa-key"></i><label for="pass" class="font-weight-bold pl-2">Password</label><input type="password" class="form-control" placeholder="Password" name="rPassword">
     </div>
     <button type="submit" class="btn btn-outline-danger mt-3 font-weight-bold btn-block shadow-sm">Login</button>
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