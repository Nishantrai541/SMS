<!-- changepass.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Change Password";
   String PAGE = "changepass";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
String passmsg="";

String passupdate = request.getParameter("passupdate");
String aPassword = request.getParameter("aPassword");


if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}

if(!(passupdate==null)){
 if(aPassword.equals("")){
  passmsg = "<div class='alert alert-warning col-sm-6 mt-2'>Fill All Fields</div>";
 } else {
  sql = "UPDATE adminlogin_tb SET a_password = " + "\"" + aPassword + "\"" + " WHERE a_email = " + "\"" + aEmail + "\"";
  db = new dbConnection();
  int i = db.indata(sql);
  db.closeConnection();
  if(i == 1000){
    passmsg = "<div class='alert alert-danger col-sm-6 mt-2'>Unable to Update</div>";
  } else {
    passmsg = "<div class='alert alert-success col-sm-6 mt-2'>Updated Successfully</div>";

  }
 }
}
%>
<div class="col-sm-9 col-md-10"> <!-- Start Admin Change Password Form 2nd Column -->
 <form class="mt-5 mx-5" action="" method="POST">
  <div class="form-group">
   <label for="inputEmail">Email</label>
   <input type="email" class="form-control" id="inputEmail" value="<%=aEmail%>" readonly>
  </div>
  <div class="form-group">
   <label for="inputnewpassword">New Password</label>
   <input type="password" class="form-control" id="inputnewpassword" placeholder="New Password" name="aPassword">
  </div>
  <button type="submit" class="btn btn-danger mr-4 mt-4" name="passupdate">Update</button>
  <button type="reset" class="btn btn-secondary mt-4">Reset</button>
  <%if(!(passmsg.equals(""))){out.println(passmsg);}%>
</form>
</div> <!-- End Admin Change Password Form 2nd Column -->

<%@ include file = "includes/footer.jsp" %>