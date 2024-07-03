<!-- insertreq.jsp -->
<%@page import="SMS.dbConnection"%>
<%@page import="java.util.*, java.sql.*"%>
<% 
   String TITLE = "Update Requester";
   String PAGE = "requesters";
%>
<%@ include file="includes/header.jsp"%>

<%
Integer is_adminlogin = (Integer)session.getAttribute("is_adminlogin");
String aEmail = "";
String sql= "";
dbConnection db = null;
ResultSet rs = null;
String msg = "";
String r_name = request.getParameter("r_name");
String r_login_id = request.getParameter("id");
String r_email = request.getParameter("r_email");
String r_password = request.getParameter("r_password");
String edit = request.getParameter("edit");
String reqsubmit = request.getParameter("reqsubmit");


if(is_adminlogin == null){
  response.sendRedirect("login.jsp");
} else {
  aEmail = (String)session.getAttribute("aEmail");
}
if(!(reqsubmit == null)){
  if((r_password.equals("")) || (r_name.equals("")) || (r_email.equals(""))){
    msg = "<div class='alert alert-warning col-sm-6 mt-2' role='alert'> Fill All Fileds </div>";
  } else {
    sql = "INSERT INTO requesterlogin_tb (r_name, r_email, r_password) VALUES ('"+r_name+"','"+r_email+"','"+r_password+"')";
    db = new dbConnection();
    int i = db.indata(sql);
    db.closeConnection();
    if(i==1000){
      msg = "<div class='alert alert-danger col-sm-6 mt-2' role='alert'> Unable to Add </div>";
    } else {
      msg = "<div class='alert alert-success col-sm-6 mt-2' role='alert'> Added Successfully </div>";
    }
  }
  }
%>
<!-- Start 2nd Column -->
<div class="col-sm-6 mt-5  mx-3 jumbotron">
  <h3 class="text-center">Add New Requester</h3>
  <form action="" method="POST">
    <div class="form-group">
      <label for="r_name">Name</label>
      <input type="text" class="form-control" id="r_name" name="r_name">
    </div>
    <div class="form-group">
      <label for="r_email">Email</label>
      <input type="email" class="form-control" id="r_email" name="r_email">
    </div>
    <div class="form-group">
      <label for="r_password">Password</label>
      <input type="password" class="form-control" id="r_password" name="r_password">
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-danger" id="reqsubmit" name="reqsubmit">Submit</button>
      <a href="requester.jsp" class="btn btn-secondary">Close</a>
    </div>
    <%if(!(msg.equals(""))){out.println(msg);}%>
  </form>
</div>
<%@ include file = "includes/footer.jsp" %>
