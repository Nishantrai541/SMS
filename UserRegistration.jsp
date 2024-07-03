<!-- UserRegistration.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<%
  String rName = request.getParameter("rName");
  String rEmail = request.getParameter("rEmail");
  String rPassword = request.getParameter("rPassword");
  String regmsg = "";
  String sql="";
  String rSignup = request.getParameter("rSignup");
  ResultSet rs = null;
  if(!(rSignup==null)){
    // Checking for Empty Fields
    if((rName.equals("")) || (rEmail.equals("")) || (rPassword.equals(""))){
      regmsg = "<div class=" + "\"alert alert-warning mt-2" + "\"role=" + "alert" +">All Fields are Required</div>";

    } else {
      // Email Already Registered
      sql = "SELECT * FROM requesterlogin_tb WHERE r_email=" + "\"" + rEmail + "\"";
      dbConnection db = new dbConnection();
      rs = db.data(sql);
      if(rs.next()){
        regmsg = "<div class=" + "\"alert alert-warning mt-2" + "\"role=" + "alert" +">Email ID Already Registered</div>";

      } else {
          // Assigning User's Values to Variables
          sql = "INSERT INTO requesterlogin_tb(r_name, r_email, r_password) VALUES('"+rName+"','"+rEmail+"','"+rPassword+"')";
          db = new dbConnection();
          int i = db.indata(sql);
          db.closeConnection();
          if(i == 1){
            regmsg = "<div class=" + "\"alert alert-success mt-2" + "\"role=" + "alert" +">Account Succefully Created</div>";
          } else {
            regmsg = "<div class=" + "\"alert alert-danger mt-2" + "\"role=" + "alert" +">Unable to Create Account</div>";
          }
        }
    } 
  }
%>

<div class="container pt-5" id="registration">
  <h2 class="text-center">Create an Account</h2>
  <div class="row mt-4 mb-4">
   <div class="col-md-6 offset-md-3">
    <form action="" class="shadow-lg p-4" method="POST">
     <div class="form-group">
      <i class="fas fa-user"></i> <label for="name" class="font-weight-bold pl-2">Name</label><input type="text" class="form-control" placeholder="Name" name="rName">
     </div>
     <div class="form-group">
      <i class="fas fa-user"></i> <label for="email" class="font-weight-bold pl-2">Email</label><input type="email" class="form-control" placeholder="Email" name="rEmail">
      <small class="form-text">We'll never share your email with anyone else.</small>
     </div>
     <div class="form-group">
      <i class="fas fa-key"></i> <label for="pass" class="font-weight-bold pl-2">New Password</label><input type="password" class="form-control" placeholder="Password" name="rPassword">
     </div>
     <button type="submit" class="btn btn-danger mt-5 btn-block shadow-sm font-weight-bold" name="rSignup">Sign Up</button>
     <em style="font-size:10px;">Note - By clicking Sign Up, you agree to our Terms, Data Policy and Cookie Policy</em>
     <% if(!(regmsg.equals(""))) {out.println(regmsg);} %>
    </form>
   </div>
  </div>
 </div>