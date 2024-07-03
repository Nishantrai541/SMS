<!-- Requesterchangepass.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Change Password";
   String PAGE = "Requesterchangepass";
%>
<%@ include file="includes/header.jsp"%>
<%
String rEmail = "";
String passupdate = request.getParameter("passupdate");
String newpassword = request.getParameter("rPassword");
String passmsg = "";
dbConnection db;
String sql = "";
if(session.getAttribute("is_login")==null){
  response.sendRedirect("RequesterLogin.jsp");
} else {
    rEmail = (String)session.getAttribute("email");
}

if(!(passupdate==null)){
 if(newpassword.equals("")){
  passmsg = "<div class=" + "\"alert alert-warning col-sm-6 mt-2" + "\"role=" + "alert" +">Fill All Fields</div>";

 } else {
    db = new dbConnection();
    sql = "UPDATE requesterlogin_tb set r_password="+ "\"" + newpassword +"\""+ " WHERE r_email=" + "\""+rEmail+ "\"";
    int i = db.indata(sql);
    db.closeConnection();
    if(i==1){
    passmsg = "<div class=" + "\"alert alert-success col-sm-6 mt-2" + "\"role=" + "alert" +">Updated Successfully</div>";
  } else {
    passmsg = "<div class=" + "\"alert alert-danger col-sm-6 mt-2" + "\"role=" + "alert" +">Unable to Update</div>";
  }
}
}

%>
<div class="col-sm-9 col-md-10"> <!-- Start User Change Password Form 2nd Column -->
 <form class="mt-5 mx-5" action="" method="POST">
  <div class="form-group">
   <label for="inputEmail">Email</label>
   <input type="email" class="form-control" id="inputEmail" value="<%=rEmail%>" readonly>
  </div>
  <div class="form-group">
   <label for="inputnewpassword">New Password</label>
   <input type="password" class="form-control" id="inputnewpassword" placeholder="New Password" name="rPassword">
  </div>
  <button type="submit" class="btn btn-danger mr-4 mt-4" name="passupdate">Update</button>
  <button type="reset" class="btn btn-secondary mt-4">Reset</button>
  <%if(!(passmsg.equals(""))){out.println(passmsg);}%>
 </form>
</div> <!-- End User Change Password Form 2nd Column -->

<%@ include file="includes/footer.jsp"%>